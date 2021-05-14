import 'package:flutter/material.dart';
import 'package:portfolio/views/about.dart';
import 'package:portfolio/views/experience_file/experience.dart';
import 'package:portfolio/views/skill/skills.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> tabs = [
    Tab(
      text: 'About Me',
    ),
    Tab(
      text: 'Experience',
    ),
    Tab(
      text: 'Edu & Skills',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFECEFF1),
        appBar: AppBar(
          title: Text('Acm\'s Portfolio'),
          centerTitle: true,
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(children: [About(), Experience(), Skills()]),
      ),
    );
  }
}
