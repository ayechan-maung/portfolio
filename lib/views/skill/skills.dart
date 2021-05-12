import 'package:flutter/material.dart';
import 'package:portfolio/consts/txt_sty.dart';
import 'package:portfolio/model/skill_model.dart';
import 'package:portfolio/views/skill/know_lang.dart';
import 'package:portfolio/views/skill/skill_lang.dart';

class Skills extends StatefulWidget {
  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  SkillLanguage skillLanguage = SkillLanguage();

  @override
  void initState() {
    super.initState();
    skillLanguage.getSkill(col: 'skills');
    skillLanguage.getKnow();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Education',
                  style: expTtSty,
                ),
              ),
              eduWidget(
                  name: 'A.G.T.I(Mechanical)',
                  school: 'Technological University (Taungoo)',
                  year: '2009 - 2012'),
              eduWidget(
                  name: 'B.Sc(Maths)',
                  school: 'Taungoo University',
                  year: '2013 - 2017'),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Main Skill',
                style: expTtSty,
              ),
            ),
            StreamBuilder<List<SkillModel>>(
                stream: skillLanguage.skillStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<SkillModel> skillList = snapshot.data;
                  return Column(
                    children: skillList
                        .map((e) => skillItem(
                            icon: e.icon, name: e.name, level: e.level))
                        .toList(),
                  );
                })
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Other Programming Knowledge',
                style: expTtSty,
              ),
            ),
            StreamBuilder<List<KnowledgeLang>>(
                stream: skillLanguage.knowStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<KnowledgeLang> skillList = snapshot.data;
                  return Column(
                    children: skillList
                        .map((e) => knowItem(icon: e.icon, name: e.name))
                        .toList(),
                  );
                })
          ],
        ),
      ],
    );
  }

  Widget skillItem({String icon, name, level, int skill}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 100,
            padding: EdgeInsets.all(8.0),
            child: FadeInImage.assetNetwork(
              image: icon,
              placeholder: "assets/images/flutter_favourite.png",
              imageErrorBuilder: (cxt, obj, _) =>
                  Image.asset("assets/images/flutter_favourite.png"),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(level),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget knowItem({String icon, name}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
              height: 80,
              width: 100,
              padding: EdgeInsets.all(8.0),
              child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/flutter_favourite.png",
                  imageErrorBuilder: (cxt, obj, _) =>
                      Image.asset("assets/images/flutter_favourite.png"),
                  image: icon)),
          Container(
            child: Text(name),
          ),
        ],
      ),
    );
  }

  Widget eduWidget({String name, year, school}) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: eduHead,
          ),
          Text(school),
          Text(
            year,
            style: eduYear,
          ),
        ],
      ),
    );
  }
}
