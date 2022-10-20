import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:nitlatlong/methods/locationService.dart';
import 'package:nitlatlong/pages/HowToUse.dart';
import 'package:nitlatlong/widgets/hyperlink.dart';
import 'package:nitlatlong/widgets/loadingWidgets.dart';
import 'package:nitlatlong/widgets/locationDisplay.dart';
import 'package:animated_drawer/bloc/generic_bloc.dart';
import 'package:animated_drawer/bloc/home_page_bloc.dart';
import 'package:animated_drawer/bloc/shadow_bloc.dart';
import 'package:animated_drawer/constants/constants.dart';
import 'package:animated_drawer/constants/runtime_variables.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:animated_drawer/views/first_layer.dart';
import 'package:animated_drawer/views/home_page.dart';
import 'package:animated_drawer/views/shadow.dart';
import 'package:animated_drawer/views/third_layer.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = '/homePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocationService locationService = LocationService();
  double latitude = 0;
  double longitude = 0;
  double latitudeOld = 0;
  double longitudeOld = 0;
  bool _isFindLoc = false;
  bool _isLocFinded = false;
  bool _isFinded = false;
  String? addressNow;

  void initState() {
    locationService.locationStream.listen((userLocation) {
      setState(() {
        latitude = userLocation.latitude;
        longitude = userLocation.longitude;
      });
    });
    super.initState();
  }

  void dispose() {
    locationService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedDrawer(
        homePageXValue: 150,
        homePageYValue: 80,
        homePageAngle: -0.2,
        homePageSpeed: 250,
        shadowXValue: 122,
        shadowYValue: 110,
        shadowAngle: -0.275,
        shadowSpeed: 550,
        openIcon: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.width * 0.02),
            child: Icon(
              FontAwesomeIcons.bars,
              color: Colors.white,
              size: 35,
            )),
        closeIcon: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                top: MediaQuery.of(context).size.width * 0.02),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 35,
            )),
        shadowColor: Color.fromARGB(255, 198, 191, 134),
        backgroundGradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 198, 191, 134),
            Color.fromARGB(255, 255, 246, 173)
          ],
        ),
        menuPageContent: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  FontAwesomeIcons.earthAsia,
                  color: Color.fromARGB(255, 198, 191, 134),
                  size: MediaQuery.of(context).size.width / 4.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  children: [
                    Text(
                      "NIT",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "LATLONG",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                ),
                hyperlinkSocialMedia(
                  icon: 'images/github.png',
                  title: 'GitHub',
                  url: 'https://github.com/Aldilan',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                hyperlinkSocialMedia(
                  icon: 'images/github.png',
                  title: 'Linkedin',
                  url:
                      'https://www.linkedin.com/in/aldilan-hermawan-780393205/',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                hyperlinkSocialMedia(
                  icon: 'images/github.png',
                  title: 'Gmail',
                  url:
                      'https://www.linkedin.com/in/aldilan-hermawan-780393205/',
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Divider(
                  color: Colors.blue[800],
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(HowToUse.routeName);
                  },
                  child: Text(
                    'How to use',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationThickness: 3,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        homePageContent: Stack(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.245,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 1,
                                  ),
                                ]),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 50),
                            child: Column(
                              children: [
                                LocationDisplay(
                                  title: 'Latitude',
                                  content: latitude.toString(),
                                ),
                                LocationDisplay(
                                  title: 'Longitude',
                                  content: longitude.toString(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 1,
                                  ),
                                ]),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 50),
                            child: Column(
                              children: _isLocFinded == false
                                  ? [
                                      Tooltip(
                                        message: 'Click to find',
                                        child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.black26)),
                                            child: _isFindLoc != false ||
                                                    latitude.toString() ==
                                                        '0.0' ||
                                                    longitude.toString() ==
                                                        '0,9'
                                                ? FittedBox(
                                                    child: LoadingPage(),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      findLoc();
                                                    },
                                                    child: FittedBox(
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .locationCrosshairs,
                                                        size: 50,
                                                        color: Colors.blue[800],
                                                      ),
                                                    ),
                                                  )),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                      Text(
                                        'Find location from latitude and longitude',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]
                                  : _isFindLoc == false
                                      ? [
                                          LocationDisplay(
                                            title: 'Location',
                                            content: addressNow,
                                          ),
                                          latitudeOld != latitude ||
                                                  longitudeOld != longitude
                                              ? Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextButton(
                                                        onPressed: () {
                                                          findLoc();
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              FontAwesomeIcons
                                                                  .rotate,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      151,
                                                                      210,
                                                                      236),
                                                              size: 15,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Update location',
                                                              style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        151,
                                                                        210,
                                                                        236),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                )
                                              : SizedBox()
                                        ]
                                      : [LoadingPage()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                ClipPath(
                  //upper clippath with less height
                  clipper: ClipPathBottomClass(), //set our custom wave clipper.
                  child: Container(
                    padding: EdgeInsets.only(bottom: 50),
                    color: Color.fromARGB(255, 151, 210, 236),
                    height: MediaQuery.of(context).size.height * 0.155,
                    alignment: Alignment.center,
                  ),
                ),
                ClipPath(
                  //upper clippath with less height
                  clipper: ClipPathClass(), //set our custom wave clipper.
                  child: Container(
                    padding: EdgeInsets.only(bottom: 50),
                    color: Colors.blue[800],
                    height: MediaQuery.of(context).size.height * 0.15,
                    alignment: Alignment.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> findLoc() async {
    setState(() {
      _isFindLoc = true;
    });
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    setState(() {
      latitudeOld = latitude;
      longitudeOld = longitude;
      addressNow = placemarks[0].toString();
      _isFinded = true;
      _isFindLoc = false;
      _isLocFinded = true;
    });
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.7);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ClipPathBottomClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
