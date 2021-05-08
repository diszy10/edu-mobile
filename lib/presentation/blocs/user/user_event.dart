import 'package:meta/meta.dart';

@immutable
abstract class UserEvent {}

class GetUser extends UserEvent {}
