import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/widget/widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickSignUp: toggle)
      : SignUpScreen(onClickLogin: toggle);

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
