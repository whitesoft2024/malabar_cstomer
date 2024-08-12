import 'package:flutter/material.dart';

class ChangeScreenAnimation {
  static late AnimationController controller;
  static late Animation<Offset> textFieldOffsetAnimation;
  static late Animation<Offset> textFieldOffsetAnimation2;
  static late Animation<Offset> loginButtonOffsetAnimation;
  static late Animation<Offset> passwordOffsetAnimation;

  static void initialize(TickerProvider vsync) {
    controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: vsync,
    );

    textFieldOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1.5, 0),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    textFieldOffsetAnimation2 = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    loginButtonOffsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0, 2),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    passwordOffsetAnimation = Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  static void forward() => controller.forward();
  static void reverse() => controller.reverse();
}
