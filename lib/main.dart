// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:project01/launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Launcher(),
    );
  }
}
