import 'package:flutternw/data/networking/network_data.dart';

class Injector {
  static final Injector injector = new Injector._injector();
  NetworkData _networkData;

  Injector._injector() {
    _networkData = NetworkData();
  }

  factory Injector() {
    return injector;
  }

  NetworkData get networkData => _networkData;
}
