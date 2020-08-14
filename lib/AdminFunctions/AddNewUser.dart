import 'dart:io';

import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:bbp2/Firebase_services/Fire_Serv.dart';
import 'package:bbp2/Screns/AdminHome.dart';
import 'package:bbp2/tempo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bbp2/Shared/FormTextDeco.dart';

class AddNewUser extends StatefulWidget {
  @override
  _AddNewUserState createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  File _userProfileImage;
  String _pictureText;
  String fullName,city,phoneNumber,email,password,bloodType,userProfile;
  int amount,age;
  Color formTextColor=Colors.white,formHintText=Colors.white54;
  final formKey = GlobalKey<FormState>();
  List<String> get bloodTypeList {
    List<String> bType = List<String>();
    bType.add('A');
    bType.add('B');
    bType.add('O');
    bType.add('AB');
    bType.add('A-');
    bType.add('B-');
    bType.add('AB-');
    bType.add('O-');
    bType.add('A+');
    bType.add('B+');
    bType.add('AB+');
    bType.add('O+');
    return bType;
  }
  List<String> get cityList {
    List<String> bType = List<String>();
    bType.add('Bahir Dar');
    bType.add('Debre Tabor');
    bType.add('Debre Markos');
    bType.add('Gondar');
    bType.add('Dessie');
    bType.add('Woldia');
    bType.add('Debre Birhan');
    bType.add('Kemissie');
    return bType;
  }

