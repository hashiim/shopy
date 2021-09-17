import 'package:flutter/material.dart';
import 'package:shopy/components/myDrawer/add_new_type.dart';

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
          Divider(),
          AddNewType(),
          ListTile(
            leading: Icon(Icons.remove),
            title: const Text('Remove types'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                      return Container();
                    });
                  });
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
