import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:edukasi_mobile/core/data/repository.dart';
import 'package:edukasi_mobile/core/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './bloc.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final Repository repository;

  StudentBloc({@required this.repository});

  @override
  StudentState get initialState => StudentLoading();

  @override
  Stream<StudentState> mapEventToState(
    StudentEvent event,
  ) async* {
    if (event is SetActiveStudent) {
      yield StudentLoading();
      yield ActiveStudentLoaded(event.student);
    }
    if (event is FetchStudents) {
      yield StudentLoading();

      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      User user = User.fromJson(json.decode(_prefs.getString('user')));
      final students = await repository.getStudents(userId: user.id);

      yield StudentsLoaded(students);
    }
  }
}
