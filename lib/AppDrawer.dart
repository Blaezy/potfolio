import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffEB5757), Color(0xff000000)],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 10,
                child: Column(children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white),
                    child: SvgPicture.asset(
                      "assets/2.svg",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "Shivam",
                      style: GoogleFonts.sairaSemiCondensed(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  )
                ]),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                print("object");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.account_box_outlined,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Account",
                    style: GoogleFonts.encodeSansSemiCondensed(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                print("1");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.vpn_key_outlined,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Projects",
                    style: GoogleFonts.encodeSansSemiCondensed(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                print("object2");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "About",
                    style: GoogleFonts.encodeSansSemiCondensed(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
