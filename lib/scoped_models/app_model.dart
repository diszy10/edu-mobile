import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/student.dart';
import '../models/activity.dart';
import '../models/activity_class.dart';
import '../models/due.dart';
import '../models/upcoming.dart';
import '../models/overdue.dart';
import '../models/homework.dart';
import '../models/inbox.dart';
import '../models/update.dart';

class AppModel extends Model {

  final _studentList = [
    Student(
        name: 'Zalina Raine Wyllie',
        urlPhoto:
            'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg'),
    Student(
        name: 'Alex Heisenberg',
        urlPhoto:
            'https://img.okeinfo.net/content/2017/06/19/33/1720301/foto-makin-tampan-rafathar-kalahkan-raffi-ahmad-LzkVtyuJaz.jpg'),
  ];

  final _activityList = [
    Activity(
        teacherName: 'Tirtayasa Saragih',
        teacherPhoto:
            'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg',
        teacherSubject: 'Science Teacher',
        isTeaching: true,
        activityClass: [
          ActivityClass(
              timeStamp: '10.30',
              content: 'Tirtayasa distributed homeworks "Xenomorph Anatomy"',
              shapeColor: Color(0xFFFFBA01),
              iconColor: Color(0xFFD86A00)),
          ActivityClass(
              timeStamp: '9.45',
              content: 'Teaching "Xenomorph Anatomy"',
              shapeColor: Color(0xFF43e97b),
              iconColor: Color(0xFFD86A00)),
          ActivityClass(
              timeStamp: '9.30',
              content: 'Raline is absent in my class',
              shapeColor: Color(0xFFFF8888),
              iconColor: Color(0xFFD86A00)),
        ]),
    Activity(
        teacherName: 'Vanya Sitorus',
        teacherPhoto:
            'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg',
        teacherSubject: 'Math Teacher',
        isTeaching: false,
        activityClass: [
          ActivityClass(
              timeStamp: '08.50',
              content:
                  'Vanya distributed homeworks "Compared decimal place value"',
              shapeColor: Color(0xFFFFBA01),
              iconColor: Color(0xFFB21717)),
          ActivityClass(
              timeStamp: '07.30',
              content: 'Teaching "Decimals"',
              shapeColor: Color(0xFF43e97b),
              iconColor: Color(0xFF5367AF)),
        ]),
  ];

