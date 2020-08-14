import 'package:bbp2/AdminFunctions/AddEvent.dart';
import 'package:bbp2/AdminFunctions/AddNewDonationCenter.dart';
import 'package:bbp2/AdminFunctions/AddNewUser.dart';
import 'package:bbp2/AdminFunctions/ViewUserInformation.dart';
import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:bbp2/Firebase_services/Fire_Serv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  Stream<Widget> wid;
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  Widget activeWidget;
  Map<int,Widget> adminActionWidgets=new Map<int,Widget>.fromEntries({
    MapEntry (0,AddEvents()),
    MapEntry(1,AddNewDonationCenter()),
    MapEntry(2,AddNewUser()),
    MapEntry(3,ViewUserInformation()),
  });
    Map<int,String> administrativeActions=new Map<int,String>.fromEntries({
      MapEntry (0,'Add (prepare) Events'),
      MapEntry(1,'Add new Donation Center'),
      MapEntry(2,'Add new User (Donator)'),
      MapEntry(3,"View User's Information" ),
    });
    Map<int,AssetImage> assetImages=new Map<int,AssetImage>.fromEntries({
      MapEntry (0,AssetImage('Icons/Add Events.png')),
      MapEntry(1,AssetImage('Icons/Add Donation Center.png')),
      MapEntry(2,AssetImage('Icons/Add Users.png')),
      MapEntry(3,AssetImage('Icons/View Users Information.png'))
    });
    List<String> lis=new List<String>();
    int a;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'AdminHome': (_)=>AdminHome(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Administrator Home',style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),),
          backgroundColor: Colors.amber,
          leading: Icon(Icons.settings,color: Colors.black,),
          actions: <Widget>[FlatButton.icon(
            icon: Icon(Icons.lock_outline,color: Colors.black),
            label: Text('logout'),
            onPressed: (){
              FireServe().signOutUser();
            },
          )],
        ),
        body: activeWidget ?? Container(
          child: Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: administrativeActions.length,
                itemBuilder: (context,newIndex){
                  return Container(
                      margin: EdgeInsets.fromLTRB(0, (MediaQuery.of(context).size.width/40), 0, (MediaQuery.of(context).size.width/40)),
                      child: GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: (MediaQuery.of(context).size.width/1.4),
                                height: (MediaQuery.of(context).size.width/2.5),
                                child: Card(
                                  elevation: 10,
                                  color: Colors.amber,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB((MediaQuery.of(context).size.width/9), 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text('${administrativeActions[newIndex]}',style: TextStyle(
                                            fontSize: (MediaQuery.of(context).size.width/20),
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                          Divider(
                                            thickness: 3,
                                            indent: 20,
                                            endIndent: 20,
                                            color: Colors.black,
                                          ),
                                          Text('here you can ${administrativeActions[newIndex]}',style: TextStyle(
                                            fontSize: (MediaQuery.of(context).size.width/25),
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                          Text('... click anywhere to get started...',style: TextStyle(
                                            fontSize: (MediaQuery.of(context).size.width/30),
                                            color: Colors.black38,
                                            fontWeight: FontWeight.bold,
                                          ),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                boxShadow: [BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset.fromDirection(1),
                                  color: Colors.black,
                                  spreadRadius: 3,
                                )],
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.pink,
                                backgroundImage: assetImages[newIndex],
                                radius: (MediaQuery.of(context).size.width/5),
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          setState(() {
                            print(newIndex);
                            activeWidget=adminActionWidgets[newIndex];
                          });
                        },
                      )
                  );
//               Container(
//               height: 180,
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: CircleAvatar(
//                       backgroundColor: Colors.amber,
//                       backgroundImage: AssetImage('Images/download.jpeg'),
//                   radius: 80,
//                 ),
//               ),
//             );
//                 Container(
//                   height: 100,
//                   width: 3,
//                   child: CircleAvatar(
//                     radius: 4,
//                       backgroundImage: AssetImage('Images/download.jpeg'),
//                     backgroundColor: Colors.amber,
//                ),
//                 );
                },
              ),
//              Align(
//                alignment: Alignment.bottomCenter,
//                child: Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: Container(
//                        margin: EdgeInsets.fromLTRB(1, 2, 1, 5),
//                        color: Colors.pink,
//                        height: 50,
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: Text('Administrative Control Area ....',style: TextStyle(
//                            fontSize: 25,
//                            fontWeight: FontWeight.bold,
//                            color: Colors.white,
//                          ),),
//                        ),
//                      ),
//                    )
//                  ],
//                )
//              ),
            ],
          )
        ),
      ),
    );
  }
}
