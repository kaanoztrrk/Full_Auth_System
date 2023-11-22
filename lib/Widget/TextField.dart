import 'package:flutter/material.dart';
import 'package:full_login_register/Util/Colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.title,
      required this.iconData,
      required this.obscureText,
      this.onTap,
      required this.controller});

  final String title;
  final IconData iconData;
  final bool obscureText;
  final Function()? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title*",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600)),
          SizedBox(height: 10),
          TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                  suffixIcon: InkWell(onTap: onTap, child: Icon(iconData)),
                  hintText: "$title",
                  focusColor: blue,
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.5, color: black.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(20),
                  ))),
        ],
      ),
    );
  }
}
