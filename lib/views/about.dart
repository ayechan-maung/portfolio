import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:get/get.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/launch_url.dart';
import 'package:portfolio/consts/txt_sty.dart';
import 'package:portfolio/views/my_location.dart';
import 'dart:async';

class About extends StatelessWidget {
  StreamController<String> controllerUrl = StreamController<String>();

  void generateLink(BranchUniversalObject buo, BranchLinkProperties lp) async {
    BranchResponse response =
        await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);
    if (response.success) {
      print(response.result);
      controllerUrl.sink.add('${response.result}');
    } else {
      controllerUrl.sink
          .add('Error : ${response.errorCode} - ${response.errorMessage}');
    }
  }

  List<String> spanList = ['self-taught', 'passionate', 'committed'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'About',
          style: TextStyle(color: Colors.blue[900]),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print('is work?');
                BranchLinkProperties lp = BranchLinkProperties(
                    channel: 'facebook',
                    feature: 'sharing',
                    //alias: 'flutterplugin' //define link url,
                    alias: 'spo-4',
                    stage: 'new share',
                    campaign: 'xxxxx',
                    tags: ['one', 'two', 'three']);
                lp.addControlParam('\$uri_redirect_mode', '1');

                return generateLink(
                    BranchUniversalObject(
                        canonicalIdentifier: 'flutter/branch',
                        //canonicalUrl: '',
                        title: 'Flutter Branch Plugin',
                        imageUrl:
                            'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
                        contentDescription: 'Flutter Branch Description',
                        contentMetadata: BranchContentMetaData()
                          ..addCustomMetadata('number', '4')
                          ..addCustomMetadata('order_number', 'SPO-4'),
                        keywords: ['Plugin', 'Branch', 'Flutter'],
                        publiclyIndex: true,
                        locallyIndex: true,
                        expirationDateInMilliSec: DateTime.now()
                            .add(Duration(days: 365))
                            .millisecondsSinceEpoch),
                    lp);
              },
              icon: Icon(Icons.ten_k))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [_profile(context), _personal(context), _aboutTxt(context)],
        ),
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
              backgroundImage: AssetImage('assets/images/flutter_favorite.png'),
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
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          width: 15,
                          child: Text('A '),
                          // color: Colors.blue.withOpacity(0.2),
                        ),
                        Container(
                          width: Dimension.fullWidth(context) * 0.18,
                          child: AnimatedTextKit(
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText('self-taught',
                                  textStyle: roSty),
                              RotateAnimatedText('passionate',
                                  textStyle: roSty),
                              RotateAnimatedText('committed', textStyle: roSty),
                            ],
                          ),
                        ),
                        Container(
                            width: Dimension.fullWidth(context) * 0.35,
                            // color: Colors.blue.withOpacity(0.2),
                            child: Text(' mobile developer.'))
                      ],
                    ))
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
      // height: Dimension.fullHeight(context) * 0.42,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          RichText(
            strutStyle: StrutStyle(height: 1.6),
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1,
              children: [
                TextSpan(text: '    I\'m a '),
                TextSpan(text: 'self-taught ', style: abSty),
                TextSpan(
                    text:
                        'mobile application developer from Myanmar. Firstly I learned JavaScript and PHP for web development. Actually, I didn\'t understand that languages how really work like ES6. Then I decided to become a mobile developer and start learned'),
                TextSpan(
                    text: ' Dart Programming Language include OOP. ',
                    style: abSty),
                TextSpan(text: 'Then'),
                TextSpan(text: ' Flutter ', style: abSty),
                TextSpan(
                    text:
                        'last 2 years ago.Finally, I found my carrier what I really into it. Now I have one year experience from Tech company based from Cambodia.')
              ],
            ),
          ),
          RichText(
            strutStyle: StrutStyle(height: 1.6),
            text: TextSpan(
              style: Theme.of(context).textTheme.bodyText1,
              children: [
                TextSpan(text: '    I learned '),
                TextSpan(
                    text: 'State Management, Lifecycle method', style: abSty),
                TextSpan(
                    text:
                        ' and other things should know for mobile development with '),
                TextSpan(text: 'Flutter.', style: abSty),
              ],
            ),
          )
        ],
      ),
    );
  }
}
