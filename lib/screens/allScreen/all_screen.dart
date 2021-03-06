import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/constants/snack_bar.dart';
import 'package:shopy/provider/list_provider.dart';

import 'localWidgets/add_new_iteam_button.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ListsProvider prov =
        Provider.of<ListsProvider>(context, listen: true);
    return ListView(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: prov.filterOrNotAll().length,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    prov.addToNeed(index);
                    ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
                        " ${prov.filterOrNotAll()[index].name} has been added"));
                  },
                  child: Dismissible(
                    onDismissed: (DismissDirection dismissDirection) {
                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar(
                          " ${prov.filterOrNotAll()[index].name} has been deleted"));
                      prov.deleteFromAll(index);
                    },
                    key: UniqueKey(),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(),
                      ),
                      child: Text(
                        prov.filterOrNotAll()[index].name,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const AddNewIteamButton(),
      ],
    );
  }
}
