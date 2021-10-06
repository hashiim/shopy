import 'package:flutter/material.dart';
import '../../model/iteam.dart';

class ListsProvider extends ChangeNotifier {
  noti() => notifyListeners();

  List<String> types = [];
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

  /////////////////////////////////////////////////////
  List<Iteam> allIteams = [];

  deleteFromAll(index) {
    allIteams.remove(filterOrNotAll()[index]);
  }

///////////////////////////////////////////////////////////
  List<Iteam> neededIteams = [];
  addToNeed(index) {
    if (!neededIteams.contains(Iteam(
        name: filterOrNotAll()[index].name,
        type: filterOrNotAll()[index].type))) {
      neededIteams.add(Iteam(
        name: filterOrNotAll()[index].name,
        type: filterOrNotAll()[index].type,
      ));
    }
  }

  deleteFromNeed(index) {
    neededIteams.remove(filterOrNotNeed()[index]);
  }

  List<Map> filters = [];
  filterMakeMap() {
    filters = types.map((e) => {'title': e, 'isActive': false}).toList();
  }

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

  List<Iteam> filterAllIteams = [];
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
