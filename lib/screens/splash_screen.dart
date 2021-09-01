import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/consts/app_consts.dart';
import 'package:portfolio/consts/notification.dart';
import 'package:portfolio/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // OneSignalSet().initNotification(context);
    // OneSignalUtils().initOneSignal(context);
    Future.delayed(Duration(milliseconds: 1500))
        .then((value) => Get.offAll(() => HomePage()));

    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0BEC5),
      body: Center(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(14.0),
        child: Image.asset(
          "assets/images/port.jpeg",
          height: 150,
          width: 150,
        ),
      )),
    );
  }
}
