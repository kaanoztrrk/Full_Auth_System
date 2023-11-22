import 'dart:async';

import 'package:flutter/material.dart';
import 'package:full_login_register/Page/AuthPage.dart';
import 'package:full_login_register/Util/Colors.dart';
import 'package:full_login_register/Util/Image.dart';
import 'package:full_login_register/Util/M%C4%B0niNavigator.dart';

import '../Util/Duration.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(splashDuration, () => pageNavigator(context, const AuthPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBgColor,
      body: Center(
        child: Image(width: 250, image: AssetImage(ImageEnum.logo.toPath)),
      ),
    );
  }
}
