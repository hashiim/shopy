import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants/snackBar.dart';
import 'package:shopy/model/iteam.dart';
import 'package:shopy/provider/list_provider.dart';

class AddNewIteamButton extends StatelessWidget {
  const AddNewIteamButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListsProvider prov =
        Provider.of<ListsProvider>(context, listen: false);

    return Center(
      child: InkWell(
        onTap: () {
          prov.newIteamName = "";
          if (prov.types.length != 0) {
            prov.makeMap();

            showDialog(
                context: context,
                builder: (_) {
                  return SimpleDialog(
                    children: [MyTextField(), MyOptions(), AddButton()],
                    title: Text('Add new Iteam'),
                  );
                });
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(mySnackBar(" Please! Add One Type At Least"));
          }
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(),
          ),
          child: Text(
            "Add New Iteam",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListsProvider prov =
        Provider.of<ListsProvider>(context, listen: false);
    return TextField(
      autofocus: true,
      onChanged: (e) {
        prov.newIteamName = e;
        prov.noti();
      },
    );
  }
}

class MyOptions extends StatelessWidget {
  const MyOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ListsProvider prov =
        Provider.of<ListsProvider>(context, listen: true);

    customBoxDecoration(isActive) {
      return BoxDecoration(
        color: isActive ? Color(0xff1763DD) : Colors.white,
        border: Border(
            left: BorderSide(color: Colors.black12, width: 1.0),
            bottom: BorderSide(color: Colors.black12, width: 1.0),
            top: BorderSide(color: Colors.black12, width: 1.0),
            right: BorderSide(color: Colors.black12, width: 1.0)),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      );
    }

    return Wrap(
        spacing: 10.0,
        runSpacing: 20.0,
        children: prov.options
            .map((option) => Container(
                decoration: customBoxDecoration(option['isActive']),
                child: InkWell(
                    onTap: () {
                      prov.x = false;
                      prov.changeState(option);
                      prov.options.forEach((element) {
                        if (element['isActive'] == true) {
                          prov.x = true;
                          prov.noti();
                        }
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text('${option['title']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: option['isActive']
                                    ? Colors.white
                                    : Colors.black87))))))
            .toList());
  }
}

class AddButton extends StatelessWidget {
  AddButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ListsProvider prov =
        Provider.of<ListsProvider>(context, listen: true);

    return TextButton(
      onPressed: prov.newIteamName == "" || prov.x == false
          ? null
          : () {
              List<String> temp = [];
              prov.options.forEach((element) {
                if (element['isActive'] == true) {
                  temp.add(element['title']);
                  element['isActive'] = false;
                }
              });
              prov.allIteams.add(Iteam(name: prov.newIteamName, type: temp));
              prov.x = false;

              prov.noti();
              Navigator.pop(context);
            },
      child: Text("Add"),
    );
  }
}
