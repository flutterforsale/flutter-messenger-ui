import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messenger_ui/src/screen/chats/list_friend.dart';
import 'package:messenger_ui/src/screen/discovery/list_discovery.dart';
import 'package:messenger_ui/src/screen/people/list_people.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    ListFriend(),
    ListPeople(),
    ListDicovery(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Colors.black87),
        unselectedIconTheme: IconThemeData(color: Colors.grey.shade400),
        backgroundColor: Colors.white,
        elevation: 10.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: new Icon(
              FontAwesomeIcons.solidComment,
              size: 24.0,
            ),
            title: Text(
              '',
              style: TextStyle(height: 0.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.userFriends,
              size: 24.0,
            ),
            title: Text(
              '',
              style: TextStyle(height: 0.0),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidCompass,
              size: 24.0,
            ),
            title: Text(
              '',
              style: TextStyle(height: 0.0),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
