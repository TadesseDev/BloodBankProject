import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map not crashing demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget
{
  final Key _mapKey = UniqueKey();
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(title: const Text('Map not crashing demo')),
        body: TheMap(key:widget._mapKey)
    );
  }
}

class TheMap extends StatefulWidget
{
  ///key is required, otherwise map crashes on hot reload
  TheMap({ @required Key key})
      :
        super(key:key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TheMap>
{
  GoogleMapController _mapController ;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //also this avoids it crashing/breaking when the keyboard is up
        resizeToAvoidBottomInset: false,
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(30.0925973,31.3219982),
            zoom: 11.0,
          ),
        )
    );
  }
  Set<Marker> allMarkers(List<Marker> getMarkers){
    Set<Marker> allMark=new Set<Marker>();
    getMarkers.forEach((marker){
      marker.copyWith(
          onTapParam: (){
            setState(() {
              showModalBottomSheet(context: context, builder: (builder){
                return Container();
              },
                  backgroundColor: const Color(0x00FFFFFF));
            });
          }
      );
      allMark.add(marker);
    });
    return allMark;
  }
}