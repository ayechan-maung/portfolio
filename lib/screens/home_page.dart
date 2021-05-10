import 'package:flutter/material.dart';
import 'package:portfolio/views/about.dart';
import 'package:portfolio/views/education.dart';
import 'package:portfolio/views/experience.dart';
import 'package:portfolio/views/skills.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> tabs = [
    Tab(
      text: 'About',
    ),
    Tab(
      text: 'Education',
    ),
    Tab(
      text: 'Experience',
    ),
    Tab(
      text: 'Skills',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xFFECEFF1),
        appBar: AppBar(
          title: Text('Portfolio'),
          centerTitle: true,
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
            children: [About(), Education(), Experience(), Skills()]),
      ),
    );
  }
}
