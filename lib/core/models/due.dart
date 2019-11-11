class Due {
  final String date, dayOfWeek, deadline;
  final int totalHomeworks;
  final List<Upcoming> upcoming;
  final List<Overdue> overdue;

  Due(
      {this.date,
      this.dayOfWeek,
      this.deadline,
      this.totalHomeworks,
      this.upcoming,
      this.overdue});
}

class Homework {
  final String title, content;

  Homework({this.title, this.content});
}

class Upcoming {
  final String subject, topic, dueDate;
  final int totalHomeWorks;
  final List<Homework> homework;

  Upcoming(
      {this.subject,
      this.topic,
      this.dueDate,
      this.totalHomeWorks,
      this.homework});
}

class Overdue {
  final String subject, topic, dueDate;
  final int totalHomeWorks;
  final List<Homework> homework;

  Overdue(
      {this.subject,
      this.topic,
      this.dueDate,
      this.totalHomeWorks,
      this.homework});
}
