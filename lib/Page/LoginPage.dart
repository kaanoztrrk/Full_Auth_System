// ignore_for_file: file_names

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_login_register/Page/SignUpPage.dart';
import 'package:full_login_register/Util/Colors.dart';
import 'package:full_login_register/Util/M%C4%B0niNavigator.dart';
import 'package:full_login_register/Widget/TextField.dart';

import '../Components/AppBar.dart';
import '../Components/SocialMediaLogIn.dart';
import '../Widget/AuthButton.dart';
import 'ForgotPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void checkPassword() => setState(() => obscureText = !obscureText);
  void signUp() => pageNavigator(context, const SignUpPage());
  void forgotPassword() => pageNavigator(context, const ForgotPasswordPage());
  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Navigator.pop(context);
        return wrongEmailOrPassword();
      }
    }
    Navigator.pop(context);
  }

  void wrongEmailOrPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "InCorrent Email or Password",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          title: "Log in",
          onpressed: () => exit(0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO :: Log in with of the following
              Text(
                "Log in with of the following",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              // TODO :: Social Media
              const SocialMediaLogIn(),
              // TODO :: Email TextField
              CustomTextField(
                controller: emailController,
                title: "Email",
                iconData: Icons.check_circle_outline,
                obscureText: false,
              ),
              // TODO ::  Password TextField
              CustomTextField(
                controller: passwordController,
                title: "Password",
                iconData:
                    obscureText ? Icons.shield : Icons.remove_red_eye_outlined,
                obscureText: obscureText,
                onTap: checkPassword,
              ),
              // TODO :: Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: forgotPassword,
                    child: Text(
                      "Forgot Password",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          decoration: TextDecoration.underline, color: blue),
                    ),
                  ),
                ],
              ),
              // TODO :: Log In

              AuthButton(title: "Log In", onTap: signIn),

              // TODO ::  First time here ? Sign Up for free

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "First time here? ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    InkWell(
                      onTap: signUp,
                      child: Text(
                        "Sign Up for free",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
