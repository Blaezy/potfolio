import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Models/UserDetails.dart';

enum AuthMode { login, signup }

class LoginSignup extends StatefulWidget {
  LoginSignup(this.submitFn, this.isLoading);
  final bool isLoading;
  final void Function(String name, String email, String password, bool islOgin,
      BuildContext context) submitFn;

  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  bool _obscureText = true;
  //FocusNode _emailFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();
  bool isLogin = false;
  var _user = UserDetails(name: "", email: "", password: "");
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _saveForm() {
    //Focus.of(context).unfocus();
    final isValid = _key.currentState.validate();
    if (!isValid) {
      return;
    }

    _key.currentState.save();
    widget.submitFn(_user.name, _user.email, _user.password, isLogin, context);
    print(_user.name);
    print(_user.email);
    print(_user.password);
  }

  @override
  void dispose() {
    //_emailFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _key,
          //Extract from Here AfterWards
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    isLogin == true ? "Welcome Back !" : "Start ahead",
                    style: GoogleFonts.encodeSansSemiExpanded(
                        color: Color(0xDDFF9163),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    isLogin == true
                        ? "Login To Continue"
                        : "Signup to Continue",
                    style: GoogleFonts.encodeSansSemiExpanded(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 300,
                child: SvgPicture.asset("assets/6.svg"),
              ),
              if (isLogin == false)
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(),
                  child: TextFormField(
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: ValueKey('name'),
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0x99FF9163), width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0x99FF9163), width: 2.0)),
                      labelText: "Name",
                      labelStyle: GoogleFonts.encodeSansCondensed(
                          color: Color(0x99FF9163)),
                      border: OutlineInputBorder(),
                      hintText: "Enter Name",
                      hintStyle: GoogleFonts.encodeSansExpanded(),
                      //errorText: "Please enter Email to continue",
                      prefixIcon: Icon(
                        Icons.account_box_outlined,
                        color: Color(0xFFFF9163),
                      ),
                    ),
                    onSaved: (value) {
                      _user.name = value;
                    },
                    validator: (value) {
                      if (value.isEmpty) return "Please Provide a valid name";
                      return null;
                    },
                  ),
                ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: TextFormField(
                  key: ValueKey('Email'),
                  textInputAction: TextInputAction.next,
                  //onFieldSubmitted: (_) =>
                  // Focus.of(context).requestFocus(_emailFocusNode),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0x99FF9163), width: 2.0)),
                    labelText: "Email",
                    labelStyle: GoogleFonts.encodeSansCondensed(
                        color: Color(0x99FF9163)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0x99FF9163), width: 2.0)),
                    hintText: "Enter Email",
                    hintStyle: GoogleFonts.encodeSansExpanded(),
                    //errorText: "Please enter Email to continue",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xFFFF9163),
                    ),
                  ),
                  onSaved: (value) {
                    _user.email = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) return "Please Provide a valid Email";
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(),
                child: TextFormField(
                  key: ValueKey('password'),
                  //focusNode: _emailFocusNode,
                  obscureText: _obscureText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autofocus: false,
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      errorStyle: GoogleFonts.encodeSansSemiExpanded(),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0x99FF9163), width: 2.0)),
                      labelText: "Password",
                      labelStyle: GoogleFonts.encodeSansCondensed(
                          color: Color(0x99FF9163)),
                      border: OutlineInputBorder(),
                      hintText: "Enter Password",
                      hintStyle: GoogleFonts.encodeSansExpanded(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFFF9163), width: 2.0)),
                      //errorText: "Please enter Email to continue",
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xFFFF9163),
                      ),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _toggle();
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                            color: Color(0xFFFF9163),
                          ))),
                  onSaved: (value) {
                    _user.password = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) return "Please Provide a valid password";
                    return null;
                  },
                ),
              ),
              if (widget.isLoading) Center(child: CircularProgressIndicator()),
              if (!widget.isLoading)
                Center(
                  child: Container(
                      width: 100,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFFF9163)),
                          onPressed: () async {
                            _saveForm();
                            print(_user.email);
                            print(_user.password);
                          },
                          child: Text(isLogin == false ? "SignUp" : "LogIn",
                              style: GoogleFonts.encodeSansSemiExpanded()))),
                ),
              if (!widget.isLoading)
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLogin == false
                          ? "Already have an account"
                          : "Doesn't have an Account",
                      style: GoogleFonts.encodeSansSemiExpanded(),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Text(
                        isLogin == false ? "Login" : "Signup",
                        style: GoogleFonts.encodeSansSemiExpanded(
                            color: Color(0xFFFF9163)),
                      ),
                    ),
                    Text("Instead", style: GoogleFonts.encodeSansSemiExpanded())
                  ],
                ))
            ],
          ),
        ),
      ),
    );
  }
}
