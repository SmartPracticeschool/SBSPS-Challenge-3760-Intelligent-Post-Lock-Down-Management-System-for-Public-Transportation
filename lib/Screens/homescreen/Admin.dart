import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen_rd/Models/route.dart';
import 'package:qr_gen_rd/Models/user.dart';
import 'package:qr_gen_rd/services/database.dart';
import 'package:qr_gen_rd/styles/loading.dart';
import 'package:qr_gen_rd/styles/navbar_admin.dart';
import 'package:qr_gen_rd/styles/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';

// Function to add routes

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  final _formKey = GlobalKey<
      FormState>();
  bool loading = false;

  final RoutesData routesData = RoutesData();
  String success = "";

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return loading
        ? Loading()
        : Scaffold(
        bottomNavigationBar: AdminNavBar(navIcon: 0,),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          gradient:LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Colors.lightBlueAccent,
                            ],
                          ),
                        ),
                        width: double.infinity,
                        height: 250,
                        child: Stack(alignment: Alignment.center, children: <Widget>[
                         Positioned(
                        left: 23,
                        top: 23,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TypewriterAnimatedTextKit(
                              text: ['Welcome, Admin'],
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
                          Positioned(
                            top: 10,
                            right: 10,
                            child: FlatButton.icon(
                                onPressed: () {
                                  noSuchMethod(null);
                                },
                                icon: Icon(
                                  Icons.person,
                                  color: white,
                                ),
                                label: Text(
                                  "Logout",
                                  style: TextStyle(color: white),
                                )),
                          ),
                          Text(
                            "Route Details",
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
                      ),],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15, top: 0,bottom: 15),
                  child: Form(
                      key: _formKey, //Associating a UID to Form
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              success,
                              style: TextStyle(color: Colors.green),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              // For Source
                              decoration: InputDecoration(
                                  labelText: 'Source Bus Stop',
                                  hintText: 'Kothrud Bus Depot, Pune',
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0))),
                              validator: (value) => value.isEmpty
                                  ? 'Enter Source Bus Stop'
                                  : null, // If value is empty, return helper text else return null
                              onChanged: (value) {
                                setState(() {
                                  routesData.source = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // For Destination
                              decoration: InputDecoration(
                                  labelText: 'Destination Bus Stop',
                                  hintText: 'Swargate Bus Stop, Pune',
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0))),
                              validator: (value) => value.isEmpty
                                  ? 'Enter Destination Bus Stop'
                                  : null,
                              onChanged: (value) {
                                setState(() {
                                  routesData.destination=value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // For Tame
                                decoration: InputDecoration(
                                    labelText: 'Time In 24 hrs Format',
                                    hintText: '18 00 For 6pm',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0))),
                                validator: (value) =>
                                value.isEmpty ? 'Enter Time' : null,
                                onChanged: (value) {
                                  setState(() {
                                    routesData.time = value;
                                  });
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // For Bus No
                                decoration: InputDecoration(
                                    labelText: 'Bus No',
                                    hintText: '23',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0))),
                                validator: (value) => value.isEmpty
                                    ? 'Enter Bus No'
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    routesData.busno=int.parse(value);
                                  });
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // For Seats
                                decoration: InputDecoration(
                                    labelText:
                                    'Ticket Fare in Rs',
                                    hintText: '100',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0))),
                                validator: (value) => value.isEmpty
                                    ? 'Enter Ticket Fare'
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    routesData.fare= int.parse(value).round();
                                  });
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // For Seats
                                decoration: InputDecoration(
                                    labelText:
                                    'Total Seats Availability',
                                    hintText: '27',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0))),
                                validator: (value) => value.isEmpty
                                    ? 'Enter Total Seats Available'
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    routesData.seats= int.parse(value);
                                  });
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // For Route
                                decoration: InputDecoration(
                                    labelText: 'Route No Along With Sub Route No',
                                    hintText: 'Enter 2-1 For 1st Stop In Route 2',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0))),
                                validator: (value) => value.isEmpty
                                    ? 'Provide Valid Answer'
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    routesData.routes= value;
                                  });
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                                elevation: 2,
                                hoverElevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(
                                    "Add Routes",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  loading=true;
                                  if(_formKey.currentState.validate()){
                                    success= "Added Succefully";
                                    loading = false;
                                    await RoutesDatabaseService(uid: user.uid).updateRoutesData(routesData);
                                  }
                                }),
                          ])),
                )
              ],
            ),
          ),
        ));
  }
}
