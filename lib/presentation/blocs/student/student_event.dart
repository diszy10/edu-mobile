import 'package:edukasi_mobile/core/models/student.dart';
import 'package:equatable/equatable.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => null;
}

class SetActiveStudent extends StudentEvent {
  final Student student;

  SetActiveStudent(this.student);
}

class FetchStudents extends StudentEvent {}
