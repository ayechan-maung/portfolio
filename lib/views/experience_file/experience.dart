import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/consts/dimension.dart';
import 'package:portfolio/consts/launch_url.dart';
import 'package:portfolio/consts/txt_sty.dart';
import 'package:portfolio/fire_network/fire_network.dart';
import 'package:portfolio/local_db/local_db.dart';
import 'package:portfolio/model/project_exp_ob.dart';
import 'package:portfolio/model/work_exp_ob.dart';
import 'package:portfolio/views/experience_file/work_exp_firebase.dart';
import 'package:portfolio/views/widgets/skeleton_loading.dart';

class Experience extends StatefulWidget {
  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final fireStore = FirebaseFirestore.instance;
  List<bool> _isOpen;

  FirebaseNetwork fireNetwork = FirebaseNetwork();
  WorkExpBase workExp = WorkExpBase();

  List<WorkExp> expData = [];

  Future<void> fetchLocalData() async {
    final result = await LocalDb.getData('work_exp');
    // result.map((e) => print(e.toString())).toList();
    if (result != null) {
      print('get db data >> ' + result.length.toString());
      setState(() {
        expData = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fireNetwork.getFirebase(col: 'projects');
    // workExp.getFirebase(col: 'work_exp');

    workExp.getFirebase(col: 'work_exp');
    // workExp.expStream.listen((workList) {
    //   workList.forEach(
    //     (e) => LocalDb.insert(
    //       'work_exp',
    //       {'title': e.title, 'role': e.role, 'year': e.year, 'image': e.image},
    //     ),
    //   );
    // });
    // fetchLocalData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Dimension.fullHeight(context) * 0.42,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Work Experience',
                        style: expTtSty,
                      ),
                    ),
                    // Dimension.spaceHeight(12),
                    Container(
                      child: StreamBuilder<List<WorkExp>>(
                        stream: workExp.expStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            expData = snapshot.data;
                            return expData.length > 0
                                ? Column(
                                    children: expData.map((e) {
                                      // LocalDb.getData(table)
                                      return _workExp(
                                          img: e.image,
                                          title: e.title,
                                          role: e.role,
                                          year: e.year);
                                    }).toList(),
                                  )
                                : Container(
                                    child: Text('No Data'),
                                  );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }
                          // for (var data in expData) {
                          //   final title = data['title'];
                          //   print('data>> ' + data.data().toString());
                          //   print(title);
                          // }
                          // if(expData.length > 0) {
                          //
                          // }
                          return SkeletonLoading(
                            item: 3,
                            radius: 30,
                          );
                        },
                      ),
                    ),
                    // Column(
                    //   children: expData.map((e) {
                    //     // LocalDb.getData(table)
                    //     return _workExp(
                    //         img: e.image,
                    //         title: e.title,
                    //         role: e.role,
                    //         year: e.year);
                    //   }).toList(),
                    // )
                  ],
                ),
              ),
              // ExpansionPanelList(
              //   expansionCallback: (i, isOpen) {
              //     setState(() {
              //       _isOpen[i] = !isOpen;
              //     });
              //   },
              //   children: [
              //     expWork(_isOpen[0]),
              //   ],
              // ),

              Container(
                height: Dimension.fullHeight(context) * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 20,
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Flutter Project Experience',
                        style: expTtSty,
                      ),
                    ),
                    _expProjectList(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _workExp({String img, String title, String year, String role}) {
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
              placeholder: "assets/images/flutter_favorite.png",
              image: img,
              imageErrorBuilder: (cxt, obj, _) =>
                  Image.asset("assets/images/flutter_favorite.png"),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: eduHead,
                ),
                Text(role),
                Text(
                  year,
                  style: eduYear,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _expProjectList() {
    return Container(
      child: StreamBuilder<List<ProjectExp>>(
          stream: fireNetwork.expStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProjectExp> projects = snapshot.data;
              return Expanded(
                  child: SingleChildScrollView(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 800),
                  expansionCallback: (int i, bool isExpand) {
                    setState(() {
                      projects[i].isExpand = !projects[i].isExpand;
                    });
                  },
                  children: projects
                      .map(
                        (e) => ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpand) {
                            return _expProject(e.logo, e.desc, e.title);
                          },
                          isExpanded: e.isExpand,
                          body: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          LaunchUrl.launchUrl(e.androidUrl),
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Image.asset(
                                          'assets/images/ps.png',
                                          height: 45,
                                        ),
                                      ),
                                    ),
                                    e.iosUrl == ""
                                        ? Container()
                                        : InkWell(
                                            onTap: () =>
                                                LaunchUrl.launchUrl(e.iosUrl),
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 8.0, right: 8.0),
                                              child: Image.asset(
                                                'assets/images/app_store.png',
                                                height: 30,
                                              ),
                                            ),
                                          ),
                                    InkWell(
                                      onTap: () => Fluttertoast.showToast(
                                          msg:
                                              'The owner not allow to see the code because of company rule',
                                          backgroundColor:
                                              Colors.blue.withOpacity(0.3),
                                          gravity: ToastGravity.TOP,
                                          textColor: Colors.white,
                                          fontSize: 14),
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        child: Image.asset(
                                          'assets/images/github.png',
                                          height: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  e.about,
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ));
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            // print(snapshot.data.runtimeType);
            return SkeletonLoading(
              radius: 45,
              item: 4,
            );
          }),
    );
  }

  Widget _expProject(String path, String desc, String appName) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                height: 90,
                width: 90,
                placeholder: "assets/images/flutter_favorite.png",
                image: path,
                imageErrorBuilder: (cxt, obj, _) =>
                    Image.asset("assets/images/flutter_favorite.png"),
              ),
            ),
          ),
          Dimension.spaceWidth(12.0),
          Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appName,
                  style: eduHead,
                ),
                Text(
                  desc,
                  style: subSty,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
