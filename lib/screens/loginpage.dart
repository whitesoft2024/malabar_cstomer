import 'dart:math' as math;

import 'package:flutter/material.dart';
import '../animation/change_screen_animation.dart';
import 'components/center_widget/center_widget.dart';
import 'components/login_content.dart';
import 'components/forget_pass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin  {
  bool isForgotPassword = false;

  @override
  void initState() {
    super.initState();
    ChangeScreenAnimation.initialize(this);
  }

  @override
  void dispose() {
    ChangeScreenAnimation.controller.dispose();
    super.dispose();
  }

  void toggleForgotPassword() {
    setState(() {
      isForgotPassword = !isForgotPassword;
    });
    if (isForgotPassword) {
      ChangeScreenAnimation.forward();
    } else {
      ChangeScreenAnimation.reverse();
    }
  }

  void handleOkButton() {
    toggleForgotPassword();
  }

  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              Color(0xADF32C15),
              Color(0xB3EF6C0F),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
          colors: [
            Color(0xDBE73131),
            Color(0xFF332D),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child: topWidget(screenSize.width),
          ),
          Positioned(
            bottom: -180,
            left: -40,
            child: bottomWidget(screenSize.width),
          ),
          CenterWidget(size: screenSize),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 700),
            // transitionBuilder: (Widget child, Animation<double> animation) {
            //   return FadeTransition(
            //     opacity: animation,
            //     child: child,
            //   );
            // },
            child: isForgotPassword
                ? PasswordContent(onBack: toggleForgotPassword, onOk: handleOkButton,)
                : LoginContent(onForgotPassword: toggleForgotPassword),
          )
        ],
      ),
    );
  }
}
