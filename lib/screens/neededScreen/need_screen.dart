import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants/snack_bar.dart';
import 'package:shopy/provider/list_provider.dart';

class NeededList extends StatelessWidget {
  const NeededList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ListsProvider prov = Provider.of<ListsProvider>(context, listen: true);
    return ListView.builder(
      itemCount: prov.filterOrNotNeed().length,
      itemBuilder: (context, index) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: UniqueKey(),
            onDismissed: (DismissDirection dismissDirection) {
              ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
                  " ${prov.filterOrNotNeed()[index].name} has been deleted"));
              prov.deleteFromNeed(index);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(),
              ),
              child: Text(
                prov.filterOrNotNeed()[index].name,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
