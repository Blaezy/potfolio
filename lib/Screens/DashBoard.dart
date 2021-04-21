import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashBoard extends StatefulWidget {
  //String name;
  //DashBoard(this.name);
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Logout",
                        style: GoogleFonts.encodeSansSemiExpanded(),
                      )
                    ],
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              },
            )
          ],
          title: Text(
            "User DashBoard",
            style: GoogleFonts.encodeSansExpanded(),
          ),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Hello Working On this Wait for some Time",
            style: GoogleFonts.encodeSansExpanded(),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                "Logout",
                style: GoogleFonts.encodeSansExpanded(),
              ))
        ])),
      ),
    );
  }
}
