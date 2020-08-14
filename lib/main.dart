import 'package:flutter/material.dart';
import 'package:bbp2/Firebase_services/Fire_Serv.dart';
import 'package:bbp2/Autenticate/Autenticate.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(
    RootWidget(),
);
class RootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: FireServe().userStatus,
      child: Autenticate(),
    );
  }
}
