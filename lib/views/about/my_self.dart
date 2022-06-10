import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/txt_sty.dart';

class MySelf extends StatelessWidget {
  const MySelf({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: Dimension.fullWidth(context) / 2.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Aye Chan Maung',
                  style: nameSty,
                ),
              ),
              Container(
                  height: 40,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('A '),
                      Container(
                        // width: Dimension.fullWidth(context) * 0.15,
                        child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('self-taught', textStyle: roSty),
                            RotateAnimatedText('passionate', textStyle: roSty),
                            RotateAnimatedText('committed', textStyle: roSty),
                          ],
                        ),
                      ),
                      Text(' mobile developer.')
                    ],
                  )),
              _aboutTxt(context)
            ],
          ),
        ),
        Image.asset('assets/images/flutter_favorite.png', width: Dimension.fullWidth(context) / 2.5),
      ],
    );
  }

  Widget _aboutTxt(BuildContext context) {
    return Container(
      // height: Dimension.fullHeight(context) * 0.42,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8.0),
      //   color: Colors.white,
      // ),
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
                TextSpan(text: ' Dart Programming Language include OOP. ', style: abSty),
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
                TextSpan(text: 'State Management, Lifecycle method', style: abSty),
                TextSpan(text: ' and other things should know for mobile development with '),
                TextSpan(text: 'Flutter.', style: abSty),
              ],
            ),
          )
        ],
      ),
    );
  }
}
