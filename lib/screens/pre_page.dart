import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/splash_screen.dart';

class PrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
          fontFamily: 'Open Sans',
          primaryColor: Color(0xFFB0BEC5),
          accentColor: Color(0xFF455A64),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.blue[800]),
            bodyText2: TextStyle(color: Colors.blue[800]),
          ),
          iconTheme: IconThemeData(color: Colors.blue[800]),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(color: Colors.white70),
              titleSpacing: 1.1)),
      home: SplashScreen(),
    );
  }
}
