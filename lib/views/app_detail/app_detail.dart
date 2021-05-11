import 'package:flutter/material.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/txt_sty.dart';

class AppDetail extends StatefulWidget {
  int color;
  String path;
  String title;
  String about;
  String androidUrl;
  String iosUrl;
  AppDetail(
      {this.color,
      this.path,
      this.title,
      this.about,
      this.androidUrl,
      this.iosUrl});
  @override
  _AppDetailState createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [heading(context), aboutText(context)],
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
            height: Dimension.fullHeight(context) * 0.13,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  widget.path,
                )),
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

  Widget aboutText(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      height: Dimension.fullHeight(context) * 0.45,
      child: Column(
        children: [
          Text(
            widget.about,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
