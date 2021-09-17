import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/provider/list_provider.dart';
import 'package:shopy/screens/myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListsProvider>(
        create: (BuildContext context) => ListsProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'shopy',
          home: MyHomePage(),
        ));
  }
}
