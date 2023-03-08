// ignore_for_file: avoid_unnecessary_containers

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nft_site/constants.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    responsive = MediaQuery.of(context).size.height / 3 - 35;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isHover = false;
    return MaterialApp(
      title: "NFT - Community site",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: responsive! * 0.8053,
                      child: Row(
                        children: [
                          TraingleShape(
                            image: images[1],
                            isReverse: true,
                          ),
                          TraingleShape(
                            image: images[2],
                            isReverse: true,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        TraingleShape(
                          image: images[3],
                        ),
                        TraingleShape(
                          image: images[4],
                        ),
                        TraingleShape(
                          image: images[5],
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      left: responsive! * 0.8053,
                      child: Row(
                        children: [
                          TraingleShape(
                            image: images[6],
                            isReverse: false,
                          ),
                          TraingleShape(
                            image: images[8],
                            isReverse: false,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      // left: responsive! * 0.1053,
                      child: Row(
                        children: [
                          Container(
                            width: responsive! * 1.63,
                          ),
                          TraingleShape(
                            image: images[10],
                            isReverse: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      left: responsive! * 1.63,
                      child: Row(
                        children: [
                          TraingleShape(
                            image: images[9],
                            isReverse: false,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: responsive! * 2.43,
                        ),
                        TraingleShape(
                          image: images[0],
                          isReverse: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 24,
              top: 240,
              child: Text(
                subText,
                style: GoogleFonts.montserrat(
                  letterSpacing: screenWidth > 680 ? 9 : 1,
                  fontSize: screenWidth > 680 ? 16 : 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: -20,
              top: screenWidth > 680 ? 200 : 210,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  heading,
                  style: GoogleFonts.orbitron(
                    fontSize: screenWidth > 680 ? 320 : 180,
                    color: Colors.white,
                    letterSpacing: screenWidth > 680 ? -25 : -10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 50,
              child: Container(
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "02/11/22",
                        style: GoogleFonts.poppins(
                          letterSpacing: 5,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          contextHead,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          contextText,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: screenWidth > 680 ? 50 : 10,
              child: SizedBox(
                width: 380,
                child: Row(
                  mainAxisAlignment: screenWidth > 680
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    NavItem(text: navItems[0]),
                    const SizedBox(width: 20),
                    NavItem(text: navItems[1]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  const NavItem({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (_) {
        onEntered(true);
      },
      onExit: (_) {
        onEntered(false);
      },
      child: Text(
        widget.text,
        style: GoogleFonts.montserrat(
          letterSpacing: screenWidth > 680 ? 9 : 2,
          fontSize: 14,
          fontWeight: isHovering ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      isHovering = isHovered;
    });
  }
}

class TraingleShape extends StatefulWidget {
  const TraingleShape({super.key, this.image, this.isReverse = false});
  final String? image;
  final bool isReverse;

  @override
  State<TraingleShape> createState() => _TraingleShapeState();
}

class _TraingleShapeState extends State<TraingleShape> {
  @override
  Widget build(BuildContext context) {
    responsive = MediaQuery.of(context).size.height / 3 - 35;
    return Padding(
      padding: EdgeInsets.only(
        left: responsive! * 0.1174,
        right: responsive! * 0.1174,
        bottom: responsive! * 0.1174,
      ),
      child: RotatedBox(
        quarterTurns: widget.isReverse ? 2 : 0,
        child: ClipPath(
          clipper: CustomTriangleClipper(),
          child: RotatedBox(
            quarterTurns: widget.isReverse ? 2 : 0,
            child: Container(
              height: responsive,
              width: responsive! * 1.4,
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                  image: NetworkImage(
                    widget.image!,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height / 1.1);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
