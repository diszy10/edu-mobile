import 'package:edukasi_mobile/core/data/fake_repository.dart';
import 'package:edukasi_mobile/presentation/blocs/student/bloc.dart';
import 'package:edukasi_mobile/presentation/blocs/tab/bloc.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/tabs/activity/activity_tab.dart';
import 'package:edukasi_mobile/presentation/tabs/activity/bloc/bloc.dart';
import 'package:edukasi_mobile/presentation/tabs/inbox.dart';
import 'package:edukasi_mobile/presentation/tabs/profile.dart';
import 'package:edukasi_mobile/presentation/tabs/update.dart';
import 'package:edukasi_mobile/presentation/tabs/whats_due.dart';
import 'package:edukasi_mobile/presentation/widgets/widgets.dart' as widget;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final repository = FakeRepository();
  NavigationBloc _navigationBloc;

  @override
  void initState() {
    super.initState();
    _navigationBloc = NavigationBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _navigationBloc,
      builder: (_, state) {
        if (state is ActivityPageState) {
          return _buildScaffold(
            BlocBuilder(
              bloc: BlocProvider.of<StudentBloc>(context),
              builder: (_, state) {
                if (state is ActiveStudentLoaded) {
                  return BlocProvider<ActivityBloc>(
                    builder: (context) => ActivityBloc(repository)
                      ..add(FetchActivityByStudent(state.student)),
                    child: ActivityTab(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            state.index,
          );
        }
        if (state is DuePageState) {
          return _buildScaffold(WhatsDuePage(), state.index);
        }
        if (state is InboxPageState) {
          return _buildScaffold(InboxPage(), state.index);
        }
        if (state is UpdatePageState) {
          return _buildScaffold(UpdatePage(), state.index);
        }
        if (state is ProfilePageState) {
          return _buildScaffold(ProfilePage(), state.index);
        }
        return Container();
      },
    );
  }

  Scaffold _buildScaffold(Widget page, int index) {
    return Scaffold(
      body: page,
      bottomNavigationBar: _buildBottomNavigationBar(index),
    );
  }

  Widget _buildBottomNavigationBar(int index) {
    return BlocBuilder(
      bloc: BlocProvider.of<StudentBloc>(context),
      builder: (_, state) {
        if (state is ActiveStudentLoaded) {
          return widget.BottomNavigationBar(
            currentIndex: index,
            type: widget.BottomNavigationBarType.fixed,
            onLongPress: (int index) {
              if (index == 4) {
                return _buildModalSwitchStudent();
              }
            },
            onTap: (index) {
              if (index == 0) _navigationBloc.add(NavigationEvent.activity);
              if (index == 1) _navigationBloc.add(NavigationEvent.due);
              if (index == 2) _navigationBloc.add(NavigationEvent.inbox);
              if (index == 3) _navigationBloc.add(NavigationEvent.update);
              if (index == 4) _navigationBloc.add(NavigationEvent.profile);
            },
            iconSize: mediaDevice(context) ? 24.0 : 20.0,
            items: [
              BottomNavigationBarItem(
                  icon:
                      Icon(CustomIcons.icon_activity, color: Color(0xFFA7AAAC)),
                  activeIcon: Icon(CustomIcons.icon_activity,
                      color: Theme.of(context).primaryColor),
                  title: Text('')),
              BottomNavigationBarItem(
                  icon:
                      Icon(CustomIcons.icon_duedate, color: Color(0xFFA7AAAC)),
                  activeIcon: Icon(CustomIcons.icon_duedate,
                      color: Theme.of(context).primaryColor),
                  title: Text('')),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.icon_inbox, color: Color(0xFFA7AAAC)),
                  activeIcon: Icon(CustomIcons.icon_inbox,
                      color: Theme.of(context).primaryColor),
                  title: Text('')),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.icon_notifications,
                      color: Color(0xFFA7AAAC)),
                  activeIcon: Icon(CustomIcons.icon_notifications,
                      color: Theme.of(context).primaryColor),
                  title: Text('')),
              BottomNavigationBarItem(
                icon: Container(
                  width: 26.0,
                  height: 26.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(state.student.photo),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 26.0,
                  height: 26.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1.5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(state.student.photo),
                    ),
                  ),
                ),
                title: Text(''),
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  _buildModalSwitchStudent() {
    return widget.showCustomModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          height: mediaHeight(context) / 3,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: BlocProvider<StudentBloc>(
                builder: (context) =>
                    StudentBloc(repository: repository)..add(FetchStudents()),
                child: widget.SwitchBottomSheet(),
              ),
            ),
          ),
        );
      },
    );
  }
}
