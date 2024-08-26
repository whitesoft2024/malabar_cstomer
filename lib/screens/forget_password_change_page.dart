
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malabar_cstomer/screens/loginpage.dart';
import 'package:malabar_cstomer/widgets/background.dart';

import '../widgets/theme_helper.dart';
import 'forget_password_verification.dart';

class ForgotChnagePage extends StatefulWidget {
  const ForgotChnagePage({Key? key}) : super(key: key);

  @override
  _ForgotChnagePageState createState() => _ForgotChnagePageState();
}

class _ForgotChnagePageState extends State<ForgotChnagePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Background(
          // gradientColors1: [Colors.red, Colors.orange],
          // gradientColors2: [Colors.blue, Colors.green],
          // gradientColors3: [Colors.purple, Colors.pink],
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: _headerHeight,
                //   child: HeaderWidget(_headerHeight, true, Icons.password_rounded),
                // ),
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Enter New Password',
                                style: GoogleFonts.varela(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10,),
                              Text('Enter the email address associated with your account.',
                                style: GoogleFonts.varela(
                                  // fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10,),
                              Text('We will email you a verification code to check your authenticity.',
                                style: GoogleFonts.varela(
                                  color: Colors.black38,
                                  // fontSize: 20,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  style: GoogleFonts.varela(fontSize: 14,fontWeight: FontWeight.w600),
                                  cursorColor: Colors.orangeAccent,
                                  decoration: ThemeHelper().textInputDecoration("New Mobile Number", "Enter your mobile number", Icon(Icons.phone_android_rounded, size: 17),).
                                  copyWith(
                                    errorStyle: GoogleFonts.mada(
                                      color: Colors.black, // Change this to your desired color
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Mobile number can't be empty";
                                    }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  style: GoogleFonts.varela(fontSize: 14,fontWeight: FontWeight.w600),
                                  cursorColor: Colors.orangeAccent,
                                  decoration: ThemeHelper().textInputDecoration("New Password", "Enter new password", Icon(Icons.lock, size: 17),).
                                  copyWith(
                                    errorStyle: GoogleFonts.mada(
                                      color: Colors.black, // Change this to your desired color
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                    // else if (!RegExp(
                                    //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    //     .hasMatch(val)) {
                                    //   return "Enter a valid email address";
                                    // }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  style: GoogleFonts.varela(fontSize: 14,fontWeight: FontWeight.w600),
                                  cursorColor: Colors.orangeAccent,
                                  decoration: ThemeHelper().textInputDecoration("Confirm Password", "Re-Enter new password", Icon(Icons.password_sharp, size: 17),).
                                  copyWith(
                                    errorStyle: GoogleFonts.mada(
                                      color: Colors.black, // Change this to your desired color
                                    ),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Password can't be empty";
                                    }
                                    // else if (!RegExp(
                                    //     r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    //     .hasMatch(val)) {
                                    //   return "Enter a valid email address";
                                    // }
                                    return null;
                                  },
                                ),
                                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              ),

                              SizedBox(height: 40.0),
                              Container(
                                decoration: ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      "done".toUpperCase(),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    if(_formKey.currentState!.validate()) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginScreen()),
                                      );
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 30.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}