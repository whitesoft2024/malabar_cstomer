import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants.dart';

class QRDetailsPage extends StatelessWidget {
  final String customerName;
  final String Data;
  final String appBarTitle; // Customizable app bar title
  final String? DataText; // Optional additional text below the QR code

  const QRDetailsPage({
    required this.customerName,
    required this.Data,
    required this.appBarTitle , // Default value for app bar title
     this.DataText, // Additional text parameter
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // Standard height of AppBar
        child: Container(
          decoration: BoxDecoration(
            color: kBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Shadow color
                spreadRadius: 4, // How much the shadow spreads
                blurRadius: 6, // Blurring of the shadow
                offset: Offset(0, 0), // Position of the shadow (X, Y)
              ),
            ],
          ),
          child: AppBar(
            elevation: 0, // Disable default elevation
            backgroundColor: Colors.transparent, // Make AppBar transparent to see the container's color
            leading: IconButton(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.red,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close_sharp,
                color: Colors.black,
                size: 18,
              ),
            ),
            title: Text(
              appBarTitle, // Dynamic app bar title
              style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                customerName,
                style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                DataText!,
                style: GoogleFonts.montserrat(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              QrImageView(
                data: Data,
                version: QrVersions.min,
                size: 180.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
