import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newproject/Screens/AuthScreen.dart';
import 'package:newproject/Screens/DashBoard.dart';
import 'package:firebase_core/firebase_core.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: _initialization,
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, userSnapshot) {
          if (userSnapshot.hasData)
            return DashBoard();
          else
            return AuthScreen();
        });
  }
}
