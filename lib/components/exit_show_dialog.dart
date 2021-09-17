import 'package:flutter/material.dart';

Future<bool> exitShowDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to exit an App'),
      actions: <Widget>[
        ElevatedButton(
            child: Text("Yes"),
            onPressed: () => Navigator.of(context).pop(true)),
        ElevatedButton(
            child: Text('No'),
            onPressed: () => Navigator.of(context).pop(false)),
      ],
    ),
  );
}
