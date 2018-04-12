import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutternw/feature/main/main.dart';
import 'package:flutternw/redux/app/app_state.dart';
import 'package:flutternw/redux/common_actions.dart';
import 'package:flutternw/redux/store.dart';
import 'package:redux/redux.dart';

Future<Null> main() async {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;

  var store = await createStore();
  runApp(new MyApp(store));
}

class MyApp extends StatefulWidget {
  MyApp(this.store);

  final Store<AppState> store;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    widget.store.dispatch(new InitAction());
  }

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        title: 'inKino',
        theme: new ThemeData(
          primaryColor: new Color(0xFF1C306D),
          accentColor: new Color(0xFFFFAD32),
        ),
        home: new MainPage(),
      ),
    );
  }
}

//@override
//Widget build(BuildContext context) {
//  return new MaterialApp(
//    title: 'Navigation',
//    theme: new ThemeData(
//      primaryColor: Colors.blueGrey,
//      primarySwatch: Colors.red,
//    ),
//    home: new MainPage(),
//  );
//}
