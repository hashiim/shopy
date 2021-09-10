import 'package:flutter/material.dart';
import 'package:shopy/screens/all_screen.dart';
import 'package:shopy/screens/need_screen.dart';
import 'package:shopy/widgets/add_new_type.dart';

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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffbc6c25),
                ),
                child: Center(child: Text('Menu')),
              ),
              Divider(),
              AddNewType(),
              ListTile(
                leading: Icon(Icons.remove),
                title: const Text('Remove types'),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                          return Container();
                        });
                      });
                },
              ),
              Divider(),
            ],
          ),
        ),
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
