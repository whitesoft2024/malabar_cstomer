import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';


class EmiDetailPage extends StatelessWidget {
  final Map<String, dynamic> emiItem;
  final String customerName;

  EmiDetailPage({required this.emiItem, required this.customerName});

  @override
  Widget build(BuildContext context) {
    bool isWithdrawal = emiItem.containsKey('withdrawalAmount') && emiItem['withdrawalAmount'] != null;

    return Scaffold(
      //backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: white,
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
                    backgroundColor: Color(0xFFC0DEC2),
                    child: Text('${emiItem['User']}'[0].toUpperCase(), style: GoogleFonts.montserrat(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${emiItem['User'] ?? 'No user information'}',
                    style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${isWithdrawal ? emiItem['withdrawalAmount']?.toString() : emiItem['newAmount']?.toString() ?? 'No amount information'}',
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
                  Text('${emiItem['Date']} at ${emiItem['time']}',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
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
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('RDS transaction ID ',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                        Text('${isWithdrawal ? emiItem['withdrawTransactionId'] ?? 'No transaction ID' : emiItem['depositTransactionId'] ?? 'No transaction ID'}',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                        SizedBox(height: 10),
                        Text('To: ${emiItem['User']}',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                        Text('(Malabar Bank)',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                        SizedBox(height: 10),
                        // Show the dynamic customer name here:
                        Text('From: $customerName',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
                        SizedBox(height: 10),
                        Text('RDS Bill ID',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w600),),
                        Text('${isWithdrawal ? emiItem['withdrawRdsBill'] ?? 'No bill information' : emiItem['depositRdsBill'] ?? 'No bill information'}',style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.w700),),
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

