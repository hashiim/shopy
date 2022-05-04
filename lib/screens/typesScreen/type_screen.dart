import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/screens/myhomepage.dart';
import 'package:shopy/screens/typesScreen/localWidgets/add_type_row.dart';
import 'package:shopy/provider/list_provider.dart';

class TypeScreen extends StatelessWidget {
  const TypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListsProvider prov = Provider.of<ListsProvider>(context, listen: true);

    return Scaffold(
      body: ListView(
        children: [
          ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: prov.types.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text(
                              prov.types[index],
                            ),
                            constraints: const BoxConstraints(
                                minWidth: 200, maxWidth: 200),
                          ),
                          IconButton(
                              onPressed: () {
                                prov.types.removeAt(index);
                                prov.noti();
                              },
                              icon: const Icon(Icons.remove))
                        ],
                      ),
                    ),
                  )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AddTypeRow(),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const MyHomePage(),
                  ),
                );
              },
              child: const Text("back"))
        ],
      ),
    );
  }
}
