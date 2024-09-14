import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import 'RDS/Qr_Page.dart';


class CustomerDetail {
  final String customerName;
  final String customerNumber;
  final String membershipId;
  final String schemeId;
  final String branchCode;

  CustomerDetail({
    required this.customerName,
    required this.customerNumber,
    required this.membershipId,
    required this.schemeId,
    required this.branchCode,
  });

  factory CustomerDetail.fromJson(Map<String, dynamic> json) {
    return CustomerDetail(
      customerName: json['customerName'] ?? '',
      customerNumber: json['customerNumber'] ?? '',
      membershipId: json['membershipId'] ?? '',
      schemeId: json['schemeId'] ?? '',
      branchCode: json['branchCode'] ?? '',
    );
  }
}

class AuctionDetails {
  final List<AuctionMember> firstPrice;
  final List<AuctionMember> secondPrice;
  final List<AuctionMember> thirdPrice;

  AuctionDetails({
    required this.firstPrice,
    required this.secondPrice,
    required this.thirdPrice,
  });

  factory AuctionDetails.fromJson(Map<String, dynamic> json) {
    return AuctionDetails(
      firstPrice: (json['firstPrice'] as List)
          .map((item) => AuctionMember.fromJson(item))
          .toList(),
      secondPrice: (json['secondPrice'] as List)
          .map((item) => AuctionMember.fromJson(item))
          .toList(),
      thirdPrice: (json['thirdPrice'] as List)
          .map((item) => AuctionMember.fromJson(item))
          .toList(),
    );
  }
}

class AuctionMember {
  final String customerName;
  final String customerNumber;
  final String membershipId;
  final String schemeId;

  AuctionMember({
    required this.customerName,
    required this.customerNumber,
    required this.membershipId,
    required this.schemeId,
  });

  factory AuctionMember.fromJson(Map<String, dynamic> json) {
    return AuctionMember(
      customerName: json['customerName'] ?? '',
      customerNumber: json['customerNumber'] ?? '',
      membershipId: json['membershipId'] ?? '',
      schemeId: json['schemeId'] ?? '',
    );
  }
}

