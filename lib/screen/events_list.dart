import 'package:flutter/material.dart';
import 'package:mapas/screen/new_event.dart';

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
                  title: Text('Meet to play'),
                  trailing: DeleteEventButton(),
                ),
                ListTile(
                  title: Text('Rockband concert'),
                  trailing: DeleteEventButton(),
                ),
                ListTile(
                  title: Text('Team meet'),
                  trailing: DeleteEventButton(),
                ),
              ],
            ),
            NewEventButton(),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class NewEventButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewEventScreen()),
          );
        },
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

class DeleteEventButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
          onPressed: () {},
          child: Icon(
            Icons.close_rounded,
            size: 20,
          ),
          padding: EdgeInsets.all(1),
          shape:CircleBorder(),
      );
  }
}
