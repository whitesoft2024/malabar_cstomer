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
  bool _isBalanceVisible = false;

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
          margin: EdgeInsets.only(bottom: 5,left: 22,right: 22,top: 8),
          height: 170,
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
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    title: Table(
                      columnWidths: const {
                        4: IntrinsicColumnWidth(), // Adjusts first column width based on its content
                        0: FlexColumnWidth(),      // Second column takes up the remaining width
                      },
                      children: [
                        TableRow(
                          children: [
                            Text(
                              'Amount',
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                            Text(
                              ': 45678',
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Date',
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                            Text(
                              ': 32 3232 3',
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              'Type',
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                            Text(
                              ': Withdraw',
                              style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 11),
                            ),
                          ],
                        ),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                        child: Table(
                          columnWidths: {
                            2: IntrinsicColumnWidth(), // Adjusts the first column width based on its content
                            3: FlexColumnWidth(),      // The second column takes up the remaining width
                          },
                          children: [
                            TableRow(
                              children: [
                                Text('Balance', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                                Text(': 87654', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text('Employee', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                                Text(': safu', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text('Transaction ID', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                                Text(': df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                              ],
                            ),
                            TableRow(
                              children: [
                                Text('Bill No', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                                Text(': rds567893728', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    iconColor: Colors.red,
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 22.0, vertical: 5),
                  elevation: 5, // Add elevation for shadow
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ExpansionTile(
                    leading: Image.asset("assets/images/mscs_1.png",height: 60,width: 40,),
                    title: Text(
                      'Amount : 4567',
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date : 32 3232 3',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                        Text('Type : Withdraw',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 10),),
                      ],
                    ),
                    backgroundColor: Colors.white70,
                    collapsedBackgroundColor: Colors.white70,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    expandedAlignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance : 87654',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Text('Employee : safu',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Transaction ID: ', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 12),),
                                Expanded(
                                  child: Text('df45657887675465690845768', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 10),),
                                ),
                              ],
                            ),
                            Text('Bill No : rds567893728',style: GoogleFonts.montserrat(fontWeight: FontWeight.w600,fontSize: 12),),
                          ],
                        ),
                      ),
                    ],
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