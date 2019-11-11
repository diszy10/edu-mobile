import 'package:edukasi_mobile/core/models/student.dart';
import 'package:equatable/equatable.dart';

abstract class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => null;
}

class FetchActivityByStudent extends ActivityEvent {
  final Student student;

  FetchActivityByStudent(this.student);
}
