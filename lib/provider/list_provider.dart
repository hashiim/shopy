import 'package:flutter/material.dart';
import '../../model/iteam.dart';

class ListsProvider extends ChangeNotifier {
  noti() {
    notifyListeners();
  }

  List<String> types = [
    "type1111111",
    "type2222222",
    "type3333333",
    "type4444444",
    "type5555555",
    "type6666666",
    "type7777777",
  ];

  List<Map> options = [];
  makeMap() {
    options = types.map((e) => {'title': e, 'isActive': false}).toList();
  }

  changeState(item) {
    {
      item['isActive'] = !item['isActive'];
      notifyListeners();
    }
  }

  String newIteamName = "";
  /////////////////////////////////////////////////////
  List<Iteam> allIteams = [
    Iteam(name: "All 0", type: ["0"]),
    Iteam(name: "All 1", type: ["1"]),
    Iteam(name: "All 2", type: ["2"]),
    Iteam(name: "All 3", type: ["3"]),
  ];

  deleteFromAll(index) {
    allIteams.removeAt(index);
    notifyListeners();
  }

///////////////////////////////////////////////////////////
  List<Iteam> neededIteams = [
    Iteam(name: "Need 0", type: ["0"]),
    Iteam(name: "Need 1", type: ["1"]),
    Iteam(name: "Need 2", type: ["2"]),
    Iteam(name: "Need 3", type: ["3"]),
  ];

  addToNeed(index) {
    if (!neededIteams.contains(
        Iteam(name: allIteams[index].name, type: allIteams[index].type))) {
      neededIteams.add(Iteam(
        name: allIteams[index].name,
        type: allIteams[index].type,
      ));
      notifyListeners();
    }
  }

  deleteFromNeed(index) {
    neededIteams.removeAt(index);
    notifyListeners();
  }
}
