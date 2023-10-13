import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onClickLogin;
  const SignUpScreen({Key? key, required this.onClickLogin}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                hintText: 'FullName',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Confirm Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  authService.signUpWithEmailAndPassword(
                    fullNameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  );
                },
                child: const Text('Sign Up')),
            const SizedBox(
              height: 24,
            ),
            RichText(
                text: TextSpan(
                    text: "Есть аккаунта? ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickLogin,
                      text: "Войти",
                      style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline))
                ]))
          ],
        ),
      ),
    );
  }
}
