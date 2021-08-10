import 'package:flutter/material.dart';

import 'model/iteam.dart';

class ListsProvider extends ChangeNotifier {
  List<Iteam> _allIteams = [
    Iteam(name: "banan0", type: ["0"]),
    Iteam(name: "orange1", type: ["1"]),
    Iteam(name: "grep2", type: ["2"]),
    Iteam(name: "apple3", type: ["3"]),
  ];
  List<Iteam> get allIteams => _allIteams;
  set allIteams(i) {
    _allIteams = i;
    notifyListeners();
  }

  List<Iteam> _neededIteams = [
    Iteam(name: "banan0", type: ["0"]),
    Iteam(name: "orange1", type: ["1"]),
    Iteam(name: "grep2", type: ["2"]),
    Iteam(name: "apple3", type: ["3"]),
  ];
  List<Iteam> get neededIteams => _neededIteams;
  set neededIteams(i) {
    _neededIteams = i;
    notifyListeners();
  }

  addToNeed(index) {
    neededIteams.add(Iteam(
      name: allIteams[index].name,
      type: allIteams[index].type,
    ));
    print(neededIteams.length);
    notifyListeners();
  }
}
