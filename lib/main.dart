import 'package:flutter/material.dart';
import 'package:qr_gen_rd/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:qr_gen_rd/Models/user.dart';
import 'package:qr_gen_rd/Screens/startUp.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // It is listening to stream, to check for User object's state change
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EasyTrans',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,),
        ),
        home: StartUp(),
      ),
    );
  }
}
