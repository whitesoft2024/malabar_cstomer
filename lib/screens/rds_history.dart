import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RdsHistory(),
    );
  }
}

class RdsHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor:kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFDEC0C0),
                    child: Text('H', style: GoogleFonts.montserrat(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'To HANEEFA N',
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '₹5',
                    style: GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle,color: Colors.green,size: 15,),
                      SizedBox(width: 5,),
                      Text(
                        'Completed',
                        style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Divider(indent: 40,endIndent: 40,),
                  Text('31 Aug 2024, 12:36 pm',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1,color: grey)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Image(image: AssetImage("assets/images/mscs_1.png",),height: 20,),
                    title: Text('Malabar Bank',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                    //trailing: Icon(Icons.keyboard_arrow_down),
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RDS transaction ID ',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                        Text('424462637200',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                        SizedBox(height: 10),
                        Text('To: HANEEFA N ',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                        Text('(Malabar Bank)',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                        SizedBox(height: 10),
                        Text('From: MURSHID KATTUKULATH',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                        SizedBox(height: 10),
                        Text('RDS Bill ID',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                        Text('CICAgPCLO92gMA',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {}, child: Text('Share',style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
