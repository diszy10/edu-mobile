import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:edukasi_mobile/core/data/repository.dart';
import 'package:edukasi_mobile/core/data/user_repository.dart';
import 'package:edukasi_mobile/core/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository repository;
  final UserRepository userRepository;

  UserBloc({@required this.repository, @required this.userRepository});

  @override
  UserState get initialState => UserLoading();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is GetUser) {
      yield* _mapLoadUserToState();
    }
  }

  Stream<UserState> _mapLoadUserToState() async* {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    User user = User.fromJson(json.decode(_prefs.getString('user')));
    yield FetchedUser(user: user);
  }
}
