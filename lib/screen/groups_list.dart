import 'package:flutter/material.dart';

var list = ['Group 1', 'Group 2', 'Group 3'];

class GroupsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(list[index]),
                    ),
                    Divider(),
                    ],
                  );
                }
            ),
          ),
          NewGroupButton()
        ]),
      ),
    );
  }
}


class NewGroupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupsListScreen()),
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

class DeleteGroupButton extends StatelessWidget {
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