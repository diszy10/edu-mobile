import 'package:edukasi_mobile/core/data/user_repository.dart';
import 'package:edukasi_mobile/presentation/blocs/auth/bloc.dart';
import 'package:edukasi_mobile/presentation/pages/login/bloc/bloc.dart';
import 'package:edukasi_mobile/presentation/shared/loader.dart';
import 'package:edukasi_mobile/presentation/pages/login/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        builder: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFace0f9).withOpacity(0.3),
                    Color(0xFFfff1eb).withOpacity(0.6),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topCenter,
                  stops: [0, 1],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      child: Image.asset('assets/images/edukasi-logo.png'),
                    ),
                    SizedBox(height: 32.0),
                    _LoginForm()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  String _validateEmail(String value) {
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regex = new RegExp(pattern);
    if (value == '') return 'Email must not be empty';
    // else if (!regex.hasMatch(value)) return 'Please enter valid email address';
    return null;
  }

  String _validatePassword(String value) {
    if (value == '') return 'Password must not be empty';
    return null;
  }

  void _handleLogin() {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      try {
        BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressed(
            username: _emailController.text,
            password: _passwordController.text,
          ),
        );
      } catch (e) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                    validator: _validateEmail,
                    focusNode: _emailFocus,
                    inputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    // onSaved: (val) => _email = val,
                    onFieldSubmitted: (value) {
                      _emailFocus.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                  ),
                  SizedBox(height: 16.0),
                  CustomPasswordField(
                    controller: _passwordController,
                    hintText: "Password",
                    validator: _validatePassword,
                    focusNode: _passwordFocus,
                    textInputAction: TextInputAction.done,
                    // onSaved: (val) => _password = val,
                    onFieldSubmitted: (value) {
                      _passwordFocus.unfocus();
                    },
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF5B6CEC),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: state is! LoginLoading ? _handleLogin : null,
                        borderRadius: BorderRadius.circular(4.0),
                        child: Center(
                          child: state is LoginLoading
                              ? Container(
                                  padding: EdgeInsets.symmetric(vertical: 7.5),
                                  child: Loader(
                                    loaderColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
