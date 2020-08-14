import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:bbp2/Shared/FormTextDeco.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbp2/Shared/FormTextDeco.dart';
import 'package:bbp2/AdminFunctions/DonorManage.dart';

class ViewUserInformation extends StatefulWidget {
  @override
  _ViewUserInformationState createState() => _ViewUserInformationState();
}

class _ViewUserInformationState extends State<ViewUserInformation> {
  List<Map<String,dynamic>> users=new List<Map<String,dynamic>>();
  Widget seeUser;
  Future getAllUsers()async {
    List<Map<String,dynamic>> allDonor = await FireStoreDatabase().getAllDonorsData();
    setState(() {
      print('user data loaded');
      users=allDonor;
      });
    users.forEach((element) async {
      Uint8List profileImage = await FireStoreDatabase().getProfilePicture(userId: element['userId']);
      dynamic imageValue = profileImage !=null ? Image.memory(profileImage).image : AssetImage('Icons/Add Users.png');
      element.update('image', (dynamic) => imageValue);
      setState(() {
        //
      });
    });
    }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        seeUser ?? ListView.builder(
          padding: EdgeInsets.only(top: 110),
          itemCount: users.length,
          itemBuilder:(context,item){
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.pink,
                  backgroundImage: users[item]['image'],
                ),
                title: Text('${users[item]["User Name"]}',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
                subtitle: Text('Email is: ${users[item]["Email"]}'
                    ,style: TextStyle(
                  fontSize: 18,
                ),),
                trailing: Icon(Icons.more_vert),
                onTap: (){
                  setState(() {
                    seeUser=SeeDonor(userData: users[item],back: back(),cancel: cancel(),);
                  });
                },
              ),
            );
          },
        ),
        Form(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Colors.white,
                  child: Text('search here',style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 0,
                              blurRadius: 50,
                              offset: Offset(1,1)
                          )
                        ]
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/2.2,
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 1,
                        decoration: FTD.copyWith(
                          hintText: 'by email',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              spreadRadius: 0,
                              blurRadius: 50,
                              offset: Offset(1,1)
                          )
                        ]
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width/2.2,
                      child: TextFormField(
                        minLines: 1,
                        maxLines: 1,
                        decoration: FTD.copyWith(
                          hintText: 'or by user Name',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: Colors.pink,
                  child: Text(
                    'search...',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
        ),
        seeUser == null ? cancel() : Container(),

      ],),
    );
  }
  Widget cancel(){
    return Align(
      alignment: Alignment.bottomRight,
      child: RaisedButton.icon(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: Colors.black54,
        label: Text(
          'Cancel...',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        icon: Icon(Icons.cancel,color: Colors.white,),
        onPressed: () {
          Navigator.pushNamed(context, 'AdminHome');
        },
      ),
    );
  }
  Widget back(){
    return  RaisedButton.icon(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      color: Colors.black54,
      label: Text(
        'back...',
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ),
      ),
      icon: Icon(Icons.settings_backup_restore,color: Colors.white,),
      onPressed: () {
     print('seating state');
    setState(() {
      seeUser=null;
    });
      },
    );

  }
}
