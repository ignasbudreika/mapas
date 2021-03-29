import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Įvykių sąrašas';

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
              title: Text('Susirinkimas sportui'),
            ),
            ListTile(
              leading: Icon(Icons.audiotrack),
              title: Text('Paklausyt muziką'),
            ),
            ListTile(
              leading: Icon(Icons.chat),
              title: Text('Pasikalbėti'),
            ),
          ],
        ),
      ),
    );
  }
}