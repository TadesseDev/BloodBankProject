
import 'package:flutter/material.dart';
class DisplayMap extends StatefulWidget {
  final Function mapState;
  DisplayMap({this.mapState});
  @override
  _DisplayMapState createState() => _DisplayMapState();
}

class _DisplayMapState extends State<DisplayMap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container()
    );
  }
}

