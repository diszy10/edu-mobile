import 'package:flutter/material.dart';

const double _base = 640.0;

bool mediaDevice(BuildContext context) {
  final double mediaHeight = MediaQuery.of(context).size.height;
  return mediaHeight > _base;
}

///
/// Get media device height
///
double mediaHeight(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  return height;
}

///
/// Get tabs title font size by device height
///
double titleSize(BuildContext context) {
  final double mediaHeight = MediaQuery.of(context).size.height;
  if (mediaHeight > _base) {
    return 32.0;
  } else {
    return 28.0;
  }
}

///
/// Get subject title font size by device height
///
double subjectSize(BuildContext context) {
  final double mediaHeight = MediaQuery.of(context).size.height;
  if (mediaHeight > _base) {
    return 28.0;
  } else {
    return 24.0;
  }
}

///
/// Get topic title font size by device height
///
double topicSize(BuildContext context) {
  final double mediaHeight = MediaQuery.of(context).size.height;
  if (mediaHeight > _base) {
    return 18.0;
  } else {
    return 16.0;
  }
}

///
/// Get appbar height by device height
///
appBar(BuildContext context, String tab) {
  final double mediaHeight = MediaQuery.of(context).size.height;
  switch (tab) {
    case 'activity':
      {
        if (mediaHeight > 640) {
          return 116.0;
        } else {
          return 108.0;
        }
      }
      break;
    case 'whatsdue':
      {
        if (mediaHeight > 640) {
          return 152.0; // was 162
        } else {
          return 142.0;
        }
      }
      break;
    case 'inbox':
      {
        if (mediaHeight > 640) {
          return 135.0;
        } else {
          return 130.0;
        }
      }
      break;
    case 'update':
      {
        if (mediaHeight > 640) {
          return 116.0;
        } else {
          return 108.0;
        }
      }
      break;
    case 'profile':
      {
        if (mediaHeight > 640) {
          return 116.0;
        } else {
          return 108.0;
        }
      }
      break;
  }
}
