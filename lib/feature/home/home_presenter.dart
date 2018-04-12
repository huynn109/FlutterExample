import 'package:flutternw/feature/base/base_presenter.dart';
import 'package:flutternw/feature/home/home_view.dart';

class HomePresenter extends BasePresenter<HomeView> {
  HomePresenter(HomeView homeView) : super(homeView);

  void loadChampionList() {
    networkData
        .fetchChampionList()
        .then((champions) => view.onChampionLoaded(champions));
  }
}
