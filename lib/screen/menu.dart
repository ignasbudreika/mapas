import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mapas/screen/map.dart';
import 'package:mapas/screen/profile.dart';
import 'package:mapas/screen/events_list.dart';

class Menu extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

  static List<Widget> _widgetOptions = <Widget>[
    MapScreen(),
    NewEventButton(),
    Text(
      'Groups',
      style: optionStyle,
    ),
    ProfileScreen(),
  ];

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Menu._widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: GNav(
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[100],
                gap: 8,
                activeColor: Colors.black,
                iconSize: 20,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100],
                tabs: [
                  GButton(
                    icon: LineIcons.map,
                    text: 'Map',
                  ),
                  GButton(
                    icon: Icons.calendar_view_day,
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
    );
  }
}
