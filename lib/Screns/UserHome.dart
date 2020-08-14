import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:async';

import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:bbp2/Screns/AdminHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbp2/Firebase_services/Fire_Serv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bbp2/MapServices//GeoCoder_getName.dart';

class Home extends StatefulWidget {
  final Function mapState;

  Home({this.mapState});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userLocation;
  Widget loading;
  Uint8List profilePicture;
  String userId;
  Widget home;
  Map<String, dynamic> userData;
  FireServe fi = new FireServe();

  Future<void> loadData() async {
//    print('loading state 1');
    await FireServe().user.currentUser().then((value) {
      userId = value.uid;
    });

//    print('loading state 2');
    Map<String, dynamic> getUserData =
        await FireStoreDatabase().getDonorData(signedUserId: userId);
//    print('loading state 3');
    if (getUserData != null) {
//      print('loading state 4');
      profilePicture =
          await FireStoreDatabase().getProfilePicture(userId: userId);
//      print('loading state 5');
      setState(() {
        userData = getUserData;
        loading = null;
        if (userId == '9We6HJMIOWa2jpNIdSE3tL5AfLI3')
          home = AdminHome();
        else
          home = DonorHome(
            userData: userData,
            profilePicture: profilePicture,
            mapState: widget.mapState,
          );
      });
    } else {
//      print('errore in loading data ');
      setState(() {
        userData = getUserData;
        loading = null;
        home = AdminHome();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
//      home=AdminHome();
      userLocation = 'locationName';
      loading = SpinKitCircle(
        color: Colors.white,
      );
    });
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // print(userData);
    return
        //   AdminHome();
        MaterialApp(
      home: loading ?? home,
    );
  }

  Widget userHome() {
//    setState(() {
//      userLocation='value';
//      print('state changed');
//    });
//    userLocationName().then((value) => (){
//
//    });
    return Container();
  }
}

class DonorHome extends StatefulWidget {
  final Function mapState;
  final Map<String, dynamic> userData;
  final Uint8List profilePicture;

  DonorHome({this.userData, this.mapState, this.profilePicture});

  @override
  _DonorHomeState createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  FireServe fi = new FireServe();
  String userLocation = 'this is the user location';

  Future<void> setUserLocation() async {
    userLocation = await userLocationName();
    setState(() {
      print('user location is #${userLocation}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> userData = widget.userData;
    final Uint8List profilePicture = widget.profilePicture;
    return Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Images/UPTBackground.jpg'),
                  fit: BoxFit.cover),
            ),
            height: 300,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'this is ${userData['User Name']} profile',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          wordSpacing: -2,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      Text(
                        'by donating you are saving lifes',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 17,
                          wordSpacing: -2,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 40,
                        ),
                        label: Container(
                          width: 300,
                          child: Text(
                            userLocation ?? 'trying to feach current user location',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              wordSpacing: -2,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.black, const Color(0x00EEF9F8)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.1, 1],
                )),
                height: 200,
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'donate blood ',
                          style: TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '  save lifes',
                          style: TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 15,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  alignment: Alignment.bottomLeft,
                ),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [const Color(0xFFEEF9F8), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.6])),
                margin: EdgeInsets.fromLTRB(0, 500, 0, 0),
              ),
            )
          ],
        ),
        Container(
            margin: EdgeInsets.fromLTRB(10, 510, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'about the user',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    wordSpacing: -2,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF000000),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 30, 10),
                  child: Text(
                    '${userData['user Profile']}',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      wordSpacing: -2,
                      color: Colors.black38,
                    ),
                  ),
                )
              ],
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 6,
                            offset: Offset(1, 1))
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.fromLTRB(45, 5, 45, 5),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: FlatButton(
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        fi.signOutUser();
                      },
                    )),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 6,
                            offset: Offset(1, 1))
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: FlatButton(
                      child: Text(
                        'Donat Now',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        widget.mapState();
                      },
                    )),
              ],
            )),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: Offset(1, 1),
                      )
                    ],
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '${userData['age']}',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 24,
                                    letterSpacing: 2,
                                    color: const Color(0xFF008DC8),
                                  ),
                                ),
                                Text(
                                  'age',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    wordSpacing: -2,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '${userData['donation amount']}',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 24,
                                    letterSpacing: 2,
                                    color: const Color(0xFF008DC8),
                                  ),
                                ),
                                Text(
                                  'donation amount',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    wordSpacing: -2,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '${userData['Phone Number']}',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 24,
                                    letterSpacing: 2,
                                    color: const Color(0xFF008DC8),
                                  ),
                                ),
                                Text(
                                  'Phone Number',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    wordSpacing: -2,
                                    color: Colors.black26,
                                  ),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ),
          ],
        ),
        Container(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 30,
                offset: Offset(1, 1),
              )
            ]),
            margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
            height: 200,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: profilePicture != null
                    ? Image.memory(profilePicture).image
                    : AssetImage('Images/download.jpeg'),
                radius: 100,
              ),
            )),
      ],
    );
  }
}
