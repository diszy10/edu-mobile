import 'package:edukasi_mobile/core/models/models.dart';
import 'package:flutter/foundation.dart';

abstract class Repository {
  // Get list of students by parent userId
  Future<List<Student>> getStudents({@required String userId});

  // Get list of activity by parent userId
  Future<List<Activity>> getActivity({@required String studentId});
}
