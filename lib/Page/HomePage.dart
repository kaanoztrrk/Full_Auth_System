import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_login_register/Util/Colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void signUserLogOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserLogOut,
            icon: Icon(Icons.logout),
            color: black,
          )
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
