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
        body: _buildBody(context, activeTab),
        bottomNavigationBar: TabSelector(
          activeTab: activeTab,
          onTabSelected: (tab) =>
              BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
        ),
      );
    });
  }

  Widget _buildBody(BuildContext context, AppTab activeTab) {
    if (activeTab == AppTab.activity) {
      return BlocBuilder(
        bloc: BlocProvider.of<StudentBloc>(context),
        builder: (_, state) {
          if (state is ActiveStudentLoaded) {
            return BlocProvider<ActivityBloc>(
              create: (context) => ActivityBloc(repository)
                ..add(FetchActivityByStudent(state.student)),
              child: ActivityTab(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    }
    if (activeTab == AppTab.due) {
      return WhatsDuePage();
    }
    if (activeTab == AppTab.inbox) {
      return InboxPage();
    }
    if (activeTab == AppTab.update) {
      return UpdatePage();
    }
    return ProfilePage();
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
      onLongPress: (int index) async {
        if (index == 4) {
          return _buildModalSwitchStudent(context);
        }
      },
      iconSize: mediaDevice(context) ? 24.0 : 20.0,
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: _buildItemIcon(context, tab),
          activeIcon: _buildItemActiveIcon(context, tab),
          title: Text(''),
        );
      }).toList(),
    );
  }

  Widget _buildItemIcon(BuildContext context, AppTab tab) {
    if (tab == AppTab.activity) {
      return Icon(CustomIcons.icon_activity, color: Color(0xFFA7AAAC));
    }
    if (tab == AppTab.due) {
      return Icon(CustomIcons.icon_duedate, color: Color(0xFFA7AAAC));
    }
    if (tab == AppTab.inbox) {
      return Icon(CustomIcons.icon_inbox, color: Color(0xFFA7AAAC));
    }
    if (tab == AppTab.update) {
      return Icon(CustomIcons.icon_notifications, color: Color(0xFFA7AAAC));
    }
    return BlocBuilder(
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
                  image: NetworkImage(state.student.photo),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildItemActiveIcon(BuildContext context, AppTab tab) {
    if (tab == AppTab.activity) {
      return Icon(CustomIcons.icon_activity,
          color: Theme.of(context).primaryColor);
    }
    if (tab == AppTab.due) {
      return Icon(CustomIcons.icon_duedate,
          color: Theme.of(context).primaryColor);
    }
    if (tab == AppTab.inbox) {
      return Icon(CustomIcons.icon_inbox,
          color: Theme.of(context).primaryColor);
    }
    if (tab == AppTab.update) {
      return Icon(CustomIcons.icon_notifications,
          color: Theme.of(context).primaryColor);
    }
    return BlocBuilder(
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
                  image: NetworkImage(state.student.photo),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Future _buildModalSwitchStudent(BuildContext context) {
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
                create: (context) =>
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
