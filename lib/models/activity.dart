import 'package:flutter/material.dart';

class Activity {
  final String teacherName, teacherSubject, urlPhoto;
  final bool isTeaching;
  final List<ClassActivity> classActivity;

  Activity(
      {this.teacherName,
      this.teacherSubject,
      this.urlPhoto,
      this.isTeaching,
      this.classActivity});
}

class ClassActivity {
  final String content, timestamp;
  final Color dotColor;

  ClassActivity({this.content, this.timestamp, this.dotColor});
}
