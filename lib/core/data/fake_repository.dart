import 'package:edukasi_mobile/core/data/repository.dart';
import 'package:edukasi_mobile/core/models/models.dart';
import 'package:flutter/material.dart';

class FakeRepository extends Repository {
  @override
  Future<List<Student>> getStudents({@required String userId}) {
    return Future.delayed(Duration(milliseconds: 1), () {
      if (userId == '1')
        return [
          Student(
            id: '1',
            name: 'Zalina Raine Wyllie',
            photo:
                'https://asianparent-assets-id.dexecure.net/wp-content/uploads/sites/24/2018/08/WhatsApp-Image-2018-08-03-at-22.05.39-886x1024.jpeg',
          ),
          Student(
            id: '2',
            name: 'Muhammad Adhiyat',
            photo:
                'https://asset.kompas.com/crops/P66BztO4TV-ySZuP7U8F8VsWZ4M=/31x0:875x563/750x500/data/photo/2017/10/21/1363546878.jpg',
          )
        ];
      else if (userId == '2')
        return [
          Student(
            id: '3',
            name: 'Olivia',
            photo:
                'https://images.unsplash.com/photo-1489673446964-e1f989187ddc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=878&q=80',
          ),
        ];
      else
        throw ('Students not found.');
    });
  }

  @override
  Future<List<Activity>> getActivity({@required String studentId}) {
    return Future.delayed(Duration(milliseconds: 1), () {
      if (studentId == '1')
        return [
          Activity(
            teacherName: 'Tirtayasa Saragih',
            teacherSubject: 'Science',
            urlPhoto:
                'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg',
            isTeaching: true,
            classActivity: [
              ClassActivity(
                  timestamp: '10.30',
                  content:
                      'Tirtayasa distributed homeworks "Xenomorph Anatomy"',
                  dotColor: Color(0xFFFFBA01)),
              ClassActivity(
                  timestamp: '9.45',
                  content: 'Teaching "Xenomorph Anatomy"',
                  dotColor: Color(0xFF43e97b)),
              ClassActivity(
                  timestamp: '9.30',
                  content: 'Raline is absent in my class',
                  dotColor: Color(0xFFFF8888)),
            ],
          ),
          Activity(
            teacherName: 'Vanya Sitorus',
            teacherSubject: 'Math',
            urlPhoto:
                'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg',
            isTeaching: false,
            classActivity: [
              ClassActivity(
                  timestamp: '08.50',
                  content:
                      'Vanya distributed homeworks "Compared decimal place value"',
                  dotColor: Color(0xFFFFBA01)),
              ClassActivity(
                  timestamp: '07.30',
                  content: 'Teaching "Decimals"',
                  dotColor: Color(0xFF43e97b)),
            ],
          ),
        ];
      else if (studentId == '2')
        return [
          Activity(
            teacherName: 'Margana Wastuti',
            teacherSubject: 'Art Teacher',
            urlPhoto:
                'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg',
            isTeaching: true,
            classActivity: [
              ClassActivity(
                  timestamp: '08.50',
                  content:
                      'Margana distributed homeworks "Create design prototype"',
                  dotColor: Color(0xFFFFBA01)),
              ClassActivity(
                  timestamp: '07.30',
                  content: 'Teaching "Sketch"',
                  dotColor: Color(0xFF43e97b)),
            ],
          ),
        ];
      else if (studentId == '3')
        return [
          Activity(
            teacherName: 'Vanya Sitorus',
            teacherSubject: 'Math',
            urlPhoto:
                'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg',
            isTeaching: true,
            classActivity: [
              ClassActivity(
                  timestamp: '08.50',
                  content:
                      'Vanya distributed homeworks "Compared decimal place value"',
                  dotColor: Color(0xFFFFBA01)),
              ClassActivity(
                  timestamp: '07.30',
                  content: 'Teaching "Decimals"',
                  dotColor: Color(0xFF43e97b)),
            ],
          ),
        ];
      else
        throw ('Activities not found.');
    });
  }
}
