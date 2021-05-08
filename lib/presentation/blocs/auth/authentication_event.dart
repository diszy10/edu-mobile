import 'package:edukasi_mobile/core/models/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class ChangeActiveStudent extends AuthenticationEvent {
  final Student student;

  ChangeActiveStudent(this.student);
}

class LoggedOut extends AuthenticationEvent {}
