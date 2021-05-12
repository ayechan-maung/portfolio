import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/model/skill_model.dart';
import 'package:portfolio/views/skill/know_lang.dart';

class SkillLanguage {
  final fireStore = FirebaseFirestore.instance;

  StreamController<List<SkillModel>> skillController =
      StreamController<List<SkillModel>>.broadcast();
  Stream<List<SkillModel>> get skillStream => skillController.stream;

  StreamController<List<KnowledgeLang>> knowController = StreamController<List<KnowledgeLang>>.broadcast();
  Stream<List<KnowledgeLang>> get knowStream => knowController.stream;

  Future<List<SkillModel>> getSkill({String col}) async {
    final getData = await fireStore.collection(col).get();
    final docs = getData.docs;
    if (docs.length > 0) {
      try {
        final result = docs
            .map(
                (e) => SkillModel.fromJson(Map<String, dynamic>.from(e.data())))
            .toList();
        skillController.sink.add(result);
      } catch (e) {
        print(e.toString());
        return [];
      }
    }
    return [];
  }

  Future<List<KnowledgeLang>> getKnow() async {
    final getData = await fireStore.collection('programming_knowledge').get();
    final docs = getData.docs;
    if (docs.length > 0) {
      try {
        final result = docs
            .map(
                (e) => KnowledgeLang.fromJson(Map<String, dynamic>.from(e.data())))
            .toList();
        knowController.sink.add(result);
      } catch (e) {
        print(e.toString());
        return [];
      }
    }
    return [];
  }
}
