import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/blocs/auth/bloc.dart';
import 'package:edukasi_mobile/presentation/blocs/student/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<StudentBloc>(context),
      builder: (_, state) {
        if (state is StudentLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is StudentsLoaded) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {},
            child: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Student list
                    Expanded(child: _buildStudentList(state.students)),

                    // SizedBox(height: 16.0),
                    /// Settings icon
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Container(
                    //         decoration: BoxDecoration(
                    //             shape: BoxShape.rectangle,
                    //             color: Color(0xFF838C97)),
                    //         child: Icon(Icons.settings, color: Colors.white)),
                    //     SizedBox(width: 16.0),
                    //     Text('Settings',
                    //         style: TextStyle(
                    //             fontSize: 20.0, color: Color(0xFF838C97)))
                    //   ],
                    // ),
                    // SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildStudentList(List<Student> student) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: student.length,
      itemBuilder: (context, index) => StudentList(student: student[index]),
    );
  }
}

class StudentList extends StatelessWidget {
  final Student student;

  StudentList({@required this.student});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(ChangeActiveStudent(student));
          Navigator.pop(context);
        },
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              /// Student photo
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(student.photo),
                  ),
                ),
              ),
              SizedBox(width: 24.0),

              /// Student name text
              Text(
                student.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
