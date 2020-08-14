import 'dart:async';
import 'package:bbp2/CloudFireStore/FireStoreDatabase.dart';
import 'package:bbp2/Screns/DCBottomSh.dart';
import 'package:bbp2/Shared/Cities.dart';
import 'package:bbp2/Shared/MarkerInformation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';

import 'EventBottomSh.dart';

class MapSample extends StatefulWidget {
  Function cancelMap;

  MapSample({this.cancelMap});

  final Key _mapKey = UniqueKey();

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          body: thsiIsM(cancelMap: widget.cancelMap, key: widget._mapKey)),
    );
  }
}

class thsiIsM extends StatefulWidget {
  Function cancelMap;

  thsiIsM({this.cancelMap, @required Key key}) : super(key: key);

  @override
  _thsiIsMState createState() => _thsiIsMState();
}

class _thsiIsMState extends State<thsiIsM> {
  String cityValue;
  List<Marker> allMarkers=new List<Marker>();
  List<Marker> eventMarkers=new List<Marker>();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition intialPosition = CameraPosition(
    target: LatLng(11.594415548435633, 37.38822206854821),
    zoom: 14.4746,
  );
  //final _key=GlobalKey<FormState>();
  void changeCameraPosition(CameraPosition newCameraPos) async {
    final GoogleMapController newController = await _controller.future;
    setState(() {
      newController.animateCamera(CameraUpdate.newCameraPosition(newCameraPos));
    });
  }
  void zoomMap(int zoomValue)async {
    GoogleMapController newController=await _controller.future;
    setState(() {
      if(zoomValue==0)
        newController.animateCamera(CameraUpdate.zoomOut());
      else if(zoomValue==1)
        newController.animateCamera(CameraUpdate.zoomIn());
    });
  }
  Future userLocation()async{
    PermissionStatus permission=await LocationPermissions().checkPermissionStatus();
    if(permission == PermissionStatus.denied){
      permission=await LocationPermissions().requestPermissions();
    }
    if(permission == PermissionStatus.granted){
//      print('permission granted');
//      print('finding user location');
          Position userPos=
    await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    GoogleMapController newController=await _controller.future;
    setState(() {
      newController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(userPos.latitude,userPos.longitude,),
        zoom: 17,
      )));
    });
    }

  }
  Future setMarker() async{
    List<Marker> allDCMarkers = await FireStoreDatabase().getAllDCMarkers();
    List<Marker> allEventMarkers = await FireStoreDatabase().getAvailableEventMarkers();
    setState(() {
      print('seting a state with marker information');
      eventMarkers=allEventMarkers;
      allMarkers=allDCMarkers;
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMarker();
    CitiesList().addCities();
  }
  @override
  Widget build(BuildContext context) {
//    print('donation center marker ${allMarkers.length}');
//    print('new event marker ${eventMarkers.length}');
//    print('title is ${CameraPosition(
//      target: LatLng(11.594415548435633, 37.38822206854821),
//      zoom: 14.4746,
//    ).toMap()['tilt']}');
    return Stack(
      children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: intialPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          // ignore: sdk_version_set_literal
          markers: getAllMarkers(allMarkers).union(getEventMarkers(eventMarkers)),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
//              RaisedButton(
//                color: const Color(0x11303134),
//                child: Text(
//                  'Welcome to ARBB',
//                  style: TextStyle(
//                    color: Color(0xFF303134),
//                    fontSize: 22,
//                  ),
//                ),
//                onPressed: () {
//                },
//              ),
//              FlatButton(
//                color: const Color(0x11303134),
//                child: Text(
//                  'pic a location, get the info...',
//                  style: TextStyle(
//                    color: Color(0xFF303134),
//                    fontSize: 18,
//                  ),
//                ),
//                onPressed: () {
//                },
//              ),
              FlatButton(
                child: ImageIcon(AssetImage('Icons/Home.png'),size: 60,color: Color(0x99303134),),
                onPressed: widget.cancelMap,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Form(
            child: Container(
              width: (MediaQuery.of(context).size.width / 2),
              child: DropdownButtonFormField(
                isDense: true,
                icon: Icon(Icons.edit),
                iconSize: 22,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0x11303134)
                ),
                hint: Text(cityValue ?? 'chose a city here...'),
                style: TextStyle(
                  color: Color(0xFF303134),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                items: getCities.map((list) {
                  return DropdownMenuItem(
                    value: list,
                    child: Text(list),
                  );
                }).toList(),
                onChanged: (list) {
                  setState(() {
                    changeCameraPosition(cityCameraLocation[list]);
                    cityValue = list;
                  });
                },
              ),
            ),
          ),
        ),
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Color(0x11303134),
                child: Icon(Icons.zoom_out,color: Color(0xFF303134),size: 40,),
                onPressed: (){
                  zoomMap(0);
                },
              ),
              Text('we help you save lifes...',style: TextStyle(
                color: Color(0xFF303134),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
              FlatButton(
                color: Color(0x11303134),
                child: Icon(Icons.zoom_in,color: Color(0xFF303134),size: 40,),
                onPressed: (){
                  zoomMap(1);
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: FlatButton(
            color: Color(0x22303134),
            child: Text('find me',style: TextStyle(
              color:Color(0xFF303134)
            ),),
            onPressed: ()=>userLocation(),
          ),
        )
      ],
    );
  }

  Set<Marker> getAllMarkers(List<Marker> getMarkers) {
    Set<Marker> allMark = new Set<Marker>();
    getMarkers.forEach((marker) {
      allMark.add(
        marker.copyWith(onTapParam: () {
          Map<String,dynamic> markerInfo=getDCMarkerInformation(markerId: marker.markerId.value);
//          print(markerInfo['DCName']);print(markerInfo['DCCity']);
//          print(markerInfo['DCPhoneumber']);print(markerInfo['DCLat']);
//          print(markerInfo['DCLong']);
          setState(() {
            showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return DCBottomSh(
                    cancelMap: widget.cancelMap,
                    centerName: markerInfo['DCName'],
                    centerCity: markerInfo['DCCity'],
                    phoneNumber: markerInfo['DCPhoneumber'],
                    locationCoordinate: new LatLng(markerInfo['DCLat'],markerInfo['DCLong']),
                  );
                },
                backgroundColor: const Color(0x00FFFFFF));
          });
        }),
      );
    });
    return allMark;
  }
  Set<Marker> getEventMarkers(List<Marker> eventMarkers){

    Set<Marker> availableEvents = new Set<Marker>();
    eventMarkers.forEach((element) {
      Map<String,dynamic> eventData=getEventMarkerInformation(element.markerId.value);
      availableEvents.add(element.copyWith(
        onTapParam: (){
          setState(() {
            showModalBottomSheet(context: context, builder: (build){
              return EventBottomSh(
                cancelMap: widget.cancelMap,
                centerName: eventData['Event Name'],
                centerCity: eventData['Event City'],
                areaName: eventData['Event Area'],
                locationCoordinate: new LatLng(
                    eventData['Event Lat'],
                    eventData['Event long']
                ),
              );
            }
            ,backgroundColor: const Color(0x00FFFFFF));
          });
        }
      ));
    });
    return availableEvents;
  }
}
