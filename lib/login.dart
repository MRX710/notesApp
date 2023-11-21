import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './auth.dart';

import 'package:flutter/material.dart';
import './myHomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello world!')),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // late String name;
  // TextEditingController controller = TextEditingController();

  User? user;
  String? name;

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(user?.displayName ?? 'Anonim'))),
        });
  }

  Widget loginButton() {
    return OutlinedButton(onPressed: click, child: Text('Sign in')
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45))
        );
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, child: loginButton());
  }
}
