import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopy/provider/list_provider.dart';

showMyBottomSheet(context) {
  final ListsProvider prov = Provider.of<ListsProvider>(context, listen: false);
  prov.filterMakeMap();
  Scaffold.of(context).showBottomSheet<void>((BuildContext context) {
    return Container(
      height: 200,
      child: FilerIteam(),
    );
  });
}

class FilerIteam extends StatelessWidget {
  const FilerIteam({Key? key}) : super(key: key);

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
        runAlignment: WrapAlignment.center,
        spacing: 10.0,
        runSpacing: 20.0,
        children: prov.filters
            .map((option) => Container(
                decoration: customBoxDecoration(option['isActive']),
                child: InkWell(
                    onTap: () {
                      prov.changeState(option);
                      prov.makeFilterNeed(option);
                      print(prov.filterNeededIteams.length);
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
