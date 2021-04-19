import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  new Padding(
                    padding: new EdgeInsets.only(top: _height / 4),
                    child: new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  new Container(
                      height: _height / 1.6,
                      alignment: Alignment.center,
                      child: Image(
                        width: 40,
                        height: 80,
                        image: AssetImage('assets/mail.jpeg'),
                      )),
                  new Align(
                      alignment: Alignment.center,
                      child: new Container(
                        height: _height / 5,
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
                      height: _height / 1.1,
                      alignment: Alignment.centerLeft,
                      child: Image(
                        width: 60,
                        height: 100,
                        image: AssetImage('assets/city.jpeg'),
                      )),
                  new Container(
                    margin: EdgeInsets.fromLTRB(100, 80, 0, 0),
                    height: _height / 1.2,
                    child: new Container(
                      alignment: Alignment.center,
                      child: new DropdownButton<String>(
                        hint: Text("Miestas"),
                        items: <String>[
                          'Vilnius',
                          'Kaunas',
                          'Klaipėda',
                          'Šiauliai',
                          "Panevėžys"
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
                      height: _height / 1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Privatus rėžimas",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  new Container(
                      margin: EdgeInsets.fromLTRB(25, 300, 0, 0),
                      height: _height / 1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "(Asmens nerodymas žemėlapyje)",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                  new Container(
                    margin: EdgeInsets.fromLTRB(0, 340, 40, 75),
                    height: _height / 1.2,
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
                      height: _height / 1.2,
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
                        _checked = selected;
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
