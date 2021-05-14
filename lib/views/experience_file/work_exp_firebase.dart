import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/model/work_exp_ob.dart';

class WorkExpBase {
  final fireStore = FirebaseFirestore.instance;

  // Future<QuerySnapshot> getData({String collection}) async {
  //   final stream = fireStore.collection(collection).snapshots();
  // }
  StreamController<List<WorkExp>> workExpController =
      StreamController<List<WorkExp>>.broadcast();
  Stream<List<WorkExp>> get expStream => workExpController.stream;

  Future<List<WorkExp>> getFirebase({String col}) async {
    final result = await fireStore.collection(col).get();
    final docs = result.docs;
    // print("Docu Length*** ${docs.length}");
    if (docs.length > 0) {
      // print("Docu Length in get data**** ${docs.length}");
      try {
        final res = docs.map((e) {
          // print("GET DATA****:::: " + e.toString());
          // WorkExp expData =
          return WorkExp.fromJson(Map<String, dynamic>.from(e.data()));
          // return expData;
        }).toList();
        workExpController.sink.add(res);
      } catch (e) {
        print(e.toString());
        return [];
      }
    }
    return [];
  }
}
