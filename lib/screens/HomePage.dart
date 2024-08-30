import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../constants.dart';
import 'dashboard.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        bottomNavigationBar: getFooter(),
        body: getBody(),
        // floatingActionButton:FloatingActionButton(
        //     onPressed: () {
        //       selectedTab(2);
        //     },
        //     child: Icon(
        //       Ionicons.card_outline,
        //       size: 25,
        //     ),
        //     backgroundColor: primary,
        //     shape: CircleBorder(),
        //     ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        DashbaordPage(),
        Center(
          child: Text(
            "Chat Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
        Center(
          child: Text(
            "Notification Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.home_filled,
      Icons.person_rounded,
    ];

    return AnimatedBottomNavigationBar(
      height: 53,
      backgroundColor: Color(0xFF252424),
      activeColor: kPrimaryColor1,
      splashRadius: 0,
      splashColor: kPrimaryLightColor,
      inactiveColor: Colors.grey,
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.smoothEdge,
      //leftCornerRadius: 10,
      iconSize: 23,
      //rightCornerRadius: 10,
      blurEffect: true,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  void selectedTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
