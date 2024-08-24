import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malabar_cstomer/constants.dart';
import 'package:malabar_cstomer/screens/HomePage.dart';

import 'dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg.png", // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),
          Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                       Text(
                        "LOGIN",
                        style: GoogleFonts.varela(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Align the image to the center
                        children: [
                          Image.asset("assets/images/login2.png",width: 270,),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    // Add padding for better UI
                    child: Form(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              style: GoogleFonts.varela(fontSize: 13),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: kPrimaryColor1,
                              onSaved: (email) {},
                              decoration: const InputDecoration(
                                hintText: "Your email",
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Icon(Icons.person,),
                                ),
                                isDense: true,
                              ),
                            ),
                          ),
                          TextFormField(
                            style: GoogleFonts.varela(fontSize: 13),
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                            cursorColor: kPrimaryColor1,
                            decoration: const InputDecoration(
                              hintText: "Your password",
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 13),
                                child: Icon(Icons.lock,),
                              ),
                              isDense: true,
                            ),
                          ),
                          const SizedBox(height: 35),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => homepage()));
                            },
                            child: Text(
                              "Login".toUpperCase(),
                              style: GoogleFonts.varela(fontSize: 13),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => homepage()));
                              },
                              child: Text("Forget Password !")
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}

