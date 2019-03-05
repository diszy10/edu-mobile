import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:edukasi_mobile/app.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EdukasiApp());
}
