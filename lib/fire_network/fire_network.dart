import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/model/project_exp_ob.dart';

class FirebaseNetwork {
  final fireStore = FirebaseFirestore.instance;

  // ignore: close_sinks
  StreamController<List<ProjectExp>> expController =
      StreamController<List<ProjectExp>>.broadcast();
  Stream<List<ProjectExp>> get expStream => expController.stream;

  Future<List<ProjectExp>> getFirebase({String col}) async {
    final result = await fireStore.collection(col).get();
    final docs = result.docs;
    print("Docu Length*** ${docs.length}");
    if (docs.length > 0) {
      print("Docu Length in get data**** ${docs.length}");
      try {
        final res = docs.map((e) {
          print("GET DATA****:::: " + e.toString());
          return ProjectExp.fromJson(Map<String, dynamic>.from(e.data()));
          // return expData;
        }).toList();
        expController.sink.add(res);
      } catch (e) {
        print(e.toString());
        return [];
      }
    }
    return [];
  }
}
