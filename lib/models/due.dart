import './upcoming.dart';
import './overdue.dart';

class Due {
  final DateTime date;
  final String day;
  final List<Upcoming> upcoming;
  final List<Overdue> overdue;

  Due({this.date, this.day, this.upcoming, this.overdue});

}
