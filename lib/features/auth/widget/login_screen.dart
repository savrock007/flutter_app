import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onClickSignUp;

  const LoginScreen({
    Key? key,
    required this.onClickSignUp,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App Login'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'пароль',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                authService.signInWithEmailAndPassword(
                    emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: const Text('Login'),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          RichText(
              text: TextSpan(
                  text: "Нет аккаунта? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickSignUp,
                    text: "Регистрация",
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline))
              ]))
        ],
      ),
    );
  }
}
