import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_gen_rd/styles/loading.dart';
import 'package:qr_gen_rd/services/auth.dart';
import 'package:qr_gen_rd/styles/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_gen_rd/styles/clip_path.dart';

/* Contains Sign-in function
Describes implementation on how to Authenticate with FireBase Authentication Services*/

class SignIn extends StatefulWidget {

  final Function toggleFunction; // The function we received as a parameter
  SignIn(
      {this.toggleFunction}); // Constructor makes the parameter property of widget

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService(); // Custom made AuthServices
  final _formKey = GlobalKey<FormState>(); // A global key of type FormState, Used to identify our form

  // When loading is true we will put a spinner
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                      Positioned(
                          top: 10,
                          right: 10,
                          child: FlatButton.icon(
                            onPressed: () {
                              widget.toggleFunction(); // Accessing toggleFunction property of Sign-in widget
                            },
                            icon: Icon(
                              Icons.person,
                              color: white,
                            ),
                            label: Text(
                              "Register",
                              style: TextStyle(color: white),
                            ),
                          )),
                      Text(
                        "Login",
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
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  child: Center(
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                error,
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0))),
                                validator: (value) => value.isEmpty
                                    ? 'Enter Email'
                                    : null, // If value empty, return helper text else return null
                                onChanged: (value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    fillColor: Colors.white,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0))),
                                validator: (value) => value.length < 6
                                    ? 'Enter Atleast 6 Charaters'
                                    : null,
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {
                                    password = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                hoverElevation: 5,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                color: Colors.blue,
                                textColor: Colors.white,
                                // Condition:- is our form valid ?
                                // This validate() method uses validator properties of form
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true); // If loading is true,
                                    dynamic result =
                                        await _auth.signinWithEmailAndPassword(email, password);
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                        error = 'Invalid Credentials';
                                      });
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                            ])),
                  ),
                ),
              ],
            ),
          )));
  }
}

