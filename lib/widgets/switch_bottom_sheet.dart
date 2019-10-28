import 'package:flutter/material.dart';

import 'package:edukasi_mobile/models/models.dart';

class SwitchBottomSheet extends StatelessWidget {
  final _studentList = [
    Student(
        name: 'Zalina Raine Wyllie',
        urlPhoto:
            'https://asianparent-assets-id.dexecure.net/wp-content/uploads/sites/24/2018/08/WhatsApp-Image-2018-08-03-at-22.05.39-886x1024.jpeg'),
    Student(
        name: 'Muhammad Adhiyat',
        urlPhoto:
            'https://awsimages.detik.net.id/community/media/visual/2017/10/12/b6f6a923-3802-466d-b265-71d84d49b3fc_169.jpg?w=780&q=90'),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Student list
              Expanded(child: _buildStudentList(_studentList)),
              SizedBox(height: 16.0),

              /// Settings icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle, color: Color(0xFF838C97)),
                      child: Icon(Icons.settings, color: Colors.white)),
                  SizedBox(width: 16.0),
                  Text('Settings',
                      style:
                          TextStyle(fontSize: 20.0, color: Color(0xFF838C97)))
                ],
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStudentList(List<Student> student) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: student.length,
      itemBuilder: (context, index) => StudentList(student: student[index]),
    );
  }
}

class StudentList extends StatelessWidget {
  final Student student;

  StudentList({@required this.student});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              /// Student photo
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(student.urlPhoto),
                  ),
                ),
              ),
              SizedBox(width: 24.0),

              /// Student name text
              Text(
                student.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
