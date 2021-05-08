import 'package:edukasi_mobile/core/models/models.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class FetchedUser extends UserState {
  final User user;

  FetchedUser({@required this.user});
}
