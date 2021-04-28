import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapas/back/firebase.dart';
import 'package:mapas/models/event_model.dart';
import 'package:mapas/screen/menu.dart';
import 'package:mapas/screen/new_event.dart';

class EventsListScreen extends StatefulWidget {
  @override
  _EventsListScreenState createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  var events = [];
  bool parsedEvents = false;

  @override
  initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    getAllEvents();
    super.initState();
  }

  Future<void> getAllEvents() async {
    Firebase firebase = new Firebase();
    var allEvents = await firebase.getAllEvents();

    for (EventModel event in allEvents) {
      if (!event.isDeleted) {
        events.add(event);
      }
    }

    setState(() {
      parsedEvents = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: !parsedEvents
            ? Center(
                child: CircularProgressIndicator(),
              )
            : events.length == 0
                ? buildEmptyList()
                : buildList());
  }

  Widget buildEmptyList() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('No events yet',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'add the first one',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '.',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          NewEventButton(),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  Widget buildList() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () =>
                          Menu.of(context).changeScreen(0, events[index]),
                      title: Text(events[index].title),
                      trailing: DeleteEventButton(),
                    ),
                    Divider(),
                  ],
                );
              }),
        ),
        NewEventButton(),
        SizedBox(
          height: 15,
        )
      ],
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
    return MaterialButton(
      onPressed: () {
        print("delete event");
      },
      child: Icon(
        Icons.close_rounded,
        size: 20,
      ),
      padding: EdgeInsets.all(1),
      shape: CircleBorder(),
    );
  }
}
