import 'package:flutter/material.dart';

class Activity {
  String id, teacherName, teacherSubject, urlPhoto;
  bool isTeaching;
  List<ClassActivity> classActivity;

  Activity(
      {this.id,
      this.teacherName,
      this.teacherSubject,
      this.urlPhoto,
      this.isTeaching,
      this.classActivity});

  Activity.fromJson(Map<String, dynamic> json) {
    var list = json['class_activity'] as List;
    List<ClassActivity> classActivityList =
        list.map((i) => ClassActivity.fromJson(i)).toList();

    id = json['id'];
    teacherName = json['teacher_name'];
    teacherSubject = json['teacher_subject'];
    urlPhoto = json['url_photo'];
    isTeaching = json['is_teaching'];
    classActivity = classActivityList;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class ClassActivity {
  String content, timestamp;
  Color dotColor;

  ClassActivity({this.content, this.timestamp, this.dotColor});

  ClassActivity.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    timestamp = json['timestamp'];
    dotColor = json['dot_color'];
  }
}
