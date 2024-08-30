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
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Set preferred height for AppBar
        child: getAppBar(context),),
      body: getBody(),
    );
  }

  Widget getAppBar(BuildContext context) {
    return Container(
      color: Color(0xFF252424),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AppBar(
        backgroundColor: Color(0xFF252424),
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            radius: 16,
            child: Icon(
              Icons.person,
              size: 20,
              color: kPrimaryColor1,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Murshid",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Good Morning",
              style: GoogleFonts.varela(
                fontSize: 13,
                color: Colors.white, // Update the color reference here
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF252424),
                    borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(200, 30),bottomLeft: Radius.elliptical(200,30))
                  ),
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(30,10,30,30),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xBAF60403).withOpacity(0.6),
                          Color(0xFD3F1F1F),],
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
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  width: double.infinity,
                  child: getAccountSection(),
                ),
                sliderAds(),
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
         // SizedBox(height: 5,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Accounts(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CardPage()));
                  }, "assets/images/saving.png", "Savings",Color(0xFFFFFFFF)),

                  Accounts(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CardPage()));
                  }, "assets/images/groups.png", "GDCS",Color(0xFFFFFFFF)),

                  Accounts(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CardPage()));
                  }, "assets/images/groups.png", "GDCS",Color(0xFFFFFFFF)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget Accounts1(Function() onTap, String image, String title, Color? color) {
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
              image: AssetImage(image),
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

  Widget Accounts(Function() onTap,String image, String title, Color? color) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child:Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: size.width /3 -15,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.contain,
                height: 30,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sliderAds(){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              height: 170,
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
