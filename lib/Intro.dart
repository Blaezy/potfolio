import 'dart:async';

import 'package:flutter/material.dart';

import 'package:newproject/onboarding.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Onboarding())));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        //drawer: AppDrawer(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => Onboarding()));
              },
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Colors.black12,
                          blurRadius: 10),
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Colors.white.withOpacity(0.45),
                          blurRadius: 10),
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Image.asset(
                      "assets/pf_logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
