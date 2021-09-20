import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants/snackBar.dart';
import 'package:shopy/provider/list_provider.dart';

class AddTypeRow extends StatefulWidget {
  const AddTypeRow({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTypeRow> createState() => _AddTypeRowState();
}

class _AddTypeRowState extends State<AddTypeRow> {
  String _type = "";
  @override
  Widget build(BuildContext context) {
    ListsProvider prov = Provider.of<ListsProvider>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                prov.noti();
              }
            },
            icon: Icon(Icons.add))
      ],
    );
  }
}
