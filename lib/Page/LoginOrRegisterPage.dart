import 'package:flutter/material.dart';
import 'package:full_login_register/Page/LoginPage.dart';
import 'package:full_login_register/Page/SignUpPage.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return const LoginPage();
    } else {
      return const SignUpPage();
    }
  }
}
