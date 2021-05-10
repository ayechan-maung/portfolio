import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/txt_sty.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final fireStore = FirebaseFirestore.instance;

  getData() async {
    // final lists = await fireStore.collection('work_exp').doc();
    await for (var snapshot in fireStore.collection('work_exp').snapshots()) {
      for (var data in snapshot.docs) {
        print(data.data());
      }
    }
  }

  getSome() async {
    final someData = await fireStore.collection('projects').get();
    for (var data in someData.docs) {
      data.data().forEach((key, value) {
        print('Value : $value');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSome();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              // height: Dimension.fullHeight(context) * 0.5,
              child: StreamBuilder<QuerySnapshot>(
                stream: fireStore
                    .collection('work_exp')
                    .orderBy(FieldPath.documentId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  final expData = snapshot.data.docs;
                  for (var data in expData) {
                    final title = data['title'];
                    print('data>> ' + data.data().toString());
                    print(title);
                  }
                  return Column(
                    children: expData
                        .map((e) => _workExp(
                            img: e['image'],
                            title: e['title'],
                            role: e['role'],
                            year: e['year']))
                        .toList(),
                  );
                },
              ),
            ),
            _expProjectList()
            // ListView(
            //   children: [
            //     _expProject(
            //       'assets/images/angkor.png',
            //       'Fintech for Microfinance',
            //       'Angkor MFI',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xFF536721,
            //           path: 'assets/images/angkor.png',
            //           title: 'Angkor MFI',
            //         ),
            //       ),
            //     ),
            //     _expProject(
            //       'assets/images/bayon.png',
            //       'Fintech for Microfinance',
            //       'Bayon MFI',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xFF4e4d7e,
            //           path: 'assets/images/bayon.png',
            //           title: 'Bayon MFI',
            //         ),
            //       ),
            //     ),
            //     _expProject(
            //       'assets/images/fcb.png',
            //       'Fintech for Microfinance',
            //       'FCB Credit',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xFF9575CD,
            //           path: 'assets/images/fcb.png',
            //           title: 'FCB Credit',
            //         ),
            //       ),
            //     ),
            //     _expProject(
            //       'assets/images/fintech.png',
            //       'Fintech for Microfinance',
            //       'BIGFINTECH',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xffFFE0B2,
            //           path: 'assets/images/fintech.png',
            //           title: 'BIGFINTECH',
            //         ),
            //       ),
            //     ),
            //     _expProject(
            //       'assets/images/b_pay.png',
            //       'Payment for Microfinance',
            //       'BIGSOFT Pay',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xffFFF9C4,
            //           path: 'assets/images/b_pay.png',
            //           title: 'BIGSOFT Pay',
            //         ),
            //       ),
            //     ),
            //     _expProject(
            //       'assets/images/demo.png',
            //       'Fintech for Microfinance',
            //       'BIGFINTECH Demo',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xffFFE0B2,
            //           path: 'assets/images/demo.png',
            //           title: 'BIGFINTECH Demo',
            //         ),
            //       ),
            //     ),
            //     _expProject(
            //       'assets/images/forsale.png',
            //       'Real Estate',
            //       'BAYON APP',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xffE1BEE7,
            //           path: 'assets/images/forsale.png',
            //           title: 'BAYON APP',
            //         ),
            //       ),
            //     ),
            //     _expProject(
            //       'assets/images/kyats.jpg',
            //       'Currency Converter',
            //       'Rates to MMK',
            //       onPressed: () => Get.to(
            //         () => AppDetail(
            //           color: 0xff80CBC4,
            //           path: 'assets/images/kyats.jpg',
            //           title: 'Rates to MMK',
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ));
  }

  Widget _workExp({String img, String title, String year, String role}) {
    return Container(
      margin: EdgeInsets.only(top: 12.0),
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
            child: Image.network(img),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), Text(role), Text(year)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _expProjectList() {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: fireStore.collection('projects').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            final projects = snapshot.data.docs;
            return Expanded(
                child: ListView(
              children: projects
                  .map((e) => _expProject(e['logo'], e['desc'], e['title']))
                  .toList(),
            ));
          }),
    );
  }

  Widget _expProject(String path, String desc, String appName,
      {VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
              child: Image.network(path),
            ),
            Dimension.spaceWidth(12.0),
            Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appName),
                  Text(
                    desc,
                    style: subSty,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
