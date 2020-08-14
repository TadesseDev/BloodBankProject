import 'package:flutter/material.dart';

const InputDecoration FTD=InputDecoration(
  hintStyle: TextStyle(
    color: Colors.white,
    fontSize: 15,
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.amber,)
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.amber,)
  ),
);