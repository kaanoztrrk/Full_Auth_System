import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_login_register/Components/AppBar.dart';
import 'package:full_login_register/Page/HomePage.dart';
import 'package:full_login_register/Page/LoginPage.dart';

import '../Components/SocialMediaLogIn.dart';
import '../Util/Colors.dart';
import '../Util/MİniNavigator.dart';
import '../Widget/AuthButton.dart';
import '../Widget/TextField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void checkPassword() => setState(() => obscureText = !obscureText);

  void signUp() => pageNavigator(context, const LoginPage());

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'The email address is badly formatted') {
        Navigator.pop(context);
        return wrongEmailOrPassword("No Found User");
      } else if (e.code == 'Password should be at least 6 characters') {
        Navigator.pop(context);
        return wrongEmailOrPassword("Password should be at least 6 characters");
      } else {
        Navigator.pop(context);
        return wrongEmailOrPassword("dsds");
      }
    }
    Navigator.pop(context);
  }

  void wrongEmailOrPassword(String title) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        automaticallyImplyLeading: false,
        title: CustomAppBar(
          title: "Sign up",
          onpressed: () => Navigator.pop(context),
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
                "Sign up with one pf the fallowing",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              // TODO :: Social Media

              const SocialMediaLogIn(),

              // TODO :: Name TextField
              CustomTextField(
                controller: nameController,
                title: "Name",
                iconData: Icons.check_circle_outline,
                obscureText: false,
              ),
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

              // TODO :: Log In

              AuthButton(
                title: "Sign up",
                onTap: signUserUp,
              ),

              // TODO ::  First time here ? Sign Up for free

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account? ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    InkWell(
                      onTap: signUp,
                      child: Text(
                        "Log in",
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
