import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:edukasi_mobile/core/data/repository.dart';
import './bloc.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  Repository repository;

  ActivityBloc(this.repository);

  @override
  ActivityState get initialState => ActivityLoading();

  @override
  Stream<ActivityState> mapEventToState(
    ActivityEvent event,
  ) async* {
    if (event is FetchActivityByStudent) {
      yield ActivityLoading();
      try {
        await Future.delayed(Duration(milliseconds: 500));

        yield ActivityLoaded(
            activities:
                await repository.getActivity(studentId: event.student.id));
      } catch (e) {
        yield ActivityError(message: e.toString());
      }
    }
  }
}