Future<Map<String, dynamic>> fetchMembersAndAuctionDetails(
    String branch, String membershipId) async {
  final response = await http.get(
    Uri.parse(
        'https://api.malabarbank.in/api/getswarna?branch=$branch&membershipId=$membershipId'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final schemes = jsonData['schemes'] as List;

    List<CustomerDetail> allMembers = [];
    AuctionDetails? auctionDetails;

    for (var scheme in schemes) {
      // Fetch auction details (assume first auctionDetails entry if available)
      if (scheme['auctionDetails'] != null &&
          scheme['auctionDetails'].isNotEmpty) {
        auctionDetails = AuctionDetails.fromJson(scheme['auctionDetails'][0]);
      }

      // Fetch members details
      final members = (scheme['members'] as List)
          .map((member) => CustomerDetail.fromJson(member))
          .toList();

      allMembers.addAll(members);
    }

    return {
      'members': allMembers,
      'auctionDetails': auctionDetails,
    };
  } else {
    throw Exception('Failed to load members and auction details');
  }
}

class SornaNidi extends StatefulWidget {
  final String branch;
  final String membershipId;

  const SornaNidi(
      {required this.branch, required this.membershipId});

  @override
  _SornaNidiState createState() => _SornaNidiState();
}

class _SornaNidiState extends State<SornaNidi> {
  late Future<Map<String, dynamic>> membersAndAuctionDetails;

  @override
  void initState() {
    super.initState();
    membersAndAuctionDetails =
        fetchMembersAndAuctionDetails(widget.branch, widget.membershipId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: membersAndAuctionDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No auction details available'));
          } else {
            final List<CustomerDetail> members = snapshot.data!['members'];
            final AuctionDetails auctionDetails =
            snapshot.data!['auctionDetails'];

            try {
              final specificMember = members.firstWhere(
                    (member) => member.membershipId == widget.membershipId,
                orElse: () =>
                throw StateError('No member found with this membershipId.'),
              );

              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  backgroundColor: white,
                  leading: IconButton(
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
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
                    "SornaNidi",
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Icon(Icons.qr_code_2_sharp),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QRDetailsPage(
                              customerName: specificMember.customerName,
                              Data: specificMember.schemeId, // Pass schemeId as QR data
                              appBarTitle: 'My SornaNidi QR Code',
                              DataText: 'Scheme ID: ${specificMember.schemeId}',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   'Member Details:',
                            //   style: TextStyle(
                            //       fontSize: 20, fontWeight: FontWeight.bold),
                            // ),
                            // SizedBox(height: 10),
                            // Text('Name: ${specificMember.customerName}'),
                            // Text('Number: ${specificMember.customerNumber}'),
                            // Text(
                            //     'Membership ID: ${specificMember.membershipId}'),
                            // Text('Scheme ID: ${specificMember.schemeId}'),
                            // Text('Branch Code: ${specificMember.branchCode}'),
                            // // You can add more fields here based on the data you have
                            // SizedBox(height: 20),
                            InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => Screen1()),
                              //   );
                              // },
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height * 0.3,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/goldloan.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
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
                                          borderRadius:
                                          BorderRadius.circular(10),
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
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            auctionDetails != null
                                ? Column(
                              children: [
                                _buildPrizeContainer(
                                    context,
                                    "1st Prize Winners",
                                    Icons.military_tech,
                                    auctionDetails.firstPrice,
                                    true),
                                _buildTileContainer(
                                    context,
                                    "2nd Prize Winners",
                                    Icons.emoji_events,
                                    auctionDetails.secondPrice,
                                    isConfetti: true),
                                _buildTileContainer(
                                    context,
                                    "3rd Prize Winners",
                                    Icons.star,
                                    auctionDetails.thirdPrice,
                                    isConfetti: true),
                              ],
                            )
                                : Container(
                              child:
                              Text("No auction details available."),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13.0, vertical: 10),
                                    child: Text(
                                      'All Members :',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Container(
                                    height: 400,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: members.length,
                                      itemBuilder: (context, index) {
                                        final member = members[index];
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.black38,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                                backgroundColor: white,
                                                child: Text(
                                                  '${index + 1}',
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 11,
                                                      color: black,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                )),
                                            title: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${member.customerName}',
                                                  style: GoogleFonts.montserrat(
                                                      color: white,
                                                      fontSize: 13,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                                Text(
                                                  'Branch Code: ${member.branchCode}',
                                                  style: GoogleFonts.montserrat(
                                                      color: white,
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topLeft,
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
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
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
                            Colors.black,
                            Colors.white,
                            Colors.green,
                            Colors.yellow,
                            Colors.purple
                          ],
                          createParticlePath: drawStar,
                        ),
                      ),
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: _winnerName,
                      builder: (context, winnerName, child) {
                        return winnerName.isNotEmpty
                            ? Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              winnerName,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4.0,
                                    color: Colors.black.withOpacity(0.6),
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                            : SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              );
            } catch (e) {
              return Center(child: Text(e.toString()));
            }
          }
        },
      ),
    );
  }

  Widget _buildTileContainer(BuildContext context, String title, IconData icon,
      List<AuctionMember> winners,
      {bool isConfetti = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {
          if (isConfetti) {
            _showConfettiAndName(
                context, winners.map((w) => w.customerName).join(', '));
          }
        },
        child: ExpansionTile(
          minTileHeight: 70,
          leading: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          title: Text(
            title,
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
          collapsedBackgroundColor: Colors.black26,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          expandedAlignment: Alignment.centerLeft,
          children: winners.isNotEmpty
              ? winners
              .map((winner) => ListTile(
            title: Text(
              winner.customerName,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            //subtitle: Text('Membership ID: ${winner.membershipId}'),
          ))
              .toList()
              : [
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                'No winners Available !',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPrizeContainer(BuildContext context, String title, IconData icon,
      List<AuctionMember> winners, bool isConfettiContainer) {
    return InkWell(
      onTap: () {
        if (isConfettiContainer) {
          _showConfettiAndName(
              context, winners.map((w) => w.customerName).join(', '));
        }
      },
      child: Container(
        height: 70,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 25),
            SizedBox(width: 20),
            Text(
              title,
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
    Future.delayed(Duration(seconds: 5), () {
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
      double x =
          centerX + radius * cos((pi / 180) * (360 / numberOfPoints * i));
      double y =
          centerY + radius * sin((pi / 180) * (360 / numberOfPoints * i));
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
  final ConfettiController _confettiController =
  ConfettiController(duration: const Duration(seconds: 3));
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SornaNidi(
      branch: 'MRC',
      membershipId: 'MSCSIKLD00508',
    ),
  ));
}

// return Card(
//   margin: EdgeInsets.all(8.0),
//   child: Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('First Price:', style: TextStyle(fontWeight: FontWeight.bold)),
//         ...auctionDetail.firstPrice.map((detail) => Text(detail.customerNumber)).toList(),
//         SizedBox(height: 8),
//         Text('Second Price:', style: TextStyle(fontWeight: FontWeight.bold)),
//         ...auctionDetail.secondPrice.map((detail) => Text(detail.customerName)).toList(),
//         SizedBox(height: 8),
//         Text('Third Price:', style: TextStyle(fontWeight: FontWeight.bold)),
//         ...auctionDetail.thirdPrice.map((detail) => Text(detail.customerName)).toList(),
//       ],
//     ),
//   ),
// );
