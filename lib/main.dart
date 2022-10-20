import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitlatlong/pages/HomePage.dart';
import 'package:nitlatlong/pages/HowToUse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(fontFamily: 'Nunito'),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        HowToUse.routeName: (context) => const HowToUse(),
      },
    );
  }
}
