import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DCBottomSh extends StatefulWidget {
  final Function cancelMap;
  final LatLng locationCoordinate;
  final String phoneNumber,centerName,centerCity;
  DCBottomSh({this.cancelMap,this.centerName,this.centerCity,this.phoneNumber,this.locationCoordinate});
  @override
  _DCBottomShState createState() => _DCBottomShState();
}

class _DCBottomShState extends State<DCBottomSh> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var halefH = height / 2;
    var quartorH = height / 4;
    var headingH = quartorH / 2;
    return Container(
        color: const Color(0x00FFFFaa),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              color: const Color(0xFFFFFFFF),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: headingH,
                        color: const Color(0xFF303134),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              "${widget.centerName}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                            subtitle: Text(
                              "you will find more informations down bellow",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: ImageIcon(
                          AssetImage('Icons/Drive.png'),
                          size: 40,
                          color: Colors.red,
                        ),
                        title: Text('Drive way'),
                        subtitle: Text(
                            'You can click here and we will guid you with the location'),
                      ),
                      ListTile(
                        leading: ImageIcon(
                          AssetImage('Icons/Location.png'),
                          size: 40,
                          color: Colors.red,
                        ),
                        title: Text('Location Cordiname'),
                        subtitle: Text(
                            'lat ${widget.locationCoordinate.latitude}, long ${widget.locationCoordinate.longitude}'),
                      ),
                      ListTile(
                        leading: ImageIcon(
                          AssetImage('Icons/Phone.png'),
                          size: 40,
                          color: Colors.red,
                        ),
                        title: Text('Phone Number'),
                        subtitle: Text('${widget.phoneNumber}'),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FlatButton(
                          color: const Color(0x00303134),
                          child: ImageIcon(
                            AssetImage('Icons/Home.png'),
                            size: 50,
                            color: const Color(0xFF303134),
                          ),
                          onPressed: (){
                            widget.cancelMap();
                          },
                        ),
                        FlatButton(
                          color: const Color(0x00303134),
                          child: ImageIcon(
                            AssetImage('Icons/BackToMap.png'),
                            size: 50,
                            color: const Color(0xFF303134),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: const Color(0x00FFFFFF),
                backgroundImage: AssetImage(
                  'Images/Heart.png',
                ),
                radius: 40,
              ),
            ),
          ],
        ));
//    return Stack(
//      children: <Widget>[
//        Column(
//          children: <Widget>[
//            Container(
//              height: 100,
//              color: Colors.red,
//              child: Center(
//                child: ListTile(
//                  title: Text("welcome to Amhara Blood Bank",style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 22,
//                  ),),
//                  subtitle: Text("you will find all the informations downbellow ",style: TextStyle(
//                    color: Colors.white60,
//                    fontSize: 19,
//                  ),),
//                ),
//              ),
//            ),
//          ],
//        ),
//        Align(
//          alignment: Alignment.topRight,
//          child: CircleAvatar(
//            backgroundColor: const Color(0x00FFFFFF),
//            backgroundImage: AssetImage('Images/Heart.png',),
//            radius: 40,
//          ),
////
//        ),
//      ],
//    );
  }
}
