import 'package:flutter/material.dart';
import 'package:full_login_register/Util/Colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, this.onpressed});

  final String title;
  final Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: black),
              borderRadius: BorderRadius.circular(15.0)),
          child: IconButton(
              onPressed: onpressed,
              icon: Icon(
                Icons.arrow_back,
                color: black,
              )),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black),
        )
      ],
    );
  }
}
