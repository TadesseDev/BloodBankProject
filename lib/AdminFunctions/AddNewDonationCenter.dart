import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:bbp2/Shared/FormTextDeco.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewDonationCenter extends StatefulWidget {
  @override
  _AddNewDonationCenterState createState() => _AddNewDonationCenterState();
}

class _AddNewDonationCenterState extends State<AddNewDonationCenter> {
  final formKey = new GlobalKey<FormState>();
  String DCName, DCCity, DCArea,DCMarkerHighlightText,DCPhoneumber;
  double DCLat, DCLong;
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
                        'Donation Cenetr Name',
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
                                'Donation center name, like "Center One" ',
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
                        onChanged: (val) => DCName = val,
                        validator: (val) => val.length <= 3
                            ? 'Center Name must be >= 4 character'
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Center locatio in cordinate (lat and long)',
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
                        onChanged: (val) => DCLat = double.parse(val),
                        validator: (val) => val.length <= 3
                            ? 'latitude must be  >= 4 character'
                            : null,
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
                        onChanged: (val) => DCLong = double.parse(val),
                        validator: (val) => val.length <= 3
                            ? 'Longitude must be >= 4 character'
                            : null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Center Locatio (City and Location Name)',
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
                            hintText: 'City where Center held',
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
                        onChanged: (val) => DCCity = val,
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
                        onChanged: (val) => DCArea = val,
                        validator: (val) => val.length <= 3
                            ? 'area name must be >= 4 character'
                            : null,
                      ),
                      ////
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Map related Info for the new Donation Center',
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
                          'marker highlight text',
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
                            hintText: 'simple info for the marker on the map',
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
                        onChanged: (val) =>  DCMarkerHighlightText= val,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'DC Phone number ',
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
                            hintText: 'Phone number',
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
                        onChanged: (val) =>  DCPhoneumber= val,
                        validator: (val) => val.length <= 9
                            ? 'Phone number must be = 10 character'
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
                              'Add Donation Center',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Colors.amber,
                            onPressed: () async {
                              if (formKey.currentState.validate()) {
                                DocumentSnapshot snap=await FireStoreDatabase().addNewDC(
                                     DCName: DCName, DCCity:DCCity,
                                    DCArea:DCArea, DCMarkerHighlightText:DCMarkerHighlightText,
                                     DCPhoneumber:DCPhoneumber, DCLat:DCLat, DCLong: DCLong
                                );
                                print('Donation Center created');
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
}
