import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/pre_page.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(PrePage());
}
