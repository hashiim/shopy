import 'package:flutter/material.dart';

Future<bool> exitShowDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to exit an App'),
      actions: <Widget>[
        ElevatedButton(
            child: const Text("Yes"),
            onPressed: () => Navigator.of(context).pop(true)),
        ElevatedButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(false)),
      ],
    ),
  );
}
