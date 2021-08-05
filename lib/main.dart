import 'package:flutter/material.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/screens/myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shopy',
      theme: ThemeData(
        primarySwatch: myColors[1],
      ),
      home: MyHomePage(),
    );
  }
}
