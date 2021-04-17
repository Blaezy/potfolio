import 'package:flutter/material.dart';
import 'package:newproject/Intro.dart';
import 'package:newproject/LoginSignup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginSignup()
        //MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
