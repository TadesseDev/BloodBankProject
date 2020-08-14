import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
Future<String> userLocationName({Function state}) async{
  String locationName;
  PermissionStatus permission=await LocationPermissions().checkPermissionStatus();
  if(permission == PermissionStatus.denied){
    permission=await LocationPermissions().requestPermissions();
  }
  if(permission == PermissionStatus.granted){
//      print('permission granted');
//      print('finding user location');
    Position userPos=
        await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  final Coordinates userCor = new Coordinates(userPos.latitude, userPos.longitude);
    print('latitude is ${userCor.longitude}');
     dynamic addresses = await Geocoder.local.findAddressesFromCoordinates(userCor);
    print('latitude is ${userPos.latitude}');
    dynamic first=addresses.first;
    locationName=first.addressLine;
  }
  print(locationName);
  return locationName;
}