import 'package:flutter/material.dart';
import '../../model/iteam.dart';

class ListsProvider extends ChangeNotifier {
  noti() => notifyListeners();
  List<String> types = [];

////////////////////////////////////////////need/////////
  List<Iteam> neededIteams = [];
  List<Iteam> filterOrNotNeed() {
    bool f = false;
    for (var fil in filters) {
      if (fil['isActive']) {
        f = true;
      }
    }
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
    for (var fil in filters) {
      if (fil['isActive']) {
        f = true;
      }
    }
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
      for (var element in neededIteams) {
        if (element.type.contains(option['title'])) {
          if (!filterNeededIteams.contains(element)) {
            filterNeededIteams.add(element);
          }
        }
      }
    } else {
      List x = [];
      var toRemove = [];
      bool exst;
      for (var fil in filters) {
        if (fil['isActive']) {
          x.add(fil['title']);
        }
      }
      for (var element in filterNeededIteams) {
        exst = false;
        for (var el in x) {
          if (element.type.contains(el)) {
            exst = true;
          }
        }
        if (!exst) {
          toRemove.add(element);
        }
      }
      filterNeededIteams.removeWhere((e) => toRemove.contains(e));
    }
  }

  List<Iteam> filterAllIteams = [];
  makeFilterAll(option) {
    if (option['isActive'] == true) {
      for (var element in allIteams) {
        if (element.type.contains(option['title'])) {
          if (!filterAllIteams.contains(element)) {
            filterAllIteams.add(element);
          }
        }
      }
    } else {
      List x = [];
      var toRemove = [];
      bool exst;
      for (var fil in filters) {
        if (fil['isActive']) {
          x.add(fil['title']);
        }
      }
      for (var element in filterAllIteams) {
        exst = false;
        for (var el in x) {
          if (element.type.contains(el)) {
            exst = true;
          }
        }
        if (!exst) {
          toRemove.add(element);
        }
      }
      filterAllIteams.removeWhere((e) => toRemove.contains(e));
    }
  }

  clearfilter() {
    makeMapFilter();
    noti();
  }
}
