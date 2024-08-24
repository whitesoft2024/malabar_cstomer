import 'package:flutter/material.dart';
import 'package:malabar_cstomer/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  final List<Color> gradientColors1;
  final List<Color> gradientColors2;
  final List<Color> gradientColors3;

  const Background({
    Key? key,
    required this.child,
    this.gradientColors1 = const [kPrimaryColor1, Colors.white], // Default gradient colors
    this.gradientColors2 = const [kPrimaryColor1, Colors.white],
    this.gradientColors3 = const [kPrimaryColor1, Colors.white],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -90,
              left: -80,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: gradientColors1, // Use dynamic colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              right: -150,
              child: CircleAvatar(
                radius: 90,
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: gradientColors2, // Use dynamic colors
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: -50,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: gradientColors3, // Use dynamic colors
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
