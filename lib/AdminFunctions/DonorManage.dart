import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeDonor extends StatefulWidget {
  Widget back;
  Widget cancel;
  Map<String,dynamic> userData;
  SeeDonor({this.userData,this.back,this.cancel});
  @override
  _SeeDonorState createState() => _SeeDonorState();
}

class _SeeDonorState extends State<SeeDonor> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> userData = widget.userData;
    return Container(
      padding: EdgeInsets.only(top: 110),
      child: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 200,
                child: Text('${userData['User Name']}',style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: userData['image'],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 5.0,
            color: Colors.black54 ,
            height: 10,
            endIndent: 10,
            indent: 10,
          ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Container(
               padding: EdgeInsets.only(left: 10),
               child:  Text('Email: ',style: TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 40),
               child:  Text('${userData['Email']}',style: TextStyle(
                 color: Colors.black54,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 10),
               child:  Text('Phone Number: ',style: TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 40),
               child:  Text('${userData['Phone Number']} ',style: TextStyle(
                 color: Colors.black54,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 10),
               child:  Text('Age: ',style: TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 40),
               child:  Text('${userData['age']} ',style: TextStyle(
                 color: Colors.black54,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 10),
               child:  Text('Amount as of today: ',style: TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 40),
               child:  Text('${userData['donation amount']} ',style: TextStyle(
                 color: Colors.black54,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 10),
               child:  Text('Password : ',style: TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 40),
               child:  Text('${userData['Password']}',style: TextStyle(
                 color: Colors.black54,
                 fontSize: 20,
               ),),
             ), Container(
               padding: EdgeInsets.only(left: 10),
               child:  Text('About user : ',style: TextStyle(
                 color: Colors.black87,
                 fontSize: 20,
               ),),
             ),
             Container(
               padding: EdgeInsets.only(left: 40),
               child:  Text('${userData['user Profile']}',style: TextStyle(
                 color: Colors.black54,
                 fontSize: 20,
               ),),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: <Widget>[
                 widget.back,
                 widget.cancel,
               ],
             )
           ],
         ),
        ],
      ),
    );
  }
}
