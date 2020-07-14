import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/styles/navbar_driver.dart';
import 'package:spring/spring.dart';

class GuideDriver extends StatefulWidget {
  @override
  _GuideDriverState createState() => _GuideDriverState();
}

class _GuideDriverState extends State<GuideDriver> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: DriverNavBar(navIcon: 2,),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Driver must always keep their masks on',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Passengers QR Codes to be scanned at the entrance',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Proper sanitation to be maintained',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Drivers will be monitored under 24hrs supervision',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Only the passengers who are safe to travel should be allowed on board',
                                      textAlign: TextAlign.left,
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
                          SizedBox(
                            height: 30,
                          ),
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
                                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0, right: 15), // right: 103
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
                                      'Call admin on +91 999999999 for any queries',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Call 911 for medical emergencies',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Mail us on queries@easytrans.com for any app related queries',
                                      textAlign: TextAlign.left,
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
