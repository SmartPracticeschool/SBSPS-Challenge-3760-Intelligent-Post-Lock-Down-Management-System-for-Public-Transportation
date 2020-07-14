import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_gen_rd/Screens/homescreen/Admin.dart';
import 'package:qr_gen_rd/Screens/homescreen/driver_details.dart';
import 'package:qr_gen_rd/Screens/homescreen/guide_admin.dart';


class AdminNavBar extends StatefulWidget {

  final int navIcon;
  const AdminNavBar ({ Key key, this.navIcon }): super(key: key);

  @override
  _AdminNavBarState createState() => _AdminNavBarState();
}

class _AdminNavBarState extends State<AdminNavBar> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      height: 50.0,
      index: widget.navIcon,
      items: <Widget>[
        Icon(MdiIcons.home, size: 30,color: Colors.white),
        Icon(MdiIcons.newspaper, size: 30,color: Colors.white),
        Icon(MdiIcons.bookOpen, size: 30,color: Colors.white),
//        Icon(MdiIcons.faceProfile, size: 30,color: Colors.white)
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
                    builder: (context) => AdminScreen()));
          }
          if(index==1){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => DriverDetails()));
          }
          if(index==2){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => GuideAdmin()));
          }
//          if(index==3){
//            Navigator.pushReplacement(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => AdminScreen()));
//          }
        });
      },
    );
  }
}