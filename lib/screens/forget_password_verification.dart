import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malabar_cstomer/constants.dart';
import 'package:malabar_cstomer/widgets/background.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../widgets/header_widget.dart';
import '../widgets/theme_helper.dart';
import 'forget_password_change_page.dart';


class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordVerificationPageState createState() => _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Background(
          // gradientColors1: [Colors.red, Colors.amber],
          // gradientColors2: [Colors.blue, Colors.green],
          // gradientColors3: [Colors.purple, Colors.pink],
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: _headerHeight,
                //   child: HeaderWidget(
                //       _headerHeight, true, Icons.privacy_tip_outlined),
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
                              Text('Verification',
                                style: GoogleFonts.montserrat(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'Enter the verification code we just sent you on your email address.',
                                style: GoogleFonts.varela(
                                  // fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54
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
                              Theme(
                                data: ThemeData(
                                  textSelectionTheme: TextSelectionThemeData(
                                    cursorColor: Colors.black54,  // Change this to your desired cursor color
                                  ),
                                ),
                                child: OTPTextField(
                                  length: 4,
                                  width: 300,
                                  fieldWidth: 50,
                                  style: GoogleFonts.roboto( // Change font to Roboto
                                    fontSize: 30,color: Colors.black
                                  ),
                                  otpFieldStyle: OtpFieldStyle(
                                    focusBorderColor: Colors.black,
                                  ),
                                  textFieldAlignment: MainAxisAlignment.spaceAround,
                                  fieldStyle: FieldStyle.box,
                                  onCompleted: (pin) {
                                    setState(() {
                                      _pinSuccess = true;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 50.0),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "If you didn't receive a code! ",
                                      style: GoogleFonts.varela(
                                        color: Colors.black38,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Resend',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ThemeHelper().alartDialog("Successful",
                                                  "Verification code resend successful.",
                                                  context);
                                            },
                                          );
                                        },
                                      style: GoogleFonts.varela(
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryColor1
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 40.0),
                              Container(
                                decoration: _pinSuccess ? ThemeHelper().buttonBoxDecoration(context):ThemeHelper().buttonBoxDecoration(context, "#AAAAAA","#757575"),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        40, 10, 40, 10),
                                    child: Text(
                                      "Verify".toUpperCase(),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onPressed: _pinSuccess ? () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => ForgotChnagePage()
                                        ),
                                            (Route<dynamic> route) => false
                                    );
                                  } : null,
                                ),
                              ),
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