  Future uploadAnImage() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _userProfileImage = imageFile;
      _pictureText = 'Change Picture';
    });
    print(_userProfileImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              backgroundImage: _userProfileImage != null
                                  ? Image.file(_userProfileImage).image
                                  : null,
                              radius: 50,
                            ),
                            FlatButton.icon(
                              label: Text(
                                _pictureText ?? 'Upload Picture',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => uploadAnImage(),
                              icon: Icon(
                                Icons.camera,
                                size: 40,
                              ),
                            ),
                          ],
                        )),
                    Divider(
                      thickness: 5,
                      indent: 30,
                      endIndent: 30,
                      color: Colors.black,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Full name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Pone number',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: formTextColor,
                                    fontSize: 18,
                                    height: 0.5,
                                  ),
                                  scrollPadding: EdgeInsets.all(0),
                                  decoration: FTD.copyWith(
                                      hintStyle: TextStyle(
                                        color: formHintText,
                                      ),
                                      hintText: 'user name',
                                      filled: true,
                                      fillColor: Colors.pink,
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                            color: Color(0x00FFFF),
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                              color: Color(0x00FFFF)))),
                                  onChanged: (val) => fullName=val,
                                  validator: (val)=>val.length >5 ?null:'User name must be >=6 characters',
                                  maxLength: 60,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  maxLines: 2,
                                  minLines: 1,
                                  style: TextStyle(
                                    color: formTextColor,
                                    fontSize: 18,
                                    height: 0.5,
                                  ),
                                  decoration: FTD.copyWith(
                                    hintStyle: TextStyle(
                                      color: formHintText,
                                    ),
                                    filled: true,
                                    fillColor: Colors.pink,
                                    hintText: 'Phone number',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFF),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                            BorderSide(color: Color(0x00FFFF))),
                                  ),
                                  onChanged: (val) => phoneNumber=val,
                                  validator: (val)=>val.length >=10 ?null:'phone number must be >=6 characters',
                                  maxLength: 30,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 18,
                                    height: 0.5,
                                  ),
                                  decoration: FTD.copyWith(
                                      hintStyle: TextStyle(
                                        color: formHintText,
                                      ),
                                      hintText: 'name be required ',
                                      filled: true,
                                      fillColor: Colors.pink,
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                            color: Color(0x00FFFF),
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          borderSide: BorderSide(
                                              color: Color(0x00FFFF)))),
                                  onChanged: (val) => email=val,
                                  validator: (val)=>val.length >4 ?null:'email is invalid',
                                  maxLength: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                    color: formTextColor,
                                    fontSize: 18,
                                    height: 0.5,
                                  ),
                                  decoration: FTD.copyWith(
                                    hintStyle: TextStyle(
                                      color: formHintText,
                                    ),
                                    filled: true,
                                    fillColor: Colors.pink,
                                    hintText: 'Password',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFF),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                            BorderSide(color: Color(0x00FFFF))),
                                  ),
                                  onChanged: (val) => password=val,
                                  validator: (val)=>val.length >5 ?null:'Invalid Password',
                                  maxLength: 30,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'City',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Age',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Amount',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                child: DropdownButtonFormField(
                                  hint: Text('chose here'),
                                  items: (cityList.map((cityName) {
                                  return DropdownMenuItem(
                                    value: cityName,
                                    child: Text(cityName),
                                    onTap: () {},
                                  );
                                }).toList()),

                                  onChanged: (val) => city=val,
                                  validator: (val)=> val==null ? 'city cant be empity':null,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: formTextColor,
                                    fontSize: 18,
                                    height: 0.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: FTD.copyWith(
                                    hintStyle: TextStyle(
                                      color: formHintText,
                                    ),
                                    filled: true,
                                    fillColor: Colors.pink,
                                    hintText: 'number',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFF),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                        BorderSide(color: Color(0x00FFFF))),
                                  ),
                                  onChanged: (val) => age=int.parse(val),
                                  validator: (val){
                                    var ret;
                                    ret = (int.parse(val) ?? null);
                                    if(ret != null){
                                      return null;
                                    }
                                    return 'invalid number';
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: formTextColor,
                                    fontSize: 18,
                                    height: 0.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: FTD.copyWith(
                                    hintStyle: TextStyle(
                                      color: formHintText,
                                    ),
                                    filled: true,
                                    fillColor: Colors.pink,
                                    hintText: 'number',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide: BorderSide(
                                          color: Color(0x00FFFF),
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                        BorderSide(color: Color(0x00FFFF))),
                                  ),
                                  onChanged: (val) => amount=int.parse(val),
                                  validator: (val){
                                    var ret;
                                    ret = (int.parse(val) ?? null);
                                    if(ret != null){
                                      return null;
                                    }
                                    return 'invalid number';
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Blood Type',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                  hint: Text('Chose the new user Blood type'),
                                  items: (bloodTypeList.map((bType) {
                                    return DropdownMenuItem(
                                      value: bType,
                                      child: Text(bType),
                                      onTap: () {},
                                    );
                                  }).toList()),

                                  onChanged: (val) => bloodType=val,
                                  validator: (val)=> bloodTypeList.contains(val) ? null : 'chose one',
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'User Profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'is something about the user, like age and health Issues',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  maxLines: 4,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21,
                                  ),
                                  decoration: FTD.copyWith(
                                    hintStyle: TextStyle(
                                      color: formHintText,
                                    ),
                                    filled: true,
                                    fillColor: Colors.pink[200],
                                  ),
                                  onChanged: (val) => userProfile=val,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RaisedButton.icon(
                                  icon: Icon(Icons.save), label: Text('Add User',style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                              color: Colors.amber,
                                onPressed: ()async{
                                    if(formKey.currentState.validate()) {
                                      setState(() {
                                        // loading widget
                                      });
                                      FirebaseUser newUser= await FireServe().addUserWithEmailAndPassword(email, password);
                                      if(newUser != null){
                                        await FireStoreDatabase().addNewDonor(
                                          did: newUser.uid,uN: fullName,city: city,phoneN: phoneNumber,age: age,email: email,
                                          passW: password,amount: amount,bloodT: bloodType,
                                            userPro:userProfile,profileP: _userProfileImage ?? null
                                        );
                                      }
                                      setState(() {
                                        // exit loading widget
                                      });
                                    }
                                    else {
                                      print('invalid form');
                                    }
                                },
                              ),
                              RaisedButton.icon(
                                icon: Icon(Icons.cancel), label: Text('Cancel',style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                                color: Colors.amber,
                                onPressed: (){
                                  Navigator.pushNamed(context, 'AdminHome');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
