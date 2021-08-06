import 'package:flutter/material.dart';
import 'package:shopy/list_provider.dart';

class AllScreen extends StatelessWidget {
  final ListsProvider prov = ListsProvider();

  AllScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prov.allIteams.length,
      itemBuilder: (context, index) => Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
  }
}
