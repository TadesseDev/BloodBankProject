
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CitiesList{
  static List<String> cities=new List<String>();
  static Map<String,CameraPosition> citiesCameraPosition=new Map<String,CameraPosition>();
  Future<void> addCities() async{
    cities.add('Bahirdar');
    citiesCameraPosition.putIfAbsent('Bahirdar',()=>new CameraPosition(
        target:LatLng(11.598431619860792,37.39471435546876) ,zoom: 14));
    cities.add('Gonder');
    citiesCameraPosition.putIfAbsent('Gonder',()=>new CameraPosition(
        target:LatLng(12.59477402876256,37.45513916015626) ,zoom: 14));
    cities.add('Dessie');
    citiesCameraPosition.putIfAbsent('Dessie',()=>new CameraPosition(
        target:LatLng(11.134697572632884,39.635066986083984) ,zoom: 14));
    cities.add('Debre Tabor');
    citiesCameraPosition.putIfAbsent('Debre Tabor',()=>new CameraPosition(
        target:LatLng(11.856683189055326,38.00840377807618) ,zoom: 14));
    cities.add('Debre Markos');
    citiesCameraPosition.putIfAbsent('Debre Markos',()=>new CameraPosition(
        target:LatLng(10.337380463216151,37.72876739501954) ,zoom: 14));
    cities.add('Debre Birhan');
    citiesCameraPosition.putIfAbsent('Debre Birhan',()=>new CameraPosition(
        target:LatLng(10.716273371744672,39.870200157165534) ,zoom: 14));
    cities.add('Woldia');
    citiesCameraPosition.putIfAbsent('Woldia',()=>new CameraPosition(
        target:LatLng(11.825013558204091,39.59266662597656) ,zoom: 14));
    cities.add('Kemissie');
    citiesCameraPosition.putIfAbsent('Kemissie',()=>new CameraPosition(
        target:LatLng(10.716273371744672,39.870200157165534) ,zoom: 15));
  }
}

List<String> get getCities{
  return CitiesList.cities;
}
Map<String,CameraPosition> get cityCameraLocation{
  return CitiesList.citiesCameraPosition;
}