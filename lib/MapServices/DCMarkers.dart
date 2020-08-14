
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bbp2/MapServices/DCLocations.dart';



//Marker ms1 = Marker(
//    markerId: MarkerId('s1'),
//    icon: BitmapDescriptor.defaultMarkerWithHue(0.5),
//  infoWindow: InfoWindow(title: 'station oneeee',snippet: 'click here to see address and more info'),
//  position: ln1,
//  alpha: 0.0,
//);
//Marker ms2 = Marker(
//  markerId: MarkerId('s2'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(0.5),
//  infoWindow: InfoWindow(title: 'station one',snippet: 'click here to see address and more info'),
//  position: ln2,
//);
//Marker ms3 = Marker(
//  markerId: MarkerId('s3'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(0.5),
//  infoWindow: InfoWindow(title: 'station one',snippet: 'click here to see address and more info'),
//  position: ln3,
//);
//Marker ms4 = Marker(
//  markerId: MarkerId('s4'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(0.5),
//  infoWindow: InfoWindow(title: 'station one',snippet: 'click here to see address and more info'),
//  position: ln4,
//);
//Marker ms5 = Marker(
//  markerId: MarkerId('s5'),
//  icon: BitmapDescriptor.defaultMarkerWithHue(0.5),
//  infoWindow: InfoWindow(title: 'station one',snippet: 'click here to see address and more info'),
//  position: ln5,
//);

//List<Marker> mL=new List<Marker>();
//Future<List<Marker>> get availableMarkers async{
//  int index=0;
//  ADCLL.forEach((LALN){
//    mL.add(new Marker(
//  markerId: MarkerId(index.toString()),
//  icon: BitmapDescriptor.defaultMarkerWithHue(0.5),
//  infoWindow: InfoWindow(title: 'station one',snippet: 'click here to see address and more info'),
//  position: LALN,
//),
//    );
//    index++;
//  });
//  return mL;
//}