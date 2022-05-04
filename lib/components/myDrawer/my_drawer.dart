import 'package:flutter/material.dart';
import 'package:shopy/screens/typesScreen/type_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Center(child: Text('Menu')),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const TypeScreen(),
                  ),
                );
              },
              child: const Text(
                "Types managmen",
                textAlign: TextAlign.center,
              )),
          const Divider(),
        ],
      ),
    );
  }
}
