import 'package:bbp2/MapServices/DCLocations.dart';
import 'package:bbp2/Shared/Cities.dart';
import 'package:flutter/material.dart';
import 'package:bbp2/Screns/UserHome.dart';
import 'package:bbp2/Screns/Login.dart';
import 'package:bbp2/Screns/Map.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bbp2/MapServices/DCMarkers.dart';

class Autenticate extends StatefulWidget {
  @override
  _AutenticateState createState() => _AutenticateState();
}

class _AutenticateState extends State<Autenticate> {
  bool goToMap = false;
  List<Marker> allMarkers;

  void goToMapFunction() {
    setState(() {
      goToMap = true;
    });
  }

  void disposeMap() {
    setState(() {
      goToMap = false;
    });
  }
//  void addInfo() async{
//    await CitiesList().addCities();
//    DCMaker().addDCMarkers();
//  }
@override
  @override
  Widget build(BuildContext context) {
    FirebaseUser userS = Provider.of<FirebaseUser>(context);
    Widget screenToBeDisplay;
    if (goToMap) {
      screenToBeDisplay = MapSample(
        cancelMap: disposeMap,
      );
    } else {
      screenToBeDisplay = userS == null
          ? Login(mapState: goToMapFunction)
          : Home(
              mapState: goToMapFunction,
            );
    }
    return  screenToBeDisplay;
  }
}
