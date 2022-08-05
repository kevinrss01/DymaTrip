// ignore_for_file: prefer_const_constructors,, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(DymaTrip());
}

class DymaTrip extends StatelessWidget {
  const DymaTrip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
