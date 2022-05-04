import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/provider/list_provider.dart';
import 'package:shopy/screens/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

//kk
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListsProvider>(
        create: (BuildContext context) => ListsProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'shopy',
          home: MyHomePage(),
        ));
  }
}
