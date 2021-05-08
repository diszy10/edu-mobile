import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:edukasi_mobile/presentation/blocs/tab/tab_model.dart';
import './bloc.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.activity;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
