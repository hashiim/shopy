import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/list_provider.dart';

class AllScreen extends StatelessWidget {
  AllScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ListsProvider prov =
        Provider.of<ListsProvider>(context, listen: true);
    return Stack(children: [
      ListView.builder(
        itemCount: prov.allIteams.length,
        itemBuilder: (context, index) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
                    " ${prov.allIteams[index].name} has been deleted"));
                prov.deleteFromAll(index);
              },
              onTap: () {
                prov.addToNeed(index);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Color(0xffbc6c25)),
                  color: Color(0xfffefae0),
                ),
                child: Text(
                  prov.allIteams[index].name,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 50,
        right: 50,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: createMaterialColor(Color(0xff606c38)),
          ),
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(),
                        SizedBox(
                          height: 20,
                        ),
                        MyTogleButtom(),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ),
      ),
      Positioned(
        bottom: 50,
        left: 50,
        child: Container(
          decoration: BoxDecoration(
              color: createMaterialColor(Color(0xffbc6c25)),
              shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
        ),
      ),
    ]);
  }
}

class MyTogleButtom extends StatefulWidget {
  const MyTogleButtom({Key? key}) : super(key: key);

  @override
  _MyTogleButtomState createState() => _MyTogleButtomState();
}

class _MyTogleButtomState extends State<MyTogleButtom> {
  @override
  Widget build(BuildContext context) {
    final ListsProvider prov =
        Provider.of<ListsProvider>(context, listen: true);
    return ToggleButtons(
      fillColor: createMaterialColor(Color(0xffbc6c25)),
      children: prov.types
          .map((e) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("$e"),
              ))
          .toList(),
      isSelected: prov.typesBool,
      onPressed: (int index) {
        int count = 0;
        prov.typesBool.forEach((bool val) {
          if (val) count++;
        });

        if (prov.typesBool[index] && count < 2) return;

        setState(() {
          prov.typesBool[index] = !prov.typesBool[index];
        });
      },
    );
  }
}