  final _upcomingList = [
    Due(date: DateTime(2019, 3, 18), day: 'Today', upcoming: [
      Upcoming(
          subject: 'Math & Logic',
          topic: 'Decimal fractions and place value patterns',
          totalHomework: 2,
          dueDate: 'Monday, 18 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                no: 2,
                lesson: 'Place Value and Rounding',
                content:
                    '100+60+1 = ... \n90+80+3 = ... \n120+76+90 = ... \n250+123+9 = ...')
          ]),
      Upcoming(
          subject: 'Indonesian (Language & Literature)',
          topic: 'How animals reproduce',
          totalHomework: 1,
          dueDate: 'Monday, 18 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
          ]),
    ]),
    Due(date: DateTime(2019, 3, 19), day: 'Tomorrow', upcoming: [
      Upcoming(
          subject: 'Science',
          topic: 'Decimal fractions and place value patterns',
          totalHomework: 2,
          dueDate: 'Monday, 19 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                no: 2,
                lesson: 'Place Value and Rounding',
                content:
                    '100+60+1 = ... \n90+80+3 = ... \n120+76+90 = ... \n250+123+9 = ...')
          ]),
      Upcoming(
          subject: 'Korean (Language & Literature)',
          topic: 'Decimal fractions and place value patterns',
          totalHomework: 2,
          dueDate: 'Monday, 19 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                no: 2,
                lesson: 'Place Value and Rounding',
                content:
                    '100+60+1 = ... \n90+80+3 = ... \n120+76+90 = ... \n250+123+9 = ...')
          ]),
      Upcoming(
          subject: 'Physics',
          topic: 'How animals reproduce',
          totalHomework: 1,
          dueDate: 'Monday, 19 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
          ]),
    ]),
  ];

  final _overdueList = [
    Due(date: DateTime(2019, 3, 14), overdue: [
      Overdue(
          subject: 'Social',
          topic: 'Decimal fractions and place value patterns',
          totalHomework: 2,
          dueDate: 'Monday, 14 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                no: 2,
                lesson: 'Place Value and Rounding',
                content:
                    '100+60+1 = ... \n90+80+3 = ... \n120+76+90 = ... \n250+123+9 = ...')
          ]),
      Overdue(
          subject: 'Art',
          topic: 'Decimal fractions and place value patterns',
          totalHomework: 2,
          dueDate: 'Monday, 14 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                no: 2,
                lesson: 'Place Value and Rounding',
                content:
                    '100+60+1 = ... \n90+80+3 = ... \n120+76+90 = ... \n250+123+9 = ...')
          ]),
    ]),
    Due(date: DateTime(2019, 3, 15), overdue: [
      Overdue(
          subject: 'Politics',
          topic: 'Decimal fractions and place value patterns',
          totalHomework: 2,
          dueDate: 'Monday, 15 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                no: 2,
                lesson: 'Place Value and Rounding',
                content:
                    '100+60+1 = ... \n90+80+3 = ... \n120+76+90 = ... \n250+123+9 = ...')
          ]),
    ]),
    Due(date: DateTime(2019, 3, 15), overdue: [
      Overdue(
          subject: 'Politics',
          topic: 'Decimal fractions and place value patterns',
          totalHomework: 2,
          dueDate: 'Monday, 15 March 2019',
          homework: [
            Homework(
                no: 1,
                lesson: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                no: 2,
                lesson: 'Place Value and Rounding',
                content:
                    '100+60+1 = ... \n90+80+3 = ... \n120+76+90 = ... \n250+123+9 = ...')
          ]),
    ]),
  ];

  final _inboxList = [
    Inbox(
        name: 'Latika Puspasari',
        teacher: 'Homeroom Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/close-portrait-smiling-brunette-woman-260nw-530446444.jpg',
        message: 'Sama-sama ibunya cantika',
        timestamp: '1d'),
    Inbox(
        name: 'Vanya Sitorus',
        teacher: 'Math Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg',
        message: 'Baik, sama2 bu',
        timestamp: '15 Mar'),
    Inbox(
        name: 'Natalia Napitupulu',
        teacher: 'English Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg',
        message: 'Terimakasih kembali',
        timestamp: '15 Mar'),
  ];

  final _contactList = [
    Inbox(
        name: 'Latika Puspasari',
        teacher: 'Homeroom Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/close-portrait-smiling-brunette-woman-260nw-530446444.jpg'),
    Inbox(
        name: 'Vanya Sitorus',
        teacher: 'Math Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg'),
    Inbox(
        name: 'Natalia Napitupulu',
        teacher: 'English Teacher',
        message: 'Thank you',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg'),
    Inbox(
        name: 'Tirtayasa Saragih',
        teacher: 'Science Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg'),
    Inbox(
        name: 'Margana Wastuti',
        teacher: 'Art Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg'),
  ];

  final _updateList = [
    Update(
        title: 'Announcement', content: 'Parent meeting', timestamp: '8.30 AM'),
    Update(
        title: 'Teaching session',
        content: 'Ms. Luna teach math',
        timestamp: '9.45 AM'),
    Update(
        title: 'Homework Assignment',
        content: 'New homework assignment for Raine',
        timestamp: '11.30 AM')
  ];

  List<Student> get studentList {
    return List.from(_studentList);
  }

  List<Activity> get activityList {
    return List.from(_activityList);
  }

  List<Due> get upcomingList {
    return List.from(_upcomingList);
  }

  List<Due> get overdueList {
    return List.from(_overdueList);
  }

  List<Inbox> get inboxList {
    return List.from(_inboxList);
  }

  List<Inbox> get contactList {
    return List.from(_contactList);
  }

  List<Update> get updateList {
    return List.from(_updateList);
  }
}
