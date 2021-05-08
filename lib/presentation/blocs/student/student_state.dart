import 'package:edukasi_mobile/core/models/student.dart';
import 'package:equatable/equatable.dart';

abstract class StudentState extends Equatable {
  const StudentState();

  @override
  List<Object> get props => [];
}

class StudentLoading extends StudentState {}

class ActiveStudentLoaded extends StudentState {
  final Student student;

  ActiveStudentLoaded(this.student);
}

class StudentsLoaded extends StudentState {
  final List<Student> students;

  StudentsLoaded(this.students);
}
