/*Genertes QR code on given string
Uses qr_flutter package


All the commented codes didnt not affect anything during runtime and will be removed after proper testing*/

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_gen_rd/Screens/homescreen/home_screen.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/styles/navbar.dart';

class GenerateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GenerateScreenState();
}

class GenerateScreenState extends State<GenerateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(navIcon: 3,),
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
                          image: AssetImage("images/qr.png"),
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
                                text: ['Scan Your Code'],
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
                    ),
                  ),
                  QrImage(
                    foregroundColor: Colors.blue,
                    data: userDetails,
                    size: 0.35 *
                        (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).viewInsets.bottom),
                    //MediaQuery is used to learn the size of current screen on which app is being used
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
