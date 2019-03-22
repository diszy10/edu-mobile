import 'package:flutter/material.dart';

class Activity {
  final String imageUrl, subject, author, timeStamp, description;
  final Color leftBorderColor;

  Activity(this.subject, this.author, this.timeStamp, this.description,
      {this.leftBorderColor = Colors.black,
      this.imageUrl =
          'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg'});
}
