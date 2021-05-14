import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/launch_url.dart';
import 'package:portfolio/consts/txt_sty.dart';
import 'package:portfolio/views/my_location.dart';

class About extends StatelessWidget {
  List<String> spanList = ['self-taught', 'passionate', 'committed'];
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
              minRadius: 40,
              backgroundImage: AssetImage('assets/images/tommy.jpeg'),
            ),
            Dimension.spaceWidth(12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Mr. Aye Chan Maung',
                    style: nameSty,
                  ),
                ),
                Container(
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: 'A',
                        ),
                        TextSpan(
                          text: ' self-taught ',
                          // children:
                          //     spanList.map((e) => TextSpan(text: e)).toList(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(text: 'mobile developer'),
                      ],
                    ),
                  ),
                )
              ],
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
                    onTap: () =>
                        LaunchUrl.launchUrl('mailto: ngaayechan@gmail.com'),
                    child: Text('ngaayechan@gmail.com')),
                InkWell(
                    onTap: () => LaunchUrl.launchUrl('tel:+959967230114'),
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
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(text: 'I\'m a '),
                TextSpan(
                    text: 'self-taught ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                TextSpan(
                    text:
                        'mobile application developer. I learned hybird cross-platform'),
                TextSpan(
                    text: ' Flutter ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500)),
                TextSpan(
                    text:
                        'last 2 years ago. Now I have one year experience from Tech company based from Cambodia.')
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(text: 'I learned '),
                TextSpan(
                    text: 'State Management, Lifecycle method',
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
