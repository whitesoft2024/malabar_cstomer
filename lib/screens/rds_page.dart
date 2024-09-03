import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:malabar_cstomer/screens/rds_history.dart';
import '../constants.dart';
import '../data_json/card_json.dart';
import '../data_json/card_operation.dart';

class RdsPage extends StatefulWidget {
  const RdsPage({Key? key}) : super(key: key);

  @override
  State<RdsPage> createState() => _RdsPageState();
}

class _RdsPageState extends State<RdsPage> {

  void  _openDatePicker(BuildContext context){
    BottomPicker.date(
      pickerTitle: Text("Select a Date",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),),
      dateOrder: DatePickerDateOrder.dmy,
      maxDateTime: DateTime(2100),
      minDateTime: DateTime(2000),
      pickerTextStyle: GoogleFonts.rubik(
        color: black,
        fontWeight: FontWeight.w500,
        fontSize: 15
      ),
      onChange: (index){
        print(index);
      },
      buttonContent: Center(
        child: Text("Select",style: GoogleFonts.montserrat(
            color: white,fontWeight: FontWeight.w500),),
      ),
      buttonStyle: BoxDecoration(
        color: black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5)
      ) ,
      initialDateTime: DateTime.now(),
      bottomPickerTheme: BottomPickerTheme.blue,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:
      PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
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
      title: Text(
        "RDS",
        style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed:(){
            _openDatePicker(context);
          },
          icon: Icon(Icons.today_rounded, color: Colors.black, size: 20),
        ),
      ],
    );
  }


  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final PageController controller = PageController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        //   child:  Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text("Name",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),),
        //       Row(
        //         children: [
        //           Expanded(child: Text("RDS Number ",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),)),
        //           Expanded(child: Text(": RDS1234567890",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),))
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           Expanded(child: Text("Total amount ",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),)),
        //           Expanded(child: Text(": 45672",style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.bold),))
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 5,left: 33,right: 33,top: 8),
          height: 160,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xBA04F691).withOpacity(0.6),
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
                    Text("Murshid kk".toUpperCase(),style: GoogleFonts.varela(color: white.withOpacity(0.8),fontSize: 15,fontWeight: FontWeight.w600),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "RDS547382749343".toUpperCase(),
                      style: GoogleFonts.varela(
                          color: white.withOpacity(0.9),
                          fontSize: 16,
                          wordSpacing: 15,
                        fontWeight: FontWeight.w600
                      ),
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
                          "₹2,10,002.00" ,
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
                            "RDS balance",
                            style: GoogleFonts.varela(fontSize: 10,color: white.withOpacity(0.8),fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0,right: 10),
                      child: Text("Active",style: GoogleFonts.montserrat(color: white.withOpacity(0.7),fontSize: 11),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 22,vertical: 10),
          child: Text("History",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(
                        fontSize:14,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(
                        color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 05),
                  elevation: 2, // Add elevation for shadow
                  color: white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RdsHistory()));
                    },
                    trailing: Text("₹1,212",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,color: Color(
                        0xFF44CC6C))),
                    title: Text("Haneefa N",style: GoogleFonts.montserrat(fontSize:15,color: Colors.black,fontWeight: FontWeight.w700),),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    subtitle: Text("31 August 2024  at 12:36 pm",style: GoogleFonts.roboto(color: Colors.black,fontSize:11,fontWeight: FontWeight.w700)),
                  ),
                ),


              ],
            ),
          ),
        )
      ],
    );
  }
}