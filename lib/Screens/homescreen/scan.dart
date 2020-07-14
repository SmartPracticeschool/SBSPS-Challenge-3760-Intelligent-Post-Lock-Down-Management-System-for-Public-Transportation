// QR SCANNER -- BARCODE SCAN PACKAGE

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:qr_gen_rd/Screens/requests/iot_temp.dart';
import 'package:qr_gen_rd/styles/navbar_driver.dart';
import 'package:spring/spring.dart';
import 'package:spring/springs/spring_scale.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = ""; // To store barcode info
  String tempResult = ""; // To store temp result

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: DriverNavBar(
            navIcon: 0, barcode: barcode
          ),

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
//                        image: DecorationImage(
//                          image: AssetImage("images/scan.png"),
//                        ),
                        gradient: LinearGradient(
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
                      child: Stack(alignment: Alignment.center, children: <Widget>[
                        Positioned(
                          top: 10,
                          right: 10,
                          child: FlatButton.icon(
                              onPressed: () {
                                noSuchMethod(null);
                              },
                              icon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              label: Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      Positioned(
                        left: 23,
                        top: 23,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TypewriterAnimatedTextKit(
                              text: ['Welcome, Driver'],
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
                        Text(
                          "Click Me !",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lobster(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                    ]),
                    ),
                  ),
                  SpringScale(
                    motion: Motion.Mirror,
                    begin: 0.9,
                    end: 1.0,
                    animStatus: (T) => print(T),
                    child: Container(
                      height: 0.4 *
                          (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).viewInsets.bottom),
                      width: 0.4 *
                          (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).viewInsets.bottom),
                      child: FittedBox(
                        child: FloatingActionButton(
                          hoverElevation: 5,
                          elevation: 3,
                          backgroundColor: Colors.blue,
                          onPressed: () {
                            scan();
                          },
                          child: Center(
                              child: Icon(
                            MdiIcons.qrcodeScan,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 2.0),
                                  blurRadius: 3,
                                  spreadRadius: 0.2)
                            ],
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blue,
                          ),
                          height: 140,
                          width: 280,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Passenger ID",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                 Text("Test123",textAlign: TextAlign.center,style: TextStyle(fontSize:16, color: Colors.white,fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text(
                                  "Scan Near Entrance For Temperature Check",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                  ),
                                ),
                                Text(
                                  tempResult ?? '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future scan() async {
    try {
      ScanResult result = await BarcodeScanner.scan();
      String temp = await IotServices().getTemp();
      if (result.type == ResultType.Barcode) {
        // If we got desired scan result instead of error
        setState(() {
          this.barcode = result.rawContent;
          this.tempResult = temp;
        }); // Sets scanned content to variables
      }
    } on PlatformException catch (e) {
      // Exception raised in try block on Platform interaction basis
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        // Is exception is camera Permission denial
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        // Unknown exception
        print("[Unknown Error]: $e");
        setState(() {
          this.barcode = "Unknown Error";
        });
      }
    } on FormatException {
      // If desired format exception raised
      setState(() => this.barcode = 'null User Returned Using Back button');
    } catch (e) {
      print("[Unknown Error]: $e");
      setState(() => this.barcode = 'Unknown error');
    }
  }
}

// IBM Watson IOT Temperature Simulator http://watson-iot-sensor-simulator.mybluemix.net/
// ORGANIZATION ID: abgfc9
// DEVICE TYPE: NodeMCU
// DEVICE ID: 1234
// DEVICE TOKEN: 123456789