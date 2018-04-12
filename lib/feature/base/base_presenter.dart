import 'package:flutternw/data/networking/network_data.dart';
import 'package:flutternw/feature/base/base_view.dart';
import 'package:flutternw/injection/injector.dart';

abstract class BasePresenter<T extends BaseView> {
  T _view;
  Injector _injector;
  NetworkData _networkData;

  BasePresenter(this._view){
    _injector = new Injector();
    _networkData = new NetworkData();
  }

  NetworkData get networkData => _networkData;
  T get view => _view;

}
