import 'package:flutter/material.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Event list';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
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
              title: Text('Chat with strangers'),
            ),
            Button(),
          ],
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Align(alignment: Alignment.bottomRight,
    child: RaisedButton(onPressed: null,
    child: const Text('+', style: TextStyle(fontSize: 20)),
    shape: CircleBorder(),
    color: Colors.green,
    textColor: Colors.white,
    elevation: 3,
    ),
    );
  }
}