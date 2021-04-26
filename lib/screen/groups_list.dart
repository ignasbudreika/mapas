import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var list = ['Group 1', 'Group 2', 'Group 3'];

class GroupsListScreen extends StatefulWidget {
  @override
  _GroupsListScreenState createState() => _GroupsListScreenState();
}

class _GroupsListScreenState extends State<GroupsListScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

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
                        trailing: DeleteGroupButton(),
                      ),
                      Divider(),
                    ],
                  );
                }),
          ),
          NewGroupButton(),
          SizedBox(
            height: 15,
          )
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
          print("new group");
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
    return MaterialButton(
      onPressed: () {},
      child: Icon(
        Icons.close_rounded,
        size: 20,
      ),
      padding: EdgeInsets.all(1),
      shape: CircleBorder(),
    );
  }
}
