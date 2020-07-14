import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/styles/navbar.dart';
import 'package:spring/spring.dart';
import 'package:qr_gen_rd/Screens/payments/payment.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(navIcon: 1,),
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
                                text: ['Trip History'],
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
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.directions_bus,
                              color: Colors.blue,
                              size:40,
                            ),
                            radius: 20.0,
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
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.blue,
                              ),
                              height:115,
                              width: 270,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.my_location,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        routeBooked == null? 'No Booking Found':routeBooked.source,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        routeBooked == null? 'Please Make A Booking':routeBooked.destination,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      FittedBox(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              routeBooked == null?' ':routeBooked.time.toString().split(" ")[0]+':'+routeBooked.time.toString().split(" ")[1],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FittedBox(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(width: 5),
                                            Icon(
                                              Icons.directions_bus,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              routeBooked == null?' ':routeBooked.busno.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FittedBox(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.attach_money,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              routeBooked == null?' ':routeBooked.fare.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(width: 10),
                                          ],
                                        ),
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
