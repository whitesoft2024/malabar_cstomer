import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:malabar_cstomer/screens/components/forget_pass.dart';
import '../../animation/change_screen_animation.dart';
import '../../constants.dart';
import '../HomePage.dart';


class LoginContent extends StatefulWidget {
  final VoidCallback onForgotPassword;

  const LoginContent({Key? key, required this.onForgotPassword}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> with TickerProviderStateMixin {
  late final List<Widget> loginContent;

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
            animation: ChangeScreenAnimation.textFieldOffsetAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: ChangeScreenAnimation.textFieldOffsetAnimation,
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

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 105, vertical: 20),
      child: AnimatedBuilder(
        animation: ChangeScreenAnimation.loginButtonOffsetAnimation,
        builder: (context, child) {
          return SlideTransition(
            position: ChangeScreenAnimation.loginButtonOffsetAnimation,
            child: child,
          );
        },
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
          },
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

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }


  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: TextButton(
        onPressed: widget.onForgotPassword,
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

  Widget TopText() {
    return Padding(
      padding: EdgeInsets.only(top: 10,left: 30,bottom: 40),
      child: Text("Welcome\nBack",
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

    // createAccountContent = [
    //   inputField('Name', Ionicons.person_outline),
    //   inputField('Email', Ionicons.mail_outline),
    //   inputField('Password', Ionicons.lock_closed_outline),
    //   loginButton('Sign Up'),
    //   //orDivider(),
    //   //logos(),
    // ];

    loginContent = [
      TopText(),
      inputField('Username or Mobile No ', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed_outline,),
      loginButton('Log In'),
      forgotPassword(),
    ];

    // Ensure the animation is initialized after the content is populated
    // ChangeScreenAnimation.initialize(
    //   vsync: this,
    //   createAccountItems: createAccountContent.length,
    //   loginItems: loginContent.length,
    // );
    //
    // for (var i = 0; i < createAccountContent.length; i++) {
    //   createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
    //     animation: ChangeScreenAnimation.createAccountAnimations[i],
    //     child: createAccountContent[i],
    //   );
    // }
    //
    // for (var i = 0; i < loginContent.length; i++) {
    //   loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
    //     animation: ChangeScreenAnimation.loginAnimations[i],
    //     child: loginContent[i],
    //   );
    // }
  }

  // @override
  // void dispose() {
  //   ChangeScreenAnimation.dispose();
  //
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
