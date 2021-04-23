import 'package:flutter/material.dart';


class EventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.sports_basketball),
                  title: Text('Meet to play'),
                ),
                ListTile(
                  leading: Icon(Icons.audiotrack),
                  title: Text('Rockband concert'),
                ),
                ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('Team meet'),
                ),
              ],
            ),
          ),
          EventButton()
        ]),
      ),
    );
  }
}

class EventButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: MaterialButton(
              onPressed: () {},
              color: Colors.grey,
              textColor: Colors.white,
              child: Icon(
                Icons.add,
                size: 20,
              ),
              padding: EdgeInsets.all(10),
              shape: CircleBorder(),
          ),
    );
  }
}
