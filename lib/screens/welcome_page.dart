// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:malabar_cstomer/Screens/register.dart';
//
// import '../constants.dart';
// import '../widgets/my_text_button.dart';
// import 'login_screen.dart';
//
//
// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Flexible(
//                 child: Column(
//                   children: [
//                     Center(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         child: Image(
//                           image:
//                           AssetImage('assets/images/screen2.png'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Enterprise team\ncollaboration.",
//                       style: kHeadline,
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width * 0.8,
//                       child: Text(
//                         "Bring together your files, your tools, project and people.Including a new mobile and desktop application.",
//                         style: kBodyText,
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 60,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[850],
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: MyTextButton(
//                         bgColor: Colors.white,
//                         buttonName: 'Register',
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               CupertinoPageRoute(
//                                   builder: (context) => RegisterScreen()));
//                         },
//                         textColor: Colors.black87,
//                       ),
//                     ),
//                     Expanded(
//                       child: MyTextButton(
//                         bgColor: Colors.transparent,
//                         buttonName: 'Sign In',
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               CupertinoPageRoute(
//                                 builder: (context) => LoginScreen(),
//                               ));
//                         },
//                         textColor: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }