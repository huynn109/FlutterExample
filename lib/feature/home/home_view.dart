import 'package:flutternw/data/model/champion.dart';
import 'package:flutternw/feature/base/base_view.dart';

abstract class HomeView extends BaseView {
  void onChampionLoaded(List<Champion> championList);

  void onError(String msg);
}
