import 'package:flutter/material.dart';
import 'package:shopy/screens/all_screen.dart';
import 'package:shopy/screens/need_screen.dart';

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
                  color: Color(0xfffefae0),
                ),
                label: 'Need',
                backgroundColor: Color(0xff606c38)),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.unarchive,
                  color: Color(0xfffefae0),
                ),
                label: 'All',
                backgroundColor: Color(0xffdda15e)),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}

Future<bool> exitShowDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Are you sure?'),
      content: Text('Do you want to exit an App'),
      actions: <Widget>[
        ElevatedButton(
            child: Text("Yes"),
            onPressed: () => Navigator.of(context).pop(true)),
        ElevatedButton(
            child: Text('No'),
            onPressed: () => Navigator.of(context).pop(false)),
      ],
    ),
  );
}
