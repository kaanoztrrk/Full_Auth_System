import 'package:flutter/material.dart';
import 'package:full_login_register/Page/SplashPage.dart';
import 'package:full_login_register/Util/Colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Poppins",
          appBarTheme: const AppBarTheme(color: white, elevation: 0)),
      title: 'Material App',
      home: const SplashPage(),
    );
  }
}
