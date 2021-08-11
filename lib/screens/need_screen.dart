import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants.dart';
import 'package:shopy/list_provider.dart';

class NeededList extends StatelessWidget {
  NeededList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ListsProvider prov = Provider.of<ListsProvider>(context, listen: true);
    return Stack(children: [
      ListView.builder(
        itemCount: prov.neededIteams.length,
        itemBuilder: (context, index) => Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (DismissDirection dismissDirection) {
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
                    " ${prov.neededIteams[index].name} has been deleted"));
                prov.deleteFromNeed(index);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Color(0xffbc6c25)),
                  color: Color(0xfffefae0),
                ),
                child: Text(
                  prov.neededIteams[index].name,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
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
