import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../data_json/card_json.dart';
import '../data_json/card_operation.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
      PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: black,
            size: 18,
          )),
      title: Text(
        "RDS",
        style: TextStyle(fontSize: 18, color: black,fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.more_vert, color: black, size: 25))
      // ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Expanded(child: Text("RDS Number ",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),)),
                  Expanded(child: Text(": RDS1234567890",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),))
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Total amount ",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),)),
                  Expanded(child: Text(": 45672",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),))
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 22,vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 22,vertical: 5),
                    child: Container(),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}