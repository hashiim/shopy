import 'package:flutter/material.dart';
import 'package:shopy/components/exit_show_dialog.dart';
import 'package:shopy/components/myDrawer/my_drawer.dart';
import 'package:shopy/screens/allScreen/all_screen.dart';
import 'package:shopy/screens/neededScreen/need_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[NeededList(), AllScreen()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitShowDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.filter_list_rounded)),
            )
          ],
        ),
        drawer: MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.archive,
              ),
              label: 'Need',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.unarchive,
              ),
              label: 'All',
            ),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
