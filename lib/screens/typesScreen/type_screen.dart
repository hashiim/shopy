import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/screens/typesScreen/add_type_row.dart';
import 'package:shopy/provider/list_provider.dart';

class TypeScreen extends StatelessWidget {
  const TypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListsProvider prov = Provider.of<ListsProvider>(context, listen: true);

    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: prov.types.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(prov.types[index]),
                            IconButton(
                                onPressed: () {
                                  prov.types.removeAt(index);
                                  prov.noti();
                                },
                                icon: Icon(Icons.remove))
                          ],
                        ),
                      ),
                    )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: AddTypeRow(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
