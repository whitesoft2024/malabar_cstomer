import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../data_json/blance_json.dart';
import 'card_page.dart';

class DashbaordPage extends StatefulWidget {
  const DashbaordPage({Key? key}) : super(key: key);

  @override
  State<DashbaordPage> createState() => _DashbaordPageState();
}

class _DashbaordPageState extends State<DashbaordPage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Moved AppBar content here
        Container(
          color: primary,
          padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage("assets/images/mscs_1.png"),height: 30,width: 40,fit: BoxFit.contain,),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       'Hello',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 10.0,
              //       ),
              //     ),
              //     Text(
              //       'Username',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 14.0,
              //       ),
              //     ),
              //   ],
              // ),
              //Spacer(),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.more_vert_rounded, color: Colors.black),
              // ),
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                      "assets/images/user.png"),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 13,horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,",style: GoogleFonts.montserrat(fontSize: 13,color: Colors.grey.shade400,fontWeight: FontWeight.w600),),
              Text("Murshid",style: GoogleFonts.montserrat(fontSize: 25,color: black,fontWeight: FontWeight.w800),),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20,left: 15,right: 15),
          height: 170,
          decoration: BoxDecoration(
            color: black, borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],

          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Saving account",style: GoogleFonts.varela(color: Colors.grey.shade400,fontSize: 10,fontWeight: FontWeight.w600),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "1234 5678 9000",
                      style: GoogleFonts.varela(
                          color: white.withOpacity(0.8),
                          fontSize: 20,
                          wordSpacing: 15),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("₹2,10,002.00",style: GoogleFonts.varela(color: Colors.grey.shade400,fontSize: 15,fontWeight: FontWeight.w600),),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Account balance",
                            style: GoogleFonts.varela(fontSize: 10,color: Colors.grey.shade400,fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.remove_red_eye_rounded,color: Colors.grey.shade600,)
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        // Container(
        //   width: double.infinity,
        //   height: size.height * 0.25,
        //   decoration: BoxDecoration(color: primary),
        //   child: Column(
        //     children: [
        //       Container(
        //         width: double.infinity,
        //         height: 110,
        //         child: SingleChildScrollView(
        //           scrollDirection: Axis.horizontal,
        //           child: Row(
        //             children: List.generate(balanceLists.length, (index) {
        //               return Padding(
        //                 padding: const EdgeInsets.only(right: 20),
        //                 child: Container(
        //                   width: size.width * 0.7,
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     children: [
        //                       Row(
        //                         mainAxisAlignment: MainAxisAlignment.center,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Padding(
        //                             padding: const EdgeInsets.only(top: 5),
        //                             child: Text(
        //                               balanceLists[index]['currency'],
        //                               style: TextStyle(
        //                                   fontSize: 17,
        //                                   color: index == 0
        //                                       ? Colors.black
        //                                       : Colors.black.withOpacity(0.5),
        //                                   fontWeight: FontWeight.bold),
        //                             ),
        //                           ),
        //                           SizedBox(
        //                             width: 5,
        //                           ),
        //                           Text(
        //                             balanceLists[index]['amount'],
        //                             style: TextStyle(
        //                                 fontSize: 35,
        //                                 color: index == 0
        //                                     ? black
        //                                     : black.withOpacity(0.5),
        //                                 fontWeight: FontWeight.bold),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                         height: 8,
        //                       ),
        //                       Text(
        //                         balanceLists[index]['description'],
        //                         style: TextStyle(
        //                           fontSize: 15,
        //                           color: white.withOpacity(0.5),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               );
        //             }),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: SingleChildScrollView(
                child: getAccountSection()),
          ),
        ),
      ],
    );
  }

  Widget getAccountSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Accounts",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.wallet, "RDS"),
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.wallet, "RD"),
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.wallet, "Fixed Deposite"),
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.wallet, "Fixed Deposite")
            ],
          ),
        ],
      ),
    );
  }

  Widget Accounts(Function() onTap, IconData icons, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: secondary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Icon(
                      icons,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: black,
            )
          ],
        ),
      ),
    );
  }
}
