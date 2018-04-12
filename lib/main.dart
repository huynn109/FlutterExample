import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutternw/feature/home/home.dart';

Future<Null> main() async {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Navigation',
      theme: new ThemeData(
        primaryColor: Colors.blueGrey
      ),
      home: new Home(),
    );
  }
}
