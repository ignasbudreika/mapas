import 'package:flutter/material.dart';

class NewGroup extends StatefulWidget {
  @override
  _NewGroupState createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    bool _valueCheck = false;
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Text(
            "New Group",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(50, 170, 0, 0),
          child: Text(
            "Name",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
            margin: EdgeInsets.fromLTRB(50, 200, 50, 0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Put your group name here',
              ),
            )),
        new Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(50, 290, 0, 0),
          child: Text(
            "Permissions",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(35, 315, 0, 0),
            height: _height / 1.2,
            child: new Stack(
              children: [
                new StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return CheckboxListTile(
                      title: const Text('Allow everyone to invite'),
                      value: _valueCheck,
                      onChanged: (bool value) {
                        setState(() {
                          _valueCheck = value;
                        });
                      },
                    );
                  },
                ),
              ],
            )),
        new Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(35, 365, 0, 0),
            height: _height / 1.2,
            child: new Stack(
              children: [
                new StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return CheckboxListTile(
                      title: const Text(
                          'Allow everyone to create events for this group'),
                      value: _valueCheck,
                      onChanged: (bool value) {
                        setState(() {
                          _valueCheck = value;
                        });
                      },
                    );
                  },
                ),
              ],
            )),
        new Container(
          margin: EdgeInsets.fromLTRB(50, 450, 0, 0),
          child: Text(
            "Add people",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        new Container(
            margin: EdgeInsets.fromLTRB(50, 500, 100, 0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Add people',
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            )),
      ],
    ));
  }
}
