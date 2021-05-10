import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/txt_sty.dart';
import 'package:portfolio/views/my_location.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [_profile(context), _personal(context), _aboutTxt(context)],
      ),
    );
  }

  Widget _profile(BuildContext context) {
    return Container(
        // height: 120,
        margin: EdgeInsets.only(bottom: 12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            CircleAvatar(
              minRadius: 50,
              backgroundImage: AssetImage('assets/images/tommy.jpeg'),
            ),
            Dimension.spaceWidth(12.0),
            Container(
              child: Text(
                'Mr. Aye Chan Maung',
                style: nameSty,
              ),
            )
          ],
        ));
  }

  Widget _personal(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      height: Dimension.fullHeight(context) * 0.2,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.mail),
                Icon(Icons.contact_phone),
                Icon(Icons.cake),
                Icon(Icons.home)
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () => _launchUrl('mailto: ngaayechan@gmail.com'),
                    child: Text('ngaayechan@gmail.com')),
                InkWell(
                    onTap: () => _launchUrl('tel:+959967230114'),
                    child: Text('+959967230114')),
                Text('6/11/1993'),
                InkWell(
                    onTap: () => Get.to(() => MyLocation()),
                    child: Text('Myanmar')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _aboutTxt(BuildContext context) {
    return Container(
      height: Dimension.fullHeight(context) * 0.5,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Text(
        '      I\'m a self-taught mobile application developer. I learned hybird cross-platform Flutter last 2 years ago. Now I have one year experience from Tech company based from Cambodia.',
        textAlign: TextAlign.justify,
      ),
    );
  }

  void _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Can not launch $url";
    }
  }
}
