import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen() : super();

  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    bool isChecked = false;
    List<String> _checked = [];
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [
              const Color.fromRGBO(0, 0, 0, 1),
              const Color.fromRGBO(0, 0, 0, 1),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          new Scaffold(
            backgroundColor: Colors.transparent,
            body: new Container(
              color: Colors.white,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.center,
                    child: new Padding(
                      padding: new EdgeInsets.only(top: _height / 20),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundImage:
                                new AssetImage('assets/profile.jpg'),
                            radius: _height / 15,
                          ),
                          new SizedBox(
                            height: _height / 45,
                          ),
                          new Text(
                            'Vardenis Pavardenis',
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                      height: _height / 2,
                      alignment: Alignment.center,
                      child: Image(
                        width: 40,
                        height: 80,
                        image: AssetImage('assets/mail.jpeg'),
                      )),
                  new Align(
                      alignment: Alignment.center,
                      child: new Container(
                        height: _height / 3,
                        child: Text(
                          "vardenis.pavardenis@gmail.com",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                  new Container(
                      margin: EdgeInsets.fromLTRB(100, 80, 0, 0),
                      height: _height / 1.6,
                      alignment: Alignment.centerLeft,
                      child: Image(
                        width: 60,
                        height: 100,
                        image: AssetImage('assets/city.jpeg'),
                      )),
                  new Container(
                    margin: EdgeInsets.fromLTRB(100, 80, 0, 0),
                    height: _height / 1.6,
                    child: new Container(
                      alignment: Alignment.center,
                      child: new DropdownButton<String>(
                        hint: Text("Miestas"),
                        items: <String>[
                          'Vilnius',
                          'Kaunas',
                          'Klaip??da',
                          '??iauliai',
                          "Panev????ys"
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  new Container(
                      margin: EdgeInsets.fromLTRB(25, 250, 0, 0),
                      height: _height / 2.5,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Privatus r????imas",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  new Container(
                      margin: EdgeInsets.fromLTRB(25, 300, 0, 0),
                      height: _height / 3,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "(Asmens nerodymas ??em??lapyje)",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 340, 40, 75),
                    height: _height / 5,
                    alignment: Alignment.centerRight,
                    child: FlutterSwitch(
                      height: 20.0,
                      width: 50.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: Colors.black,
                      value: isChecked,
                      onToggle: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                  ),
                  new Container(
                      margin: EdgeInsets.fromLTRB(25, 375, 0, 0),
                      height: _height / 3,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Numatyta vieta",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 510, 190, 0),
                    alignment: Alignment.centerLeft,
                    height: _height / 1.2,
                    child: CheckboxGroup(
                      labels: ["Pagal GPS", "Numatytas miestas"],
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      onSelected: (List selected) => setState(() {
                        if (selected.length > 1) {
                          selected.removeAt(0);
                        } else {}
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
