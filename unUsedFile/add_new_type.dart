import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants/snack_bar.dart';
import 'package:shopy/provider/list_provider.dart';

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
        leading: const Icon(Icons.add),
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
              icon: const Icon(Icons.add))
        ],
      ),
      duration: const Duration(milliseconds: 500),
      crossFadeState:
          _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
