import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_gen_rd/Screens/homescreen/Admin.dart';
import 'package:qr_gen_rd/Screens/homescreen/scan.dart';
import 'package:qr_gen_rd/Screens/homescreen/updates.dart';
import 'package:qr_gen_rd/Screens/map/home.dart';
import 'package:qr_gen_rd/services/auth.dart';
import 'package:qr_gen_rd/Models/user.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/styles/navbar.dart';
import 'package:spring/spring.dart';
import 'package:unicorndial/unicorndial.dart';

String userDetails = "";

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen(this.user);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

    // Floating Action Button Extended
    var childButtons = List<UnicornButton>();
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Driver",
        labelColor: Colors.white,
        labelHasShadow: true,
        labelBackgroundColor: Colors.blue,
        currentButton: FloatingActionButton(
            heroTag: "driver",
            elevation: 3,
            backgroundColor: Colors.blue,
            mini: true,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ScanScreen()));
            },
            child: Icon(MdiIcons.steering))));
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Admin",
        labelColor: Colors.white,
        labelHasShadow: true,
        labelBackgroundColor: Colors.blue,
        currentButton: FloatingActionButton(
            heroTag: "admin",
            elevation: 3,
            backgroundColor: Colors.blue,
            mini: true,
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdminScreen()));
            },
            child: Icon(Icons.person))));
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Updates",
        labelColor: Colors.white,
        labelHasShadow: true,
        labelBackgroundColor: Colors.blue,
        currentButton: FloatingActionButton(
            heroTag: "updates",
            elevation: 3,
            backgroundColor: Colors.blue,
            mini: true,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateScreen()));
            },
            child: Icon(Icons.inbox))));

    return Scaffold(

        floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
          parentButtonBackground: Colors.blue,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.add),
          childButtons: childButtons
        ),

        bottomNavigationBar: BottomNavBar(
          navIcon: 0,
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
                      image: AssetImage("images/vector.png"),
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
                  height: 290,
                  child:
                      Stack(alignment: Alignment.centerLeft, children: <Widget>[
                    Positioned(
                      top: 10,
                      right: 10,
                      child: FlatButton.icon(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          await _auth.signout();
                        },
                      ),
                    ),
                    Positioned(
                      left: 23,
                      top: 23,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          TypewriterAnimatedTextKit(
                            text: ['Welcome, User'],
                            isRepeatingAnimation: false,
                            speed: Duration(milliseconds: 250),
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
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpringTranslate(
                      motion: Motion.Mirror,
                      beginOffset: Offset(-1, -3),
                      endOffset: Offset.zero,
                      animStatus: (T) => print(T),
                      child: AvatarGlow(
                        glowColor: Colors.blue,
                        endRadius: 100.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.directions_bus,
                                color: Colors.blue,
                                size: 70,
                              ),
                              radius: 60.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SpringTranslate(
                      motion: Motion.Mirror,
                      beginOffset: Offset(-1, -3),
                      endOffset: Offset.zero,
                      animStatus: (T) => print(T),
                      child: AvatarGlow(
                        glowColor: Colors.blue,
                        endRadius: 100.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.flight,
                                color: Colors.blue,
                                size: 70,
                              ),
                              radius: 60.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SpringTranslate(
                      motion: Motion.Mirror,
                      beginOffset: Offset(-1, -3),
                      endOffset: Offset.zero,
                      animStatus: (T) => print(T),
                      child: AvatarGlow(
                        glowColor: Colors.blue,
                        endRadius: 100.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.train,
                                color: Colors.blue,
                                size: 70,
                              ),
                              radius: 60.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SpringTranslate(
                      motion: Motion.Mirror,
                      beginOffset: Offset(-1, -3),
                      endOffset: Offset.zero,
                      animStatus: (T) => print(T),
                      child: AvatarGlow(
                        glowColor: Colors.blue,
                        endRadius: 100.0,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        showTwoGlows: true,
                        repeatPauseDuration: Duration(milliseconds: 100),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          child: Material(
                            elevation: 8.0,
                            shape: CircleBorder(),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.local_taxi,
                                color: Colors.blue,
                                size: 70,
                              ),
                              radius: 60.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]))));
  }
}
