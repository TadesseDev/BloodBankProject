import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:bbp2/Shared/MarkerInformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FireStoreDatabase {

  CollectionReference donorCollection =
      Firestore.instance.collection('DonnorData');
  CollectionReference dCCollection =
      Firestore.instance.collection('DonationCenters');
  CollectionReference eventCollection = Firestore.instance.collection('Events');

  Future addNewDonor(
      {String did,
      String uN,
      String phoneN,
      String city,
      int age,
      String email,
      String passW,
      int amount,
      String bloodT,
      String userPro,
      File profileP}) async {
    Map<String, dynamic> data = new Map.fromEntries({
      MapEntry('User Name', uN),
      MapEntry('Phone Number', phoneN),
      MapEntry('age', age),
      MapEntry('Email', email),
      MapEntry('Password', passW),
      MapEntry('donation amount', amount),
      MapEntry('Blood Type', bloodT),
      MapEntry('user Profile', userPro),
    });
    await donorCollection.document(did).setData(data);
    if (profileP != null) {
      StorageReference storageRef = FirebaseStorage.instance.ref().child(did);
      StorageUploadTask uploadTask = storageRef.putFile(profileP);
      if (uploadTask.isComplete)
        print('upload is completed');
    } // if there is a picture
  } // add a new user

  Future<Map<String, dynamic>> getDonorData({String signedUserId}) async {
    DocumentReference ref = donorCollection.document(signedUserId);
    Map<String, dynamic> userData = (await ref.snapshots().first).data;
    return userData;
  }

  Future<Uint8List> getProfilePicture({String userId}) async {
    // File imageFile=new File(userId);
    Uint8List imageBytes;
//    if (imageFile.existsSync()) {
//      await imageFile.delete();
//    }
//    await imageFile.create();
//    assert(await imageFile.readAsString() == "");
    StorageReference downloadTask = FirebaseStorage().ref().child(userId);
    await downloadTask
        .getData(1000000)
        .then((value) => ({imageBytes = value}))
        .catchError((err) {
      imageBytes = null;
    });
    print('completed');
    return imageBytes;
  }

  Future addNewDC(
      {String DCName,
      String DCCity,
      String DCArea,
      String DCMarkerHighlightText,
      String DCPhoneumber,
      double DCLat,
      double DCLong}) async {
    await dCCollection.document(DCName).setData({
      'DCName': DCName,
      'DCCity': DCCity,
      'DCArea': DCArea,
      'DCMarkerHighlightText': DCMarkerHighlightText,
      'DCPhoneumber': DCPhoneumber,
      'DCLat': DCLat,
      'DCLong': DCLong
    });
    print('DC creation end success');
  }

  Future<List<DocumentSnapshot>> getAvailableDC() async {
    List<DocumentSnapshot> allDCDocuments = new List<DocumentSnapshot>();
    await dCCollection
        .getDocuments()
        .then((value) => {allDCDocuments.addAll(value.documents)});
    return allDCDocuments;
  }

  Future<List<Marker>> getAllDCMarkers() async {
    double lat, long;
    String MID, markerTitle, snippetText;
    List<Marker> markers = new List<Marker>();
    List<DocumentSnapshot> allDCDocuments = await getAvailableDC();
    allDCDocuments.forEach((element) {
      setDCMarkerInformation(element);
      lat = element.data['DCLat'];
      long = element.data['DCLong'];
      markerTitle = element.data['DCMarkerHighlightText'];
      snippetText = element.data['DCName'];
      MID = element.documentID;
      Marker marker = new Marker(
        markerId: MarkerId(MID),
        icon: BitmapDescriptor.defaultMarkerWithHue(0.5),
        infoWindow: InfoWindow(title: markerTitle, snippet: snippetText),
        position: LatLng(lat, long),
      );
      markers.add(marker);
//      print('marker added ${marker.markerId}');
    });

    return markers;
  }

  Future addNewEvent(
      {String eventName,
      DateTime startDate,
      DateTime endDate,
      double latitude,
      double longitude,
      String cityName,
      String areaName}) async {
    await eventCollection.document(eventName).setData({
      'Event Name': eventName,
      'Event Lat': latitude,
      'Event long': longitude,
      'Event City': cityName,
      'Event Area': areaName,
      'Event Start Date': startDate,
      'Event end Date': endDate,
    });
    print('data seted');
  }
  Future<List<DocumentSnapshot>> getAvailableEvents() async{
    List<DocumentSnapshot> eventDocuments=new List<DocumentSnapshot>();
     await eventCollection.getDocuments().then((value) => {
       eventDocuments = value.documents
     },onError: (arg){
       print('errore finding the documents');
       return arg;
         });
     return eventDocuments;
  }
  Future<List<Marker>> getAvailableEventMarkers() async{
    BitmapDescriptor icon =await
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5,),
      'Icons/eventMarker.png',mipmaps: false,);
    List<DocumentSnapshot> eventDocuments=await getAvailableEvents();
    List<Marker> eventMarkers=new List<Marker>();
    double lat, long;
    String mId, markerTitle, snippetText;
    eventDocuments.forEach((element) {
      setEventMarkerInformation(element);
      lat = element.data['Event Lat'];
      long = element.data['Event long'];
      markerTitle = element.data['Event City'];
      snippetText = element.data['Event Area'];
      mId = element.documentID;
      Marker marker = new Marker(
        markerId: MarkerId(mId),
        icon: icon,
//        defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(
            title: markerTitle,
            snippet: snippetText,
        ),
        position: LatLng(lat, long),
      );
      eventMarkers.add(marker);
//      print('event marker added ${marker.markerId}');
    });
    return eventMarkers;
  }
  Future<List<Map<String,dynamic>>> getAllDonorsData() async{
    List<Map<String,dynamic>> allDonor=new List<Map<String,dynamic>>();
    await donorCollection.getDocuments().then((value) => {

      value.documents.forEach((element) {
        Map<String,dynamic> donorData=element.data;
        donorData.putIfAbsent('userId', () => element.documentID);
        donorData.putIfAbsent('image', () => AssetImage('Icons/Add Users.png'));
        allDonor.add(donorData);
      })
    });
    return allDonor;
  }
} //class
