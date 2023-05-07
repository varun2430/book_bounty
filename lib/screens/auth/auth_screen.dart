import 'package:flutter/material.dart';
import 'package:book_bounty/screens/auth/components/login.dart';
import 'package:book_bounty/screens/auth/components/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  void toggle() => setState(() {
        isLogin = !isLogin;
      });

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LogIn(onClickedSignUp: toggle)
        : SignUp(onClickedLogIn: toggle);
  }
}
