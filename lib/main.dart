import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:resume_app/pages/home.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(title: '小简历'),
    );
  }
}
