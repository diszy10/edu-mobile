
import './activity_class.dart';

class Activity {
  final String teacherPhoto, teacherName, teacherSubject;
  final bool isTeaching;
  final List<ActivityClass> activityClass;

  Activity(
      {this.teacherPhoto,
      this.teacherName,
      this.teacherSubject,
      this.isTeaching,
      this.activityClass});
}