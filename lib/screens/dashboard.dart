import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  final myitems = [
    'assets/images/AD1.jpg',
    'assets/images/AD2.jpg',
    'assets/images/AD3.jpg',
    'assets/images/AD4.jpg',
    "assets/images/goldloan.jpg",
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
          padding:  EdgeInsets.only(left: 22,right: 10, top: 28,bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Image(image: AssetImage("assets/images/user.png"),height: 35,width: 40,fit: BoxFit.contain,),
              // IconButton(
              //   onPressed: () {},
              //   icon: CircleAvatar(
              //     radius: 19,
              //     backgroundImage: AssetImage(
              //         "assets/images/man.png"),
              //   ),
              // ),
              IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 16,
                  child: Icon(Icons.person,size: 20,color: kPrimaryColor1,),
                ),
              ),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi, Murshid",style: GoogleFonts.montserrat(fontSize: 10,color: Colors.grey.shade400,fontWeight: FontWeight.w600),),
                  Text("Good Morning",style: GoogleFonts.varela(fontSize: 13,color: primary2,fontWeight: FontWeight.w700),),
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

        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                height: 140,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayInterval: const Duration(seconds: 4),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
              ),
              items: myitems.map((imageUrl) {
                return RoundedImages(imageUrl: imageUrl);
              }).toList(),
            ),
            Positioned(
              bottom: 10,  // Adjust the position of the indicator
              child: AnimatedSmoothIndicator(
                activeIndex: myCurrentIndex,
                count: myitems.length,
                effect: JumpingDotEffect(
                  dotHeight: 3,
                  dotWidth: 12,
                  spacing: 7,
                  dotColor: kPrimaryLightColor,
                  activeDotColor: kPrimaryColor1,
                  paintStyle: PaintingStyle.fill,
                ),
              ),
            ),
          ],
        ),




        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 5,left: 22,right: 22,top: 8),
                  height: 170,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xBAF60403).withOpacity(0.6),
                        Color(0xF2070707),],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.clamp
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color:black.withOpacity(0.4),
                        spreadRadius: 3,
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
                  padding: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: getAccountSection(),
                ),
              ],
            ),
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
          SizedBox(height: 5,),
          Column(
            children: [
              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, "assets/images/deposit 1.png", "RDS",Color(0xFFFFFFFF)),

              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, "assets/images/rd.png", "RD",Color(0xFFFFFFFF)),

              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, "assets/images/rate.png", "Fixed Deposite",Color(0xFFFFFFFF)),

              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, "assets/images/saving.png", "Savings",Color(0xFFFFFFFF)),

              Accounts(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardPage()));
              }, "assets/images/groups.png", "GDCS",Color(0xFFFFFFFF))
            ],
          ),
        ],
      ),
    );
  }

  Widget Accounts(Function() onTap, String image, String title, Color? color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF8F8BDA).withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 8,
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: EdgeInsets.all(7),
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Image(
              height: 28,
              image: AssetImage(image as String),
              fit: BoxFit.contain,
            ),
          ),
        ),
        trailing: const Icon(
          size: 21,
          Icons.keyboard_arrow_right,
          color: Colors.black, // Use Colors.black instead of black
        ),
        title: Text(
          title,
          style: GoogleFonts.jost(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
    );
  }

  Widget Accounts1(Function() onTap, IconData icons, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
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
                        size: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: GoogleFonts.varela(
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
}

class RoundedImages extends StatelessWidget {
  const RoundedImages({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 22),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(image: AssetImage(imageUrl) as ImageProvider,fit: BoxFit.cover,)
      ),
    );
  }
}
