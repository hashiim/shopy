import 'package:flutter/material.dart';

mySnackBar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 1),
  );
}
