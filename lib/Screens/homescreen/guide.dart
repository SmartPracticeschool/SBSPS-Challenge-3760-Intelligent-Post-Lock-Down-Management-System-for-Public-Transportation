import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/styles/navbar.dart';
import 'package:spring/spring.dart';

class GuideScreen extends StatefulWidget {
  @override
  _GuideScreenState createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          navIcon: 2,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/guidelines.png"),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.blue,
                        ],
                      ),
                    ),
                    width: double.infinity,
                    height: 250,
                    child: Stack(
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          Positioned(
                            left: 23,
                            top: 23,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                TypewriterAnimatedTextKit(
                                  text: ['Guidelines'],
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 15, right: 15, top: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SpringTranslate(
                        motion: Motion.Mirror,
                        beginOffset: Offset(-1, -3),
                        endOffset: Offset.zero,
                        animStatus: (T) => print(T),
                        child: Card(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          elevation: 3,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Guidelines',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Maintain social distance ( >2m )',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Mask is compulsory',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Avoid travel if any medical history',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SpringTranslate(
                        motion: Motion.Mirror,
                        beginOffset: Offset(-1, -3),
                        endOffset: Offset.zero,
                        animStatus: (T) => print(T),
                        child: Card(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          elevation: 3,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 59, top: 15, bottom: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Emergency',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  'Dial 911 for any emergency',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Mail us for any queries',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        )));
  }
}
