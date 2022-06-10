import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/splash_screen.dart';

class PrePage extends StatefulWidget {
  @override
  _PrePageState createState() => _PrePageState();
}

class _PrePageState extends State<PrePage> {
  String oneSignalId = '5b76e2c9-2950-4f89-ae17-34733cb0c2b7';

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

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
            bodyText1: TextStyle(color: Colors.blue[800], fontSize: 16),
            bodyText2: TextStyle(color: Colors.blue[800], fontSize: 16),
          ),
          iconTheme: IconThemeData(color: Colors.blue[800]),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.blue[900]),
              backgroundColor: Color(0xFFECEFF1),
              titleTextStyle: TextStyle(color: Colors.blue[800]),
              titleSpacing: 1.1)),
      home: DefaultTextStyle(style: TextStyle(color: Colors.blue[800], fontSize: 16), child: SplashScreen()),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
