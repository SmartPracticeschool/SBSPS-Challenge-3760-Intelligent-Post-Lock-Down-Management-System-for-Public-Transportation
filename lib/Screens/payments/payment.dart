import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_gen_rd/Models/route.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring/spring.dart';

RoutesData
    routeBooked; // This fare value is set after the book button is clicked

class Payments extends StatefulWidget {
  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_sTsWGkcw7UPbYR",
      "amount": num.parse(routeBooked.fare.toString()) * 100,
      "name": "EasyTrans",
      "description": "Bus booking",
      "prefill": {
        "contact": "8264660512",
        "email": "khuzema@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Toast.show("Pament success", context);
  }

  void handlerErrorFailure() {
    print("Pament error");
    Toast.show("Pament error", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                decoration: BoxDecoration(
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
                height: 280,
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Text(
                    "Booking",
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                        width: 300,
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
                                  routeBooked.source,
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
                                  routeBooked.destination,
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
                                        routeBooked.time.toString().split(" ")[0]+':'+routeBooked.time.toString().split(" ")[1],
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
                                        routeBooked.busno.toString(),
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

                                    children: <Widget>[
                                      Icon(
                                        Icons.attach_money,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        routeBooked.fare.toString(),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
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
                        "Book Now",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onPressed: () {
                      openCheckout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
