import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/styles/navbar_admin.dart';
import 'package:spring/spring.dart';

class DriverDetails extends StatefulWidget {
  @override
  _DriverDetailsState createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: AdminNavBar(navIcon: 1,),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/history.png"),
                        ),
                        gradient:LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.blue,
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: 250,
                      child: Stack(alignment: Alignment.centerLeft, children: <Widget>[
                        Positioned(
                          left: 23,
                          top: 23,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              TypewriterAnimatedTextKit(
                                text: ['Driver Details'],
                                speed: Duration(milliseconds: 250),
                                isRepeatingAnimation: false,
                                textAlign: TextAlign.center,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      /* child: Stack(alignment: Alignment.center, children: <Widget>[
                        Text(
                          "Trip History",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lobster(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ]), */
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SpringTranslate(
                          motion: Motion.Mirror,
                          beginOffset: Offset(-1, -2),
                          endOffset: Offset.zero,
                          animStatus: (T) => print(T),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.directions_bus,
                              color: Colors.white,
                              size:30,
                            ),
                            radius: 40.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:15.0,left: 15,top: 15),
                          child: SpringTranslate(
                            motion: Motion.Mirror,
                            beginOffset: Offset(-1, -2),
                            endOffset: Offset.zero,
                            animStatus: (T) => print(T),
                            child: Container(
                              decoration: BoxDecoration(
//                            boxShadow: [
//                              BoxShadow(
//                                  color: Colors.grey,
//                                  offset: Offset(1.0, 2.0),
//                                  blurRadius: 3,
//                                  spreadRadius: 0.2)
//                            ],
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.blue,
                              ),
                              height:65,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Mr. Aditya Kumar ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 10),
                                      Icon(
                                        MdiIcons.bus,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Bus No 21",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
