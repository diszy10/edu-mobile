import 'package:scoped_model/scoped_model.dart';

import '../models/due.dart';
import '../models/upcoming.dart';
import '../models/overdue.dart';
import '../models/homework.dart';
import '../models/inbox.dart';

class AppModel extends Model {
  final _upcomingList = <Due>[
    Due(dayShort: 'MON', date: '18', day: 'Today', upcoming: [
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
          subject: 'Science',
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
    Due(dayShort: 'TUE', date: '19', day: 'Tomorrow', upcoming: [
      Upcoming(
          subject: 'Indonesian (Language & Literature)',
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

  final _overdueList = <Due>[
    Due(dayShort: 'THU', date: '14', overdue: [
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
    Due(dayShort: 'FRI', date: '15', overdue: [
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

  final _inboxList = <Inbox>[
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

  List<Due> get upcomingList {
    return List.from(_upcomingList);
  }

  List<Due> get overdueList {
    return List.from(_overdueList);
  }

  int get getTotalOverdue => overdueList.length;

  List<Inbox> get inboxList {
    return List.from(_inboxList);
  }

  List<Inbox> get contactList {
    return List.from(_contactList);
  }
}
