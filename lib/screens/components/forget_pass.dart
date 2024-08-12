import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import '../../../constants.dart';
import '../../animation/change_screen_animation.dart';


class PasswordContent extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onOk;

   PasswordContent({Key? key, required this.onBack,  required this.onOk}) : super(key: key);

  @override
  State<PasswordContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<PasswordContent>
    with TickerProviderStateMixin {
  late final List<Widget> passwordContent;

  Widget inputField(String hint, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: AnimatedBuilder(
            animation: ChangeScreenAnimation.textFieldOffsetAnimation2,
            builder: (context, child) {
              return SlideTransition(
                position: ChangeScreenAnimation.textFieldOffsetAnimation2,
                child: child,
              );
            },
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              style: GoogleFonts.exo2(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: hint,
                hintStyle: TextStyle(fontSize: 15),
                prefixIcon: Icon(iconData, size: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget okButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 105, vertical: 20),
      child: AnimatedBuilder(
        animation: ChangeScreenAnimation.passwordOffsetAnimation,
        builder: (context, child) {
          return SlideTransition(
            position: ChangeScreenAnimation.passwordOffsetAnimation,
            child: child,
          );
        },
        child: ElevatedButton(
          onPressed:widget.onOk,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            backgroundColor: kSecondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 8,
            shadowColor: Colors.black87,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget TopText() {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 30,bottom: 40),
      child: Text("Reset\nPassword",
        style: GoogleFonts.exo(
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();

    passwordContent = [
      TopText(),
      inputField('Mobile No', Ionicons.phone_portrait_outline),
      inputField('New Password', Ionicons.lock_closed_outline),
      inputField('Confirm Password', Ionicons.lock_closed_outline,),
      okButton('OK'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: Icon(Ionicons.arrow_back, color: Colors.white),
            onPressed: widget.onBack,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: passwordContent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
