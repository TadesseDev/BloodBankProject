//import 'package:bbp2/Shared/Cities.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:bbp2/Shared/MarkerInformation.dart';
//class DCMaker{
//  static List<LatLng> locationLatLang=new List<LatLng>();
//   void addDCMarkers(){
//    locationLatLang.add(new LatLng(11.594415548435633, 37.38822206854821));
//    addDCInformation(MID: 0,markerName : 'ARBB ${getCities[0]} Main Office',
//        markerLocation: new LatLng(11.594415548435633, 37.38822206854821),
//        markerCity: 'Bahir Dar',markerTitle: 'ARBB ${getCities[0]} Main Office',
//        markerSnippet: '',phoneNumber: '+251921577930');
//
//    locationLatLang.add(new LatLng(11.569885649924679, 37.3896074295044));
//    addDCInformation(MID: 1,markerName : 'ARBB ${getCities[1]} Main Office',
//        markerLocation: new LatLng(11.569885649924679, 37.3896074295044),
//        markerCity: 'Debre Tabor',markerTitle: 'ARBB ${getCities[1]} Main Office',
//        markerSnippet: '',phoneNumber: 'DT0000');
//
//    locationLatLang.add(new LatLng(11.570264039717769, 37.37411499023438));
//    addDCInformation(MID: 2,markerName : 'ARBB ${getCities[2]} Main Office',
//        markerLocation: new LatLng(11.570264039717769, 37.37411499023438),
//        markerCity: 'Debre Markos',markerTitle: 'ARBB ${getCities[2]} Main Office',
//        markerSnippet: '',phoneNumber: 'DM0000');
//
//    locationLatLang.add(new LatLng(11.588846553041778, 37.36501693725587));
//    addDCInformation(MID: 3,markerName : 'ARBB ${getCities[3]} Main Office',
//        markerLocation: new LatLng(11.588846553041778, 37.36501693725587),
//        markerCity: 'Gondar',markerTitle: 'ARBB ${getCities[3]} Main Office',
//        markerSnippet: '',phoneNumber: 'GO0000');
//
//    locationLatLang.add(new LatLng(11.600533564209103, 37.41591453552247));
//    addDCInformation(MID: 4,markerName : 'ARBB ${getCities[4]} Main Office',
//        markerLocation: new LatLng(11.600533564209103, 37.41591453552247),
//        markerCity: 'Dessie',markerTitle: 'ARBB ${getCities[4]} Main Office',
//        markerSnippet: '',phoneNumber: 'DE0000');
//
//    locationLatLang.add(new LatLng(11.606502999834897, 37.36398696899415));
//    addDCInformation(MID: 5,markerName : 'ARBB ${getCities[5]} Main Office',
//        markerLocation: new LatLng(11.606502999834897, 37.36398696899415),
//        markerCity: 'Woldia',markerTitle: 'ARBB ${getCities[5]} Main Office',
//        markerSnippet: '',phoneNumber: 'WO0000');
//
//    locationLatLang.add(new LatLng(11.58909879585633,  37.382783889770515));
//    addDCInformation(MID: 6,markerName : 'ARBB ${getCities[6]} Main Office',
//        markerLocation: new LatLng(11.58909879585633,  37.382783889770515),
//        markerCity: 'Debre Birhan',markerTitle: 'ARBB ${getCities[6]} Main Office',
//        markerSnippet: '',phoneNumber: 'DB0000');
//
//    locationLatLang.add(new LatLng(11.590612247961165, 37.389993667602546));
//    addDCInformation(MID: 7,markerName : 'ARBB ${getCities[7]} Main Office',
//        markerLocation: new LatLng(11.590612247961165, 37.389993667602546),
//        markerCity: 'Kemissie',markerTitle: 'ARBB ${getCities[7]} Main Office',
//        markerSnippet: '',phoneNumber: 'KEM0000');
//  }
//}
//
//List<LatLng> get ADCLL{
//  return DCMaker.locationLatLang;
//}
//
//List<CameraPosition> locationPositions=new List<CameraPosition>();
//
//List<CameraPosition> get ADCCP{
//  ADCLL.forEach((alll){
//    locationPositions.add(CameraPosition(target: alll,zoom: 14.0));
//  });
//  return locationPositions;
//}
