import 'package:flutter/material.dart';

List<MaterialColor> myColors = [
  createMaterialColor(Color(0xff606c38)),
  createMaterialColor(Color(0xff283618)),
  createMaterialColor(Color(0xfffefae0)),
  createMaterialColor(Color(0xffdda15e)),
  createMaterialColor(Color(0xffbc6c25)),
];

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

mySnackBar(String text) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    duration: Duration(seconds: 1),
  );
  return snackBar;
}
