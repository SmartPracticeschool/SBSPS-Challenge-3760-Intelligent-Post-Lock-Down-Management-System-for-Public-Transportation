import 'package:flutter/cupertino.dart';
import 'package:qr_gen_rd/Screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:qr_gen_rd/styles/style.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';

class StartUp extends StatefulWidget {
  @override
  _StartUpState createState() => _StartUpState();
}

class _StartUpState extends State<StartUp> with SingleTickerProviderStateMixin {
  AnimationController controllerBG;
  Animation animationBG;

  @override
  void initState() {
    super.initState();

    // After 2 seconds, go to login screen
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Help()),
            ));

    // BG Animation
    controllerBG =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animationBG = ColorTween(
            begin: Colors.pink,
            end: Colors.blue) // Tween changes range of animation
        .animate(controllerBG);
    controllerBG.forward();
    controllerBG.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controllerBG.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationBG.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Center(
              child: Text(
                'EasyTrans',
                style: GoogleFonts.lobster(
                    textStyle: TextStyle(
                  color: white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400,
                )),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TypewriterAnimatedTextKit(
            text: ['YOUR POCKET TRANSPORT COMPANION'],
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              color: white,
              fontSize: 15.0,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
class Help extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: Colors.blue,
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('images/history.png'),
        body: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Text(
            'Authenticate, Choose The Mode of Transport & Pay Online',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        title: Center(
          child: Text(
            "Mode of Transport",
            textAlign: TextAlign.center,
            style: GoogleFonts.lobster(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),

        titleTextStyle: TextStyle( color: Colors.white),
        bodyTextStyle: TextStyle( color: Colors.white),
        mainImage: Image.asset(
          'images/history.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )
    ),

    PageViewModel(
      pageColor: Colors.blue,
      iconImageAssetPath: 'images/qr.png',
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
          'Integrated QR Scanning Technology',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,

          ),
        ),
      ),
      title: Center(
        child: Text(
          "QR Scanning",
          textAlign: TextAlign.center,
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      mainImage: Image.asset(
        'images/qr.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(color: Colors.white),
      bodyTextStyle: TextStyle( color: Colors.white),
    ),

    PageViewModel(
      pageColor: Colors.blue,
      iconImageAssetPath: 'images/update.png',
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
          'Cutting Edge Realtime Temperature Sensing Technology Integration',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      title: Center(
        child: Text(
          "Temperature",
          textAlign: TextAlign.center,
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
      mainImage: Image.asset(
        'images/update.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle( color: Colors.white),
      bodyTextStyle: TextStyle( color: Colors.white),
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(//ThemeData
      body: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
//          showNextButton: true,
//          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wrapper(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    );
  }
}
