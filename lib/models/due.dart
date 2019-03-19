import './upcoming.dart';
import './overdue.dart';

class Due {
  final String dayShort, date, day;
  final List<Upcoming> upcoming;
  final List<Overdue> overdue;

  Due({this.dayShort, this.date, this.day, this.upcoming, this.overdue});

}
