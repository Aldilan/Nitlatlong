import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nitlatlong/pages/HomePage.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({super.key});
  static const routeName = '/howToUse';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Latitude Point",
          body:
              'Latitude is for Y axis, smallest data is used for minimum latitude data and vice versa',
          image: Center(
            child: Icon(
              FontAwesomeIcons.mapPin,
              size: MediaQuery.of(context).size.width * 0.4,
              color: Color.fromARGB(255, 151, 210, 236),
            ),
          ),
        ),
        PageViewModel(
          title: "Longitude Point",
          body:
              'Longitude is for X axis, smallest data is used for minimum lrongitude data and vice versa',
          image: Center(
            child: Icon(
              FontAwesomeIcons.mapPin,
              size: MediaQuery.of(context).size.width * 0.4,
              color: Color.fromARGB(255, 151, 210, 236),
            ),
          ),
        ),
        PageViewModel(
          title: "Address",
          body:
              'The displayed address is obtained from the existing latitude and longitude points and if you can press the button if you want to update the displayed address',
          image: Center(
            child: Icon(
              FontAwesomeIcons.mapLocationDot,
              size: MediaQuery.of(context).size.width * 0.4,
              color: Color.fromARGB(255, 151, 210, 236),
            ),
          ),
        ),
      ],
      onDone: () {
        Get.back();
      },
      onSkip: () {
        Get.back();
      },
      showBackButton: false,
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Color.fromARGB(255, 151, 210, 236),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
