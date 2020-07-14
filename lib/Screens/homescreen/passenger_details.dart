import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/styles/navbar_driver.dart';
import 'package:spring/spring.dart';

class PassengerDetails extends StatefulWidget {

  final String barcode;
  const PassengerDetails ({ Key key, this.barcode }): super(key: key);

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: DriverNavBar(navIcon: 1,),
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
                                text: ['Passenger Details'],
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
                              Icons.person,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.qrcode,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Test123",
                                        //widget.barcode ?? "No QR Scanned Yet",
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
