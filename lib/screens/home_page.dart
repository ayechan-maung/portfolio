import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/txt_sty.dart';
import 'package:portfolio/views/about.dart';
import 'package:portfolio/views/experience_file/experience.dart';
import 'package:portfolio/views/skill/skills.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  final _curve = Curves.easeInOut;
  bool isOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      // appBar: AppBar(
      //   title: Text('Acm\'s Portfolio'),
      //   centerTitle: true,
      //   elevation: 0.0,
      //   // bottom: TabBar(tabs: tabs),
      // ),
      body: AnimateIfVisibleWrapper(
        showItemInterval: Duration(milliseconds: 150),
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            AnimateIfVisible(
              key: Key('item.0'),
              duration: Duration(milliseconds: 900),
              builder: (BuildContext context, Animation<double> animation) =>
                  FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                  child: Text(
                    'Acm\'s Portfolio',
                    style: nameSty,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            AnimateIfVisible(
              key: Key('item.1'),
              duration: Duration(milliseconds: 900),
              // delay: Duration(milliseconds: 200),
              builder: (BuildContext context, Animation<double> animation) =>
                  FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: item(context,
                    icon: FontAwesomeIcons.user, title: 'About', onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => About()));
                }),
              ),
            ),
            AnimateIfVisible(
              key: Key('item.2'),
              duration: Duration(milliseconds: 900),
              // delay: Duration(milliseconds: 200),
              builder: (BuildContext context, Animation<double> animation) =>
                  FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: item(context,
                    icon: FontAwesomeIcons.briefcase,
                    title: 'Experience', onPressed: () {
                  Get.to(() => Experience());
                }),
              ),
            ),
            AnimateIfVisible(
              key: Key('item.3'),
              duration: Duration(milliseconds: 900),
              // delay: Duration(milliseconds: 200),
              builder: (BuildContext context, Animation<double> animation) =>
                  FadeTransition(
                opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                child: item(context,
                    icon: FontAwesomeIcons.laptopCode,
                    title: 'Edu & Skills', onPressed: () {
                  Get.to(() => Skills());
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(BuildContext context,
      {String title, IconData icon, VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Dimension.fullHeight(context) * 0.22,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Container(
              width: Dimension.fullWidth(context) * 0.3,
              padding: EdgeInsets.all(18.0),
              child: FaIcon(
                icon,
                size: Dimension.fullWidth(context) * 0.23,
              ),
            ),
            Dimension.spaceWidth(14.0),
            Container(
              width: Dimension.fullWidth(context) * 0.5,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
