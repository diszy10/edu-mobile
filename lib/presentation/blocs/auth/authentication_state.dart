import 'package:edukasi_mobile/core/models/student.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final Student activeStudent;

  AuthenticationAuthenticated({this.activeStudent});
}

class AuthenticationUnauthenticated extends AuthenticationState {}
