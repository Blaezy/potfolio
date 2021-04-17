import 'dart:ui';

import 'package:flutter/material.dart';

enum AuthMode { login, signup }

class LoginSignup extends StatefulWidget {
  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  bool _obscureText = true;
  AuthMode _auth = AuthMode.signup;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          if (_auth == AuthMode.signup)
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  hintText: "Enter Name",
                  //errorText: "Please enter Email to continue",
                  prefixIcon: Icon(Icons.account_box),
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                hintText: "Enter Email",
                //errorText: "Please enter Email to continue",
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(),
            child: TextFormField(
              obscureText: _obscureText,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  hintText: "Enter Password",
                  //errorText: "Please enter Email to continue",
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: GestureDetector(
                      onTap: () => _toggle, child: Icon(Icons.remove_red_eye))),
            ),
          ),
        ],
      ),
    );
  }
}
