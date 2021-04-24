import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventScreen extends StatefulWidget {
  @override
  _NewEventState createState() => _NewEventState();
}

class _NewEventState extends State<NewEventScreen> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: 32,
            right: 32,
          ),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 70,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      height: (MediaQuery.of(context).size.height - 70) * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('Add new',
                                style: TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    'Event ',
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '.',
                                    style: TextStyle(
                                        fontSize: 50.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400]),
                                  ),
                                ],
                              )),
                        ],
                      )),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height - 70) * 0.75,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextFormField(
                            controller: titleController,
                            maxLength: 25,
                            cursorColor: Colors.black,
                            validator: (String value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter event title!!!';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'put your event title here',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            maxLength: 75,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'pls pls enter event description!';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'your event description belongs here',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          DateTimeField(
                            validator: (value) {
                              if (value == null) {
                                return 'time!';
                              }
                              return null;
                            },
                            controller: dateController,
                            format: DateFormat("yyyy-MM-dd hh:mm"),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'when does it start',
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            onShowPicker: (context, currentValue) async {
                              final date = await showDatePicker(
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: Colors.grey,
                                          onPrimary: Colors.white,
                                          surface: Colors.grey,
                                          onSurface: Colors.white,
                                        ),
                                        dialogBackgroundColor: Colors.grey[900],
                                      ),
                                      child: child,
                                    );
                                  },
                                  context: context,
                                  firstDate: DateTime.now(),
                                  initialDate: currentValue ?? DateTime.now(),
                                  lastDate: DateTime(2100));
                              if (date != null) {
                                final time = await showTimePicker(
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: Colors.white,
                                          onPrimary: Colors.grey,
                                          surface: Colors.grey[900],
                                          onSurface: Colors.white,
                                        ),
                                        dialogBackgroundColor: Colors.grey,
                                      ),
                                      child: child,
                                    );
                                  },
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(
                                      currentValue ?? DateTime.now()),
                                );
                                return DateTimeField.combine(date, time);
                              } else {
                                return currentValue;
                              }
                            },
                          ),
                          TextFormField(
                            controller: addressController,
                            maxLength: 50,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'cmon enter event address!!!';
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: 'where',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 35.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[800],
                            ),
                            child: GestureDetector(
                              onTap: () async => {
                                if (_formKey.currentState.validate())
                                  {
                                    // example of how to get form data
                                    print(titleController.text +
                                        descriptionController.text +
                                        dateController.text +
                                        addressController.text),
                                    // call function to add data to database
                                    // if success add snackbar of success
                                    // if not add unsuccessful snackbar
                                    //
                                    //  example of LatLng parsing
                                    //     print(await MapLocation
                                    //     .determineGeoLocation(
                                    //         "Turgaus g. 33, Klaipėda 91249")),
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('event added'))),
                                    Navigator.pop(context),
                                  }
                              },
                              child: Center(
                                child: Text(
                                  'add',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
