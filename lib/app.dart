import 'package:edukasi_mobile/core/data/fake_repository.dart';
import 'package:edukasi_mobile/presentation/blocs/student/bloc.dart';
import 'package:edukasi_mobile/presentation/blocs/tab/bloc.dart';
import 'package:edukasi_mobile/presentation/shared/bottom_navbar.dart'
    as custom;
import 'package:edukasi_mobile/presentation/shared/bottom_sheet.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/tabs/activity/activity_tab.dart';
import 'package:edukasi_mobile/presentation/tabs/activity/bloc/bloc.dart';
import 'package:edukasi_mobile/presentation/tabs/inbox/inbox_tab.dart';
import 'package:edukasi_mobile/presentation/tabs/profile/profile_tab.dart';
import 'package:edukasi_mobile/presentation/tabs/update/update_tab.dart';
import 'package:edukasi_mobile/presentation/tabs/whats_due/whats_due_tab.dart';
import 'package:edukasi_mobile/presentation/tabs/profile/widgets/switch_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final repository = FakeRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(builder: (context, activeTab) {
      return Scaffold(
        body: activeTab == AppTab.activity
            ? BlocBuilder(
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
              )
            : activeTab == AppTab.due
                ? WhatsDuePage()
                : activeTab == AppTab.inbox
                    ? InboxPage()
                    : activeTab == AppTab.update ? UpdatePage() : ProfilePage(),
        bottomNavigationBar: TabSelector(
          activeTab: activeTab,
          onTabSelected: (tab) =>
              BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
        ),
      );
    });
  }
}

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;
  final repository = FakeRepository();

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom.BottomNavigationBar(
      type: custom.BottomNavigationBarType.fixed,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      onLongPress: (int index) {
        if (index == 4) {
          return _buildModalSwitchStudent(context);
        }
      },
      iconSize: mediaDevice(context) ? 24.0 : 20.0,
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: tab == AppTab.activity
              ? Icon(CustomIcons.icon_activity, color: Color(0xFFA7AAAC))
              : tab == AppTab.due
                  ? Icon(CustomIcons.icon_duedate, color: Color(0xFFA7AAAC))
                  : tab == AppTab.inbox
                      ? Icon(CustomIcons.icon_inbox, color: Color(0xFFA7AAAC))
                      : tab == AppTab.update
                          ? Icon(CustomIcons.icon_notifications,
                              color: Color(0xFFA7AAAC))
                          : BlocBuilder(
                              bloc: BlocProvider.of<StudentBloc>(context),
                              builder: (_, state) {
                                if (state is ActiveStudentLoaded) {
                                  return Container(
                                    width: 26.0,
                                    height: 26.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(state.student.photo),
                                      ),
                                    ),
                                  );
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              }),
          activeIcon: tab == AppTab.activity
              ? Icon(CustomIcons.icon_activity,
                  color: Theme.of(context).primaryColor)
              : tab == AppTab.due
                  ? Icon(CustomIcons.icon_duedate,
                      color: Theme.of(context).primaryColor)
                  : tab == AppTab.inbox
                      ? Icon(CustomIcons.icon_inbox,
                          color: Theme.of(context).primaryColor)
                      : tab == AppTab.update
                          ? Icon(CustomIcons.icon_notifications,
                              color: Theme.of(context).primaryColor)
                          : BlocBuilder(
                              bloc: BlocProvider.of<StudentBloc>(context),
                              builder: (_, state) {
                                if (state is ActiveStudentLoaded) {
                                  return Container(
                                    width: 26.0,
                                    height: 26.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 1.5,
                                      ),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            NetworkImage(state.student.photo),
                                      ),
                                    ),
                                  );
                                }
                                return Center(
                                    child: CircularProgressIndicator());
                              }),
          title: Text(''),
        );
      }).toList(),
    );
  }

  _buildModalSwitchStudent(BuildContext context) {
    return showCustomModalBottomSheet(
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
                child: SwitchBottomSheet(),
              ),
            ),
          ),
        );
      },
    );
  }
}
