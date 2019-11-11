import 'package:edukasi_mobile/app.dart';
import 'package:edukasi_mobile/core/data/fake_repository.dart';
import 'package:edukasi_mobile/core/data/user_repository.dart';
import 'package:edukasi_mobile/presentation/blocs/auth/bloc.dart';
import 'package:edukasi_mobile/presentation/blocs/student/bloc.dart';
import 'package:edukasi_mobile/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final userRepository = UserRepository();
  final repository = FakeRepository();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(
            userRepository: userRepository, repository: repository)
          ..add(AppStarted());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edukasi Mobile',
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationAuthenticated) {
              return BlocProvider<StudentBloc>(
                builder: (context) => StudentBloc(repository: repository)
                  ..add(SetActiveStudent(state.activeStudent)),
                child: App(),
              );
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: userRepository);
            }
            // if state is uninitialized & loading
            return SplashPage();
          },
        ),
        theme: _eduTheme,
      ),
    );
  }
}

final ThemeData _eduTheme = _buildEduTheme();

ThemeData _buildEduTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Color(0xFF5B87EC),
    textTheme: _buildEduTextTheme(base.textTheme),
  );
}

TextTheme _buildEduTextTheme(TextTheme base) {
  return base.apply(fontFamily: 'Okomito');
}
