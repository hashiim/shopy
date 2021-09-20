import 'package:flutter/material.dart';

class MyRemoveType extends StatelessWidget {
  const MyRemoveType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.remove),
      title: const Text('Remove types'),
      onTap: () {},
    );
  }
}
