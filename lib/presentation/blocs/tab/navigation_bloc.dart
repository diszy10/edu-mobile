import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => ActivityPageState();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    switch (event) {
      case NavigationEvent.activity:
        yield ActivityPageState();
        break;
      case NavigationEvent.due:
        yield DuePageState();
        break;
      case NavigationEvent.inbox:
        yield InboxPageState();
        break;
      case NavigationEvent.update:
        yield UpdatePageState();
        break;
      case NavigationEvent.profile:
        yield ProfilePageState();
        break;
    }
  }
}
