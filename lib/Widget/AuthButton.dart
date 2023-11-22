import 'package:flutter/material.dart';
import 'package:full_login_register/Util/Colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.title, this.onTap});

  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20) +
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        decoration:
            BoxDecoration(color: blue, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.titleMedium?.copyWith(color: white),
          ),
        ),
      ),
    );
  }
}
