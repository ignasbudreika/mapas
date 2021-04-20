import 'package:flutter/material.dart';

class EventsListScreen extends StatelessWidget {
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
          NewEventButton()
        ]),
      ),
    );
  }
}

class NewEventButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: RaisedButton(
        onPressed: null,
        child: const Text('+', style: TextStyle(fontSize: 20)),
        shape: CircleBorder(),
        color: Colors.green,
        textColor: Colors.white,
        elevation: 3,
      ),
    );
  }
}
