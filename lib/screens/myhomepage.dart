import 'package:flutter/material.dart';
import 'package:shopy/utlies/exit_show_dialog.dart';
import 'package:shopy/components/myDrawer/my_drawer.dart';
import 'package:shopy/components/my_app_bar.dart';
import 'package:shopy/screens/allScreen/all_screen.dart';
import 'package:shopy/screens/neededScreen/need_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const NeededList(),
    const AllScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitShowDialog(context);
      },
      child: Scaffold(
        appBar: const MyAppBar(),
        drawer: const MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
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
