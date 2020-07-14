import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:spring/spring.dart';


class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            image: AssetImage("images/update.png"),
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
                                      text: ['Future Releases Update'],
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
                                      'Beta Release',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Implementations Prioritized for Covid-19',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Seperate Dashboards for User, Admin & Driver',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'IOT temperature sensor incorporation',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Easier and interactive',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Online local bus booking',
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
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Future Updates',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      'Seperate authentication for Admin, Users, Driver',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Flight, Cab, Train all in one',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Journey planner',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Efficient bus route search algorithm',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Self account profile management and handling feature',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Provide proper backend services',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Customer support services',
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
