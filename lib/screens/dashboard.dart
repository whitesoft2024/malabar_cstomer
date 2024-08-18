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
  bool _isBalanceVisible = false;

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
        Container(
          // color: primary,
          padding:  EdgeInsets.only(left: 13,right: 13, top: 10,bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Image(image: AssetImage("assets/images/mscs_1.png"),height: 30,width: 40,fit: BoxFit.contain,),
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  radius: 19,
                  backgroundImage: AssetImage(
                      "assets/images/man.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi, Murshid",style: GoogleFonts.montserrat(fontSize: 11,color: Colors.grey.shade400,fontWeight: FontWeight.w600),),
                  Text("Good Morning",style: GoogleFonts.montserrat(fontSize: 15,color: primary2,fontWeight: FontWeight.w800),),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded, color: Colors.black),
              ),

            ],
          ),
        ),
        // Container(
        //   padding: EdgeInsets.symmetric(vertical: 13,horizontal: 15),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text("Welcome back,",style: GoogleFonts.montserrat(fontSize: 13,color: Colors.grey.shade400,fontWeight: FontWeight.w600),),
        //       Text("Murshid",style: GoogleFonts.montserrat(fontSize: 25,color: primary2,fontWeight: FontWeight.w800),),
        //     ],
        //   ),
        // ),

        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 22,left: 22,right: 22,top: 10),
          height: 160,
          decoration: BoxDecoration(
            color: Color(0xFF6F6AD7), borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 10,
                offset: Offset(0, 7), // changes position of shadow
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
                    Text("Saving account",style: GoogleFonts.varela(color: white.withOpacity(0.8),fontSize: 10,fontWeight: FontWeight.w600),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "1234 5678 9000",
                      style: GoogleFonts.varela(
                          color: white.withOpacity(0.9),
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
                        Text(
                          _isBalanceVisible ? "₹2,10,002.00" : "   * * * * * *",
                          style: GoogleFonts.varela(
                            color: white.withOpacity(0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Account balance",
                            style: GoogleFonts.varela(fontSize: 10,color: white.withOpacity(0.8),fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isBalanceVisible = true;
                        });
                        Future.delayed(Duration(seconds: 3), () {
                          setState(() {
                            _isBalanceVisible = false;
                          });
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye_rounded,
                        color: white.withOpacity(0.8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 22),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: black,
              borderRadius: BorderRadius.circular(10)
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
            padding: EdgeInsets.only(top: 15),
            width: double.infinity,
            child: SingleChildScrollView(
                child: getAccountSection()),
          ),
        ),
      ],
    );
  }

  Widget getAccountSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Accounts",
            style: GoogleFonts.montserrat(
                fontSize: 15, fontWeight: FontWeight.w800, color: black),
          ),
          SizedBox(height: 10,),
          Column(
            children: [
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.wallet, "RDS",Colors.blue.shade100),
              SizedBox(width: 15,),
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.credit_card, "RD",Colors.green.shade100),
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.account_balance_wallet_outlined, "Fixed Deposite",Colors.orange.shade100),
              SizedBox(width: 15,),
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, Icons.savings_outlined, "Fixed Deposite",Colors.deepPurple.shade100)
            ],
          ),
        ],
      ),
    );
  }

  Widget Accounts1(Function() onTap, IconData icons, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18,horizontal: 10),
        margin: EdgeInsets.only(bottom: 15),
        // decoration: BoxDecoration(
        //   //color: white,
        //   borderRadius: BorderRadius.circular(12),
        //   boxShadow: [
        //     BoxShadow(
        //       color: black.withOpacity(0.1),
        //       spreadRadius: 3,
        //       blurRadius: 10,
        //     ),
        //   ],
        // ),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1.5, color: black),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(2), // Creates the white space between the border and the inner container
                    decoration: BoxDecoration(
                      color: primary0.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(9), // Should be slightly smaller to fit inside
                    ),
                    child: Center(
                      child: Icon(
                        icons,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
          ],
        ),
      ),
    );
  }

  Widget Accounts(Function() onTap, IconData icons, String title,Color? color){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 08.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF6F6AD7).withOpacity(0.1)
      ),
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(
              icons,
              color: black,
              size: 20,
            ),
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: black,
        ),
        title: Text(
          title,
          style: GoogleFonts.varela(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        // subtitle: Text(
        //   title,
        //   style: TextStyle(
        //       fontSize: 15,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.black),
        // ),
      ),
    );
  }
}
