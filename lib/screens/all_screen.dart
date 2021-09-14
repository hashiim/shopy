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
    return ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: prov.allIteams.length,
          itemBuilder: (context, index) {
            return Center(
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
            );
          },
        ),
        Center(
          child: InkWell(
            onTap: () {
              prov.makeMap();
              showDialog(
                  context: context,
                  builder: (_) {
                    return SimpleDialog(
                      children: [
                        TextField(),
                        MyOptions(),
                      ],
                      title: Text('Add new Iteam'),
                    );
                  });
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Color(0xffbc6c25)),
                color: Color(0xfffefae0),
              ),
              child: Text(
                "Add New Iteam",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ],
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
                // margin: EdgeInsets.all(5),
                decoration: customBoxDecoration(option['isActive']),
                child: InkWell(
                    onTap: () {
                      prov.changeState(option);
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
