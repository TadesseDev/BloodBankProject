import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:bbp2/Shared/FormTextDeco.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddEvents extends StatefulWidget {
  @override
  _AddEventsState createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  final formKey = new GlobalKey<FormState>();
  String eventName, eventCity, eventArea;
  double eventLat, eventLong;
  DateTime fromWhen, toWhen;
  Color formTextColor = Colors.white, formHintText = Colors.white54;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Form(
              key: formKey,
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Event Name',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: formTextColor,
                          fontSize: 18,
                          height: 0.5,
                        ),
                        decoration: FTD.copyWith(
                            hintText:
                                'Event name, like "monthly schuled events" ',
                            hintStyle: TextStyle(
                              color: formHintText,
                            ),
                            filled: true,
                            fillColor: Colors.pink,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Color(0x00FFFF),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Color(0x00FFFF)))),
                        onChanged: (val) => eventName = val,
                        validator: (val) => val.length <= 3
                            ? 'Event Name must be >= 4 character'
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'when event starts',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: CupertinoDatePicker(
                          maximumYear: 2030,
                          minimumYear: 2020,
                          minimumDate: DateTime.now(),
                          maximumDate: DateTime.now().add(Duration(days: 465)),
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (date) {
                            fromWhen = date;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
//
                      Text(
                        'when event Ends',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: CupertinoDatePicker(
                          maximumYear: 2030,
                          minimumYear: 2020,
                          minimumDate: DateTime.now(),
                          maximumDate: DateTime.now().add(Duration(days: 465)),
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (date) {
                            toWhen = date;
                          },
                        ),
                      ),
//
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Event locatio in cordinate (lat and long)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        indent: 30,
                        endIndent: 30,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Latitude',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: formTextColor,
                          fontSize: 18,
                          height: 0.5,
                        ),
                        decoration: FTD.copyWith(
                            hintText: 'Latitude Cordinate',
                            hintStyle: TextStyle(
                              color: formHintText,
                            ),
                            filled: true,
                            fillColor: Colors.pink,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Color(0x00FFFF),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Color(0x00FFFF)))),
                        onChanged: (val) => eventLat = double.tryParse(val) !=null ?double.parse(val):null,
                        validator: (val) => double.tryParse(val) !=null && val.length>5 ? null:'latitude must only be number and >=5 character',
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Longitude',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: formTextColor,
                          fontSize: 18,
                          height: 0.5,
                        ),
                        decoration: FTD.copyWith(
                            hintText: 'logitude Cordinate',
                            hintStyle: TextStyle(
                              color: formHintText,
                            ),
                            filled: true,
                            fillColor: Colors.pink,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Color(0x00FFFF),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Color(0x00FFFF)))),
                        onChanged: (val) => eventLong = double.tryParse(val) !=null ?double.parse(val):null,
                        validator: (val) => double.tryParse(val) !=null && val.length>5? null:'longitude must only be number and 5> character',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Event Locatio (City and Location Name)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        thickness: 5,
                        indent: 30,
                        endIndent: 30,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'City Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: formTextColor,
                          fontSize: 18,
                          height: 0.5,
                        ),
                        decoration: FTD.copyWith(
                            hintText: 'City where Event help',
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            filled: true,
                            fillColor: Colors.pink,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Color(0x00FFFF),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Color(0x00FFFF)))),
                        onChanged: (val) => eventCity = val,
                        validator: (val) => val.length <= 3
                            ? 'city name must be >= 4 character'
                            : null,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Area Name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: formTextColor,
                          fontSize: 18,
                          height: 0.5,
                        ),
                        decoration: FTD.copyWith(
                            hintText: 'spacial name of the area',
                            hintStyle: TextStyle(
                              color: formHintText,
                            ),
                            filled: true,
                            fillColor: Colors.pink,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(
                                  color: Color(0x00FFFF),
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                    BorderSide(color: Color(0x00FFFF)))),
                        onChanged: (val) => eventArea = val,
                        validator: (val) => val.length <= 3
                            ? 'area name must be >= 4 character'
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton.icon(
                            icon: Icon(Icons.save),
                            label: Text(
                              'Add Event',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.amber,
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                if (fromWhen !=null && toWhen != null && fromWhen.compareTo(toWhen) <= 0 ) {
                                  // add event to the fire database
                                  FireStoreDatabase().addNewEvent(
                                    eventName: eventName,
                                    startDate: fromWhen,
                                    endDate: toWhen,
                                    latitude: eventLat,
                                    longitude: eventLong,
                                    cityName: eventCity,
                                    areaName: eventArea,
                                  );
                                } else {
                                  print(fromWhen);
                                  print(toWhen);
                                  error(context);
                                }
                              } else {
                                print('invalid form');
                              }
                            },
                          ),
                          RaisedButton.icon(
                            icon: Icon(Icons.cancel),
                            label: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.amber,
                            onPressed: () {
                              Navigator.pushNamed(context, 'AdminHome');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Future error(BuildContext context) async {
    return await showCupertinoDialog(
        context: context,
        useRootNavigator: false,
        builder: (context) {
          return RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('you date and time is wrong...'),
          );
        });
  }
}
