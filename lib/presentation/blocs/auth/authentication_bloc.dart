import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:edukasi_mobile/core/data/fake_repository.dart';
import 'package:edukasi_mobile/core/data/user_repository.dart';
import 'package:edukasi_mobile/core/models/student.dart';
import 'package:edukasi_mobile/core/models/user.dart';
import 'package:edukasi_mobile/presentation/blocs/auth/bloc.dart';
import 'package:flutter/foundation.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final FakeRepository repository;

  AuthenticationBloc({@required this.userRepository, @required this.repository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationUninitialized();
      await Future.delayed(Duration(milliseconds: 1000));

      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        final User loggedUser = await userRepository.getLoggedUser();

        List<Student> students =
            await repository.getStudents(userId: loggedUser.id);
        yield AuthenticationAuthenticated(activeStudent: students[0]);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await Future.delayed(Duration(milliseconds: 500));

      await userRepository.persistToken(event.token);
      final User loggedUser = await userRepository.getLoggedUser();

      List<Student> students =
          await repository.getStudents(userId: loggedUser.id);
      yield AuthenticationAuthenticated(activeStudent: students[0]);
    }

    if (event is ChangeActiveStudent) {
      yield AuthenticationLoading();
      await Future.delayed(Duration(milliseconds: 500));

      yield AuthenticationAuthenticated(activeStudent: event.student);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await Future.delayed(Duration(milliseconds: 500));

      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
