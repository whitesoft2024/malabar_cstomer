import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'imagescreen.dart';

class SornaNidi extends StatefulWidget {
  @override
  _SornaNidiState createState() => _SornaNidiState();
}

class _SornaNidiState extends State<SornaNidi> {
  Future<List<dynamic>>? _auctionDetailsFuture;


  Future<List<dynamic>> fetchAuctionDetails() async {
    final response = await http.get(Uri.parse('https://api.malabarbank.in/api/getswarna'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final schemes = data['schemes'] as List;
      List<dynamic> auctionDetails = [];

      for (var scheme in schemes) {
        if (scheme['auctionDetails'].isNotEmpty) {
          auctionDetails.add(scheme['auctionDetails']);
        }
      }
      return auctionDetails;

    } else {
      throw Exception('Failed to load auction details');
    }
  }


  @override
  void initState() {
    super.initState();
    _auctionDetailsFuture = fetchAuctionDetails();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: FutureBuilder<List<dynamic>>(
        future: _auctionDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<dynamic> auctionDetails = snapshot.data!;
            dynamic winnerName = '';

            if (auctionDetails.isNotEmpty) {
              dynamic firstPrice = auctionDetails[0];
              if (firstPrice is List<dynamic>) {
                if (firstPrice.isNotEmpty) {
                  winnerName = firstPrice[0]['customerName'];
                }
              }
            }

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Screen1()),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/goldloan.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Watch on Live in Youtube ",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 6.0),
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _launchURL,
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.red.shade800,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: Text(
                                    'Watch on YouTube',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Winners :",
                            style: GoogleFonts.montserrat(fontWeight: FontWeight.w900),
                          ),
                        ),
                        _buildPrizeContainer(context, '1st prize winners!', Icons.star, isConfettiContainer: true),
                        _buildTileContainer(context, 'Family Dinner Set', Icons.dinner_dining),
                        _buildTileContainer(context, '3rd prize winners!', Icons.star_half),
                      ],
                    ),
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: _showBlur,
                  builder: (context, showBlur, child) {
                    return showBlur
                        ? BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    )
                        : SizedBox.shrink();
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    numberOfParticles: 30,
                    gravity: 0.1,
                    emissionFrequency: 0.02,
                    shouldLoop: false,
                    colors: const [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.yellow,
                      Colors.purple
                    ],
                    createParticlePath: drawStar,
                  ),
                ),
                ValueListenableBuilder<String>(
                  valueListenable: _winnerName,
                  builder: (context, winnerName, child) {
                    return winnerName.isNotEmpty
                        ? Center(
                      child: Text(
                        winnerName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    )
                        : SizedBox.shrink();
                  },
                ),
              ],
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _buildTileContainer(BuildContext context, String text, IconData icon) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: (){
          _launchURL();
        },
        child: ExpansionTile(
          minTileHeight: 70,
          leading: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          title: Text(
            text,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 4.0,
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.grey.shade500,
          collapsedBackgroundColor: Colors.grey.shade500,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          expandedAlignment: Alignment.centerLeft,
          children: [
            Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('View Winners in Youtube', style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 11)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrizeContainer(BuildContext context, String text, IconData icon, {bool isConfettiContainer = false}) {
    // Check if auctionDetails has the necessary data
    // For example, if `isConfettiContainer` should show actual prize data

    return InkWell(
      // onTap: () {
      //   if (isConfettiContainer) {
      //     _showConfettiAndName(context, '$_winnerName'); // Show confetti and winner name
      //   }
      // },
      onTap: (){
        if (isConfettiContainer) {
          _showConfettiAndLaunchURL();
        }
      },
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            SizedBox(width: 20),
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black.withOpacity(0.6),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void _showConfettiAndName(BuildContext context, String name) {
    _winnerName.value = name;
    _showBlur.value = true;
    _confettiController.play();
    Future.delayed(Duration(seconds: 3), () {
      _showBlur.value = false;
      _winnerName.value = '';
    });
  }

  void _showConfettiAndLaunchURL() {
    _confettiController.play();
    Future.delayed(Duration(seconds: 1), () {
      _launchURL();
    });
  }

  void _launchURL() async {
    const url = 'https://www.youtube.com/@swarnanidhitoday';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }


  Path drawStar(Size size) {
    final Path path = Path();
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const int numberOfPoints = 5;
    const double radius = 10.0;

    for (int i = 0; i < numberOfPoints; i++) {
      double x = centerX + radius * cos((pi / 180) * (360 / numberOfPoints * i));
      double y = centerY + radius * sin((pi / 180) * (360 / numberOfPoints * i));
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }


  final ValueNotifier<String> _winnerName = ValueNotifier<String>('');
  final ValueNotifier<bool> _showBlur = ValueNotifier<bool>(false);
  final ConfettiController _confettiController = ConfettiController(duration: const Duration(seconds: 5));
}
