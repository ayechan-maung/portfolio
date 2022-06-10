import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
  List<bool>? _isOpen;

  FirebaseNetwork fireNetwork = FirebaseNetwork();
  WorkExpBase workExp = WorkExpBase();

  List<WorkExp>? expData = [];

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
    return Scaffold(
      backgroundColor: Color(0xFFECEFF1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            // title: Text('Experience'),
            expandedHeight: 150,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title:
                  Text('Experience', style: TextStyle(color: Colors.blue[900])),
              centerTitle: true,
              background: Image.asset(
                'assets/images/ff.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        // height: Dimension.fullHeight(context) * 0.44,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // height: Dimension.fullHeight(context) * 0.1,
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                'Work Experience',
                                style: expTtSty,
                              ),
                            ),
                            // Dimension.spaceHeight(12),
                            Container(
                              // height: Dimension.fullHeight(context) * 0.37,
                              child: StreamBuilder<List<WorkExp>>(
                                stream: workExp.expStream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    expData = snapshot.data;
                                    final List expList =
                                        Iterable.generate(expData!.length)
                                            .toList();
                                    return expList.length > 0
                                        ? AnimationLimiter(
                                            child: Column(
                                              children: expList.map((e) {
                                                // LocalDb.getData(table)
                                                return AnimationConfiguration
                                                    .staggeredList(
                                                  duration: Duration(
                                                      milliseconds: 900),
                                                  position: e,
                                                  child: SlideAnimation(
                                                    horizontalOffset: 40.0,
                                                    delay: Duration(
                                                        milliseconds: 300),
                                                    child: _workExp(
                                                        img: expData![e].image!,
                                                        title: expData![e].title!,
                                                        role: expData![e].role!,
                                                        year: expData![e].year!),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          )
                                        // AnimationLimiter(
                                        //     child: ListView.builder(
                                        //       itemCount: expData.length,
                                        //       itemBuilder:
                                        //           (BuildContext context,
                                        //                   int i) =>
                                        //               AnimationConfiguration
                                        //                   .staggeredList(
                                        //         position: i,
                                        //         child: SlideAnimation(
                                        //           // verticalOffset: 50.0,
                                        //           horizontalOffset: 40.0,
                                        //           duration: Duration(
                                        //               milliseconds: 1900),
                                        //           child: FadeInAnimation(
                                        //             child: _workExp(
                                        //                 img: expData[i].image,
                                        //                 title: expData[i].title,
                                        //                 year: expData[i].year,
                                        //                 role: expData[i].role),
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   )
                                        : Container(
                                            child: Text('No Data'),
                                          );
                                  }
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.error.toString()),
                                    );
                                  }
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
                        height: Dimension.fullHeight(context) +
                            Dimension.fullHeight(context) * 0.49,
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
                )),
          )
        ],
      ),
    );
  }

  Widget _workExp({required String img, required String title, required String year, required String role}) {
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

  Widget _expProjectList() {
    return Container(
      child: StreamBuilder<List<ProjectExp>>(
          stream: fireNetwork.expStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProjectExp> projects = snapshot.data!;
              final List proList = Iterable.generate(projects.length).toList();
              return Expanded(
                child: SingleChildScrollView(
                  child: ExpansionPanelList(
                    elevation: 4,
                    animationDuration: Duration(milliseconds: 800),
                    expansionCallback: (int i, bool isExpand) {
                      setState(() {
                        projects[i].isExpand = !projects[i].isExpand!;
                      });
                    },
                    children: projects
                        .map(
                          (e) => ExpansionPanel(
                            canTapOnHeader: true,
                            headerBuilder:
                                (BuildContext context, bool isExpand) {
                              return _expProject(e.logo!, e.desc!, e.title!);
                            },
                            isExpanded: e.isExpand!,
                            body: Container(
                              padding: EdgeInsets.only(
                                  right: 8.0, left: 8.0, bottom: 8.0),
                              // margin: EdgeInsets.all(8.0),
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
                                    e.about!,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
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
}
