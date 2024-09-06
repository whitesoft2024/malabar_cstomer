import 'dart:convert';
import 'dart:math';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:malabar_cstomer/screens/rds_history.dart';
import '../constants.dart';

class Customer {
  final String id;
  final String customerName;
  final String membershipId;
  final String RDSNumber;
  final String newDate;
  final String date;
  final String address;
  final String balanceAmount;
  final int sl; // Changed to int
  final String membershipType;
  final String customerMobile;
  final List<dynamic> emiData;

  Customer({
    required this.id,
    required this.customerName,
    required this.membershipId,
    required this.RDSNumber,
    required this.newDate,
    required this.date,
    required this.address,
    required this.balanceAmount,
    required this.sl,
    required this.membershipType,
    required this.customerMobile,
    required this.emiData,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['_id'] ?? '',
      customerName: json['customerName'] ?? '',
      membershipId: json['membershipId'] ?? '',
      RDSNumber: json['RDSNumber'] ?? '',
      newDate: json['newDate'] ?? '',
      date: json['date'] ?? '',
      address: json['address'] ?? '',
      balanceAmount: json['balanceAmount'] ?? '',
      sl: json['sl_no'] ?? 0, // Changed to int
      membershipType: json['membershipType'] ?? '',
      customerMobile: json['customerNumber'] ?? '', // Assumes this is a string in the JSON
      emiData: json['EmiData'] != null ? List<dynamic>.from(json['EmiData']) : [],
    );
  }
}


Future<Customer?> fetchCustomerByMembershipId(String branch, String membershipId) async {
  final url = 'https://api.malabarbank.in/api/RDSdata?branch=$branch&membershipId=$membershipId';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonData = json.decode(response.body);

    if (jsonData['data'] != null && jsonData['data'] is List) {
      List<dynamic> customersJson = jsonData['data'];

      // Find the customer with the matching membershipId
      final customerData = customersJson.firstWhere(
            (data) => data['membershipId'] == membershipId,
        orElse: () => null,
      );

      if (customerData != null) {
        return Customer.fromJson(customerData);
      } else {
        return null; // Customer not found
      }
    } else {
      throw Exception('Unexpected JSON structure');
    }
  } else {
    throw Exception('Failed to load customer data');
  }
}

class RdsPage extends StatefulWidget {
  final String branch;
  final String membershipId;

  const RdsPage({required this.branch, required this.membershipId});

  @override
  _RdsPageState createState() => _RdsPageState();
}

class _RdsPageState extends State<RdsPage> {
  late Future<Customer?> customer;

  final List<Color> avatarColors = [
    Colors.green.shade700,
    Colors.lightGreen.shade700,
    Colors.greenAccent.shade700,
    Colors.lime.shade700,
    Colors.green.shade800,
  ];


