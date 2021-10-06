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
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ListsProvider prov = Provider.of<ListsProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 200, maxWidth: 200),
            child: NewTypeTextField(
              myController: this.myController,
            ),
          ),
          IconButton(
              onPressed: () {
                if (myController.text.trim() != "") {
                  prov.types.add(myController.text);

                  ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
                      "${myController.text.trim()} is added to Type"));
                  myController.clear();
                  prov.noti();
                }
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}

class NewTypeTextField extends StatelessWidget {
  const NewTypeTextField({
    Key? key,
    this.myController,
  }) : super(key: key);
  final myController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: myController,
    );
  }
}
