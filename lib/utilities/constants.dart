import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kCitySearchBarStyle = InputDecoration(
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey),
  icon: Icon(
    Icons.local_airport,
    size: 45,
    color: Colors.white,
  ),
  filled: true,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide.none),
  fillColor: Colors.white,
);
