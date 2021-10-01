import 'package:flutter/material.dart';
import '../../model/iteam.dart';

class ListsProvider extends ChangeNotifier {
  noti() => notifyListeners();

  List<String> types = [
    // "1",
    // "2",
    // "3",
    // "4",
    // "5",
    // "6",
    // "7",
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
    // Iteam(name: "All 01", type: ["0", "1"]),
    // Iteam(name: "All 12", type: ["1", "2"]),
    // Iteam(name: "All 2", type: ["2"]),
    // Iteam(name: "All 345", type: ["3", "4", "5"]),
    // Iteam(name: "All 3", type: ["3"]),
    // Iteam(name: "All 567", type: ["5", "6", "7"]),
  ];

  deleteFromAll(index) {
    allIteams.removeAt(index);
    notifyListeners();
  }

///////////////////////////////////////////////////////////
  List<Iteam> neededIteams = [
    // Iteam(name: "All 01", type: ["0", "1"]),
    // Iteam(name: "All 12", type: ["1", "2"]),
    // Iteam(name: "All 2", type: ["2"]),
    // Iteam(name: "All 345", type: ["3", "4", "5"]),
    // Iteam(name: "All 3", type: ["3"]),
    // Iteam(name: "All 567", type: ["5", "6", "7"]),
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
    neededIteams.remove(filterOrNotNeed()[index]);
    filterNeededIteams.remove(filterAllIteams);
  }

  bool filterFlag = false;
  List<Map> filters = [];
  filterMakeMap() {
    filters = types.map((e) => {'title': e, 'isActive': false}).toList();
  }

  List<Iteam> filterAllIteams = [];

  List<Iteam> filterNeededIteams = [];
  makeFilterNeed(option) {
    if (option['isActive'] == true) {
      neededIteams.forEach((element) {
        if (element.type.contains(option['title'])) {
          if (!filterNeededIteams.contains(element)) {
            filterNeededIteams.add(element);
          }
        }
      });
    } else {
      List x = [];
      var toRemove = [];
      bool exst;
      filters.forEach((fil) {
        if (fil['isActive']) {
          x.add(fil['title']);
        }
      });
      filterNeededIteams.forEach((element) {
        exst = false;
        x.forEach((el) {
          if (element.type.contains(el)) {
            exst = true;
          }
        });
        if (!exst) {
          toRemove.add(element);
        }
      });
      filterNeededIteams.removeWhere((e) => toRemove.contains(e));
    }
  }

  makeFilterAll(option) {
    if (option['isActive'] == true) {
      allIteams.forEach((element) {
        if (element.type.contains(option['title'])) {
          if (!filterAllIteams.contains(element)) {
            filterAllIteams.add(element);
          }
        }
      });
    } else {
      List x = [];
      var toRemove = [];
      bool exst;
      filters.forEach((fil) {
        if (fil['isActive']) {
          x.add(fil['title']);
        }
      });
      filterAllIteams.forEach((element) {
        exst = false;
        x.forEach((el) {
          if (element.type.contains(el)) {
            exst = true;
          }
        });
        if (!exst) {
          toRemove.add(element);
        }
      });
      filterAllIteams.removeWhere((e) => toRemove.contains(e));
    }
  }

  filterOrNotNeed() {
    bool f = false;
    filters.forEach((fil) {
      if (fil['isActive']) {
        f = true;
      }
    });
    if (f) {
      return filterNeededIteams;
    } else {
      return neededIteams;
    }
  }

  filterOrNotAll() {
    bool f = false;
    filters.forEach((fil) {
      if (fil['isActive']) {
        f = true;
      }
    });
    if (f) {
      return filterAllIteams;
    } else {
      return allIteams;
    }
  }
}
