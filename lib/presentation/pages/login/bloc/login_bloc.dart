import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:edukasi_mobile/core/data/user_repository.dart';
import 'package:edukasi_mobile/presentation/blocs/auth/bloc.dart';
import 'package:edukasi_mobile/presentation/pages/login/bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        await Future.delayed(Duration(milliseconds: 1500));
        final token = await userRepository.authenticate(
          email: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (e) {
        yield LoginFailure(error: e.toString());
      }
    }
  }
}
