import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(new Example());

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Map',
      style: optionStyle,
    ),
    Text(
      'Events',
      style: optionStyle,
    ),
    Text(
      'Groups',
      style: optionStyle,
    ),
    Text(
      'Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: Text('Hello'),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: GNav(
                  rippleColor: Colors.grey[300],
                  hoverColor: Colors.grey[100],
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100],
                  tabs: [
                    GButton(
                      icon: LineIcons.map,
                      text: 'Map',
                    ),
                    GButton(
                      icon: LineIcons.list,
                      text: 'Events',
                    ),
                    GButton(
                      icon: LineIcons.userFriends,
                      text: 'Groups',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
