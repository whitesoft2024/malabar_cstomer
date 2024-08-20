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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.home_rounded,
      Ionicons.person_circle,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: Color(0xFF6F6AD7),
      splashColor: secondary,
      inactiveColor: Colors.black,
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 23,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
