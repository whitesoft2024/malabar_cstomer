import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        body:Center(child: Image.asset("assets/images/goldloan.jpg")),
        );
    }
}