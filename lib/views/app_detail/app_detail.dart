import 'package:flutter/material.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/txt_sty.dart';

class AppDetail extends StatefulWidget {
  var color;
  String path;
  String title;
  AppDetail({this.color, this.path, this.title});
  @override
  _AppDetailState createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            heading(context),
          ],
        ),
      ),
    );
  }

  Widget heading(BuildContext context) {
    return Container(
      height: Dimension.fullHeight(context) * 0.22,
      decoration: BoxDecoration(color: Color(widget.color)),
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            height: Dimension.fullHeight(context) * 0.18,
            child: Image.asset(widget.path),
          ),
          Dimension.spaceWidth(12.0),
          Container(
            child: Text(
              widget.title,
              style: appTitle,
            ),
          )
        ],
      ),
    );
  }
}
