import 'package:flutter/material.dart';
import '../../model/iteam.dart';

class ListsProvider extends ChangeNotifier {
  noti() => notifyListeners();
  List<String> types = [];

////////////////////////////////////////////need/////////
  List<Iteam> neededIteams = [];
  List<Iteam> filterOrNotNeed() {
    bool f = false;
    filters.forEach((fil) {
      if (fil['isActive']) {
        f = true;
      }
    });
    return f ? filterNeededIteams : neededIteams;
  }

  deleteFromNeed(index) {
    neededIteams.remove(filterOrNotNeed()[index]);
    // var x = filterOrNotNeed()[index];

    // print(filterOrNotNeed()[index].name);
    // filterNeededIteams.remove(x);
    // neededIteams.remove(x);
    // noti();
  }

  ////////////////////////////////////////////all/////////
  List<Iteam> allIteams = [];
  filterOrNotAll() {
    bool f = false;
    filters.forEach((fil) {
      if (fil['isActive']) {
        f = true;
      }
    });
    return f ? filterAllIteams : allIteams;
  }

  deleteFromAll(index) {
    allIteams.remove(filterOrNotAll()[index]);
  }

  addToNeed(index) {
    var temp = Iteam(
        name: filterOrNotAll()[index].name, type: filterOrNotAll()[index].type);
    if (!neededIteams.contains(temp)) {
      neededIteams.add(temp);
    }
  }

////////////////////////////////////////add new iteam dialog////
  var newIteamName = "";
  var selectedOption = false;
  List<Map> options = [];
  void makeMapOptions() {
    options = types.map((e) => {'title': e, 'isActive': false}).toList();
  }

  changeState(item) {
    {
      item['isActive'] = !item['isActive'];
      notifyListeners();
    }
  }

//////////////////////////////////////////////////////filter/////
  List<Map> filters = [];
  makeMapFilter() {
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

  clearfilter() {
    makeMapFilter();
    noti();
  }
}
