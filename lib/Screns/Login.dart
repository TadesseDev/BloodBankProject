import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bbp2/Firebase_services/Fire_Serv.dart';
import 'package:bbp2/Shared/FormTextDeco.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  final Function mapState;
  Login({this.mapState});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static String signedEmail;
String _userName='';
String _password='';
final formKey=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF000000),
              ),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        Image(
                          image: AssetImage('Images/Heart.png'),
                          height: 100,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 5,
                        ),
                        SizedBox(height: 20,),//heart image
                        Container(
                          child: Text(
                            'Amhara Blood Bank',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Divider(
                          color: Colors.amber,
                          thickness: 2,
                          indent: 10,
                          endIndent: 23,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  cursorColor: Colors.white,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  decoration: FTD.copyWith(hintText: 'User Name ...'),
                                  onChanged: (val) => _userName = val,
                                  validator: (val)=> val.length<=5?'invalid user name':null,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  cursorColor: Colors.white,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  decoration: FTD.copyWith(hintText: 'Password ...'),
                                  onChanged: (val) => _password = val,
                                  validator: (val)=> val.length<=5?'Password must be >=6':null,
                                ),
                              ],
                            ),
                          ),
                        ), //Form Container
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                color: Colors.amber,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                onPressed: () {
                                 if(!formKey.currentState.validate()){
                                   print('invalid form');
                                 }
                                  else
                                    FireServe().signInWithEmailAndPassword(_userName, _password);
                                },
                              ),
                            ),
                          ],
                        ), //Sign in button
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'OR ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                color: Colors.amber,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Donate Now',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      'No need for signing in... we will locat you with map ',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  widget.mapState();
                                },
                              ),
                            ),
                          ],
                        ), //donate now
                      ],
                    ),
                  ),
                 SizedBox(height: 20,),
                 Stack(
                   children: <Widget>[
                     Align(
                       alignment: Alignment.bottomCenter,
                       child: Container(
                         width: 350,
                        child: Text('this app is designed by Bahirdar University Fourth Year '
                             'Students and can only be Used under the students Approval',
                           style: TextStyle(
                             color: Colors.white30,
                             fontSize: 20,
                           ),),
                       ),
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                         Container(
                             alignment: Alignment.bottomCenter,
//
                         )
                       ],
                     )
                   ],
                 ), // bottom gradient
                ],
              ),
            ),
          ],
        ),
      ),
    ),
        );
  }
}
