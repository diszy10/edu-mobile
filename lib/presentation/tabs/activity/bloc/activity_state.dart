import 'package:edukasi_mobile/core/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class ActivityLoading extends ActivityState {
  const ActivityLoading();
}

class ActivityLoaded extends ActivityState {
  final List<Activity> activities;

  const ActivityLoaded({@required this.activities});
}

class ActivityEmpty extends ActivityState {
  @override
  List<Object> get props => null;
}

class ActivityError extends ActivityState {
  final String message;

  const ActivityError({@required this.message});
}