  final Random _random = Random();

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
  void initState() {
    super.initState();
    customer = fetchCustomerByMembershipId(widget.branch, widget.membershipId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:AppBar(
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
        // actions: [
        //   IconButton(
        //     onPressed:(){
        //       _openDatePicker(context);
        //     },
        //     icon: Icon(Icons.today_rounded, color: Colors.black, size: 20),
        //   ),
        // ],
      ),
      body: Center(
        child: FutureBuilder<Customer?>(
          future: customer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData && snapshot.data != null) {
              final customer = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      padding:  EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${customer.customerName}'.toUpperCase(),style: GoogleFonts.varela(color: white.withOpacity(0.8),fontSize: 15,fontWeight: FontWeight.w600),),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${customer.RDSNumber}'.toUpperCase(),
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
                                    '₹${customer.balanceAmount}' ,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${customer.membershipType}',style: GoogleFonts.montserrat(color: white.withOpacity(0.7),fontSize: 11),),
                              ),
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
                  customer.emiData.isEmpty
                      ? Text('No Emi data Available.')
                      : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: customer.emiData.length,
                      itemBuilder: ( context,  index) {
                        var emiItem = customer.emiData[index];

                        // Ensure that all relevant fields are converted to strings if needed
                        String emiUser = emiItem['User']?.toString() ?? 'No user';
                        String emiDate = emiItem['Date']?.toString() ?? 'No date';
                        String emiTime = emiItem['time']?.toString() ?? 'No date';
                        String emiAmount;
                        TextStyle amountStyle;

                        // Determine if the EMI item is a withdrawal or deposit and set the style accordingly
                        if (emiItem.containsKey('withdrawalAmount') && emiItem['withdrawalAmount'] != null) {
                          emiAmount = emiItem['withdrawalAmount']?.toString() ?? 'No amount';
                          amountStyle = GoogleFonts.montserrat(color: Colors.red,fontWeight: FontWeight.bold); // Set text color to green for withdrawal
                        } else {
                          emiAmount = emiItem['newAmount']?.toString() ?? 'No amount';
                          amountStyle = GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold); // Set default text color for deposits
                        }

                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 25),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => EmiDetailPage(emiItem: emiItem, customerName: '${customer.customerName}',)));
                          },
                          leading: CircleAvatar(
                            backgroundColor:
                            avatarColors[_random.nextInt(avatarColors.length)],
                            child: Text(
                              '$emiUser'[0].toUpperCase(), // Display the first letter of the name
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          trailing: Text(
                            '$emiAmount',
                            style: amountStyle,
                          ),
                          title: Text(
                            '$emiUser',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700),
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          subtitle: Text(
                            '$emiDate at $emiTime',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w700),
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return Text('Customer not found');
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RdsPage(branch: 'MLP', membershipId: 'MSCIMLP00604'),
  ));
}
// Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text('Customer Name: ${customer.customerName}', style: TextStyle(fontSize: 18)),
//       SizedBox(height: 8),
//       Text('Membership ID: ${customer.membershipId}', style: TextStyle(fontSize: 18)),
//       SizedBox(height: 8),
//       Text('Address: ${customer.address}', style: TextStyle(fontSize: 18)),
//       SizedBox(height: 8),
//       Text('Mobile: ${customer.customerMobile}', style: TextStyle(fontSize: 18)),
//       SizedBox(height: 8),
//       Text('Membership Type: ${customer.membershipType}', style: TextStyle(fontSize: 18)),
//       SizedBox(height: 16),
//       Text('EMI Data:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       SizedBox(height: 8),
//       customer.emiData.isEmpty
//           ? Text('No EMI data available.')
//           : Expanded(
//         child:ListView.builder(
//           shrinkWrap: true,
//           itemCount: customer.emiData.length,
//           itemBuilder: (context, index) {
//             var emiItem = customer.emiData[index];
//
//             // Ensure that all relevant fields are converted to strings if needed
//             String emiUser = emiItem['User']?.toString() ?? 'No user';
//             String emiDate = emiItem['Date']?.toString() ?? 'No date';
//             String emiTime = emiItem['time']?.toString() ?? 'No date';
//             String emiAmount;
//             TextStyle amountStyle;
//
//             // Determine if the EMI item is a withdrawal or deposit and set the style accordingly
//             if (emiItem.containsKey('withdrawalAmount') && emiItem['withdrawalAmount'] != null) {
//               emiAmount = emiItem['withdrawalAmount']?.toString() ?? 'No amount';
//               amountStyle = TextStyle(color: Colors.red); // Set text color to green for withdrawal
//             } else {
//               emiAmount = emiItem['newAmount']?.toString() ?? 'No amount';
//               amountStyle = TextStyle(color: Colors.black); // Set default text color for deposits
//             }
//
//             return ListTile(
//               title: Text('$emiUser'),
//               subtitle: Text('$emiDate at $emiTime' ),
//               trailing: Text('$emiAmount', style: amountStyle),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => EmiDetailPage(emiItem: emiItem),
//                   ),
//                 );
//               },
//             );
//           },
//         )
//         ,
//       ),
//     ],
//   ),
// );