import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/list_provider.dart';

import '../constants.dart';

class AddNewType extends StatefulWidget {
  const AddNewType({Key? key}) : super(key: key);

  @override
  _AddNewTypeState createState() => _AddNewTypeState();
}

class _AddNewTypeState extends State<AddNewType> {
  bool _first = true;
  String _type = "";
  @override
  Widget build(BuildContext context) {
    ListsProvider prov = Provider.of<ListsProvider>(context, listen: false);
    return AnimatedCrossFade(
      firstChild: ListTile(
        leading: Icon(Icons.add),
        title: const Text('Add types'),
        onTap: () {
          setState(() {
            _first = false;
          });
        },
      ),
      secondChild: Row(
        children: [
          Expanded(child: TextField(
            onChanged: (e) {
              _type = e;
            },
          )),
          IconButton(
              onPressed: () {
                if (_type != "") {
                  prov.types.add(_type);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(mySnackBar("$_type is added to Type"));
                  _type = "";
                }

                setState(() {
                  _first = true;
                });
                _type = "";
              },
              icon: Icon(Icons.add))
        ],
      ),
      duration: Duration(milliseconds: 500),
      crossFadeState:
          _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
