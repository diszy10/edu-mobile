import 'package:scoped_model/scoped_model.dart';

import '../models/due.dart';
import '../models/upcoming.dart';
import '../models/overdue.dart';
import '../models/homework.dart';

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

  List<Due> get upcomingList {
    return List.from(_upcomingList);
  }

  List<Due> get overdueList {
    return List.from(_overdueList);
  }
}
