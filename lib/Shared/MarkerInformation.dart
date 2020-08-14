import 'package:cloud_firestore/cloud_firestore.dart';

//class MarkerInformation{
//  int MID;
//  String markerName,markerCity,phoneNumber,markerTitle,markerSnippet;
//  LatLng markerLocation;
//// drive way Info
//  MarkerInformation({this.MID,this.markerName,this.markerCity,this.markerLocation,
//    this.markerTitle,this.markerSnippet,this.phoneNumber});
//}

//List<MarkerInformation> allMarkerInformation=new List<MarkerInformation>();
List<DocumentSnapshot> DCMarkerInformation=new List<DocumentSnapshot>();
List<DocumentSnapshot> eventMarkerInformation=new List<DocumentSnapshot>();
void setDCMarkerInformation(DocumentSnapshot documentData){
  DCMarkerInformation.add(documentData);
  print('document is added with id ${documentData.documentID}');
}
Map<String,dynamic> getDCMarkerInformation({String markerId}){
  print('hetting data with $markerId');
  Map<String,dynamic> markerInfo=new  Map<String,dynamic>();
  DCMarkerInformation.forEach((element) {
    print('looking for $markerId');
    if(element.documentID == markerId){
      markerInfo=element.data;
      print('data found and seted to return $markerId');
    }
  });
  return markerInfo;
}
void setEventMarkerInformation(DocumentSnapshot document){
  eventMarkerInformation.add(document);
  print('event document added added');
}
Map<String,dynamic> getEventMarkerInformation(String markerId){
  Map<String,dynamic> documentData=new Map<String,dynamic>();
  eventMarkerInformation.forEach((document) {
    if(document.documentID == markerId){
      documentData=document.data;
    }
  });
  return documentData;
}
//void addDCInformation({int MID,String markerName,String markerCity,LatLng markerLocation,
//  String markerTitle,String markerSnippet,String phoneNumber}){
//  allMarkerInformation.add(new MarkerInformation(MID: MID,markerName: markerName,markerCity: markerCity,
//      markerLocation: markerLocation,
//      markerTitle: markerTitle,markerSnippet: markerSnippet,phoneNumber:phoneNumber));}
//
//MarkerInformation getDCMarkerInformation({int MID}){
//  MarkerInformation resultingMarker;
//  allMarkerInformation.forEach((marker){
//    if(marker.MID==MID){
//      resultingMarker=marker;
//    }
//  });
//  return resultingMarker;
////  return (allMarkerInformation.singleWhere((marker){
////   return  marker.MID==MID;
////  }));
//
//}