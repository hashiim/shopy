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
    return ListView.builder(
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
    );
  }
}
