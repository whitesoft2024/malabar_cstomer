import 'package:flutter/material.dart';
import 'package:malabar_cstomer/screens/loginpage.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor1,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor1,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 50),
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: white,
            iconColor: kPrimaryColor1,
            prefixIconColor: kPrimaryColor1,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: const BorderSide(color: Colors.grey,width: 1.5)),
            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400,)),
            errorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.black87, width: 1.5)),
            focusedErrorBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.black45, width: 2.0)),
          )
      ),
      home:  LoginScreen(),
    );
  }
}