import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_gen_rd/Screens/homescreen/gen.dart';
import 'package:qr_gen_rd/Screens/homescreen/guide.dart';
import 'package:qr_gen_rd/Screens/homescreen/history.dart';
import 'package:qr_gen_rd/Screens/wrapper.dart';


class BottomNavBar extends StatefulWidget {

  final int navIcon;
  const BottomNavBar ({ Key key, this.navIcon }): super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
          key: _bottomNavigationKey,
          height: 50.0,
          index: widget.navIcon,
          items: <Widget>[
            Icon(MdiIcons.home, size: 30,color: Colors.white),
            Icon(Icons.history, size: 30,color: Colors.white),
            Icon(MdiIcons.bookOpen, size: 30,color: Colors.white),
            Icon(MdiIcons.qrcode, size: 30,color: Colors.white),
//            Icon(MdiIcons.qrcodeScan, size: 30,color: Colors.white),
          ],
          color: Colors.blue,
          buttonBackgroundColor: Colors.blue,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              if(index==0){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Wrapper()));
              }
              if(index==1){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => History()));
              }
              if(index==2){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GuideScreen()));
              }
              if(index==3){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GenerateScreen()));
              }
//              if(index==4){
//                Navigator.pushReplacement(
//                    context,
//                    MaterialPageRoute(
//                        builder: (context) => ScanScreen()));
//              }
            });
          },
        );
  }
}