import 'dart:async';

import 'package:flutternw/data/networking/network_data.dart';
import 'package:flutternw/redux/app/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutternw/redux/app/app_reducer.dart';

Future<Store<AppState>> createStore() async {
  var networkData = new NetworkData();

  return new Store(
    appReducer,
    initialState: new AppState.initial(),
    distinct: true,
  );
}