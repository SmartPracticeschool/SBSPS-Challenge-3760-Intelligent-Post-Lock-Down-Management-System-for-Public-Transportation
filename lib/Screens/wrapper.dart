import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen_rd/Screens/homescreen/home_screen.dart';
import 'package:qr_gen_rd/Screens/authenticate/authenticate.dart';
import 'package:qr_gen_rd/Models/user.dart';

/*USE --> Switch between Authentication and Home screen
  CONDITION --> If user object returns a non-null value. i.e, sign in success, it redirects to Home-screen */

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context); // Accessing User data from the Stream

    // User Signed-in
    if (user != null) {
      return HomeScreen(user);
    }
    // User Signed-in
    else {
      return Authenticate();
    }
  }
}
