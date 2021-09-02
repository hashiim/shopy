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
                        MyOptions(),
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
