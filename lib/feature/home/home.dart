import 'package:flutter/material.dart';
import 'package:flutternw/data/loading_status.dart';
import 'package:flutternw/data/model/champion.dart';
import 'package:flutternw/feature/home/home_presenter.dart';
import 'package:flutternw/feature/home/home_view.dart';
import 'package:flutternw/feature/widget/champion_grid.dart';
import 'package:flutternw/feature/widget/common.dart';
import 'package:flutternw/feature/widget/loading_view.dart';
import 'package:flutternw/feature/widget/platform_adaptive_progress_indicator.dart';

class Home extends StatelessWidget {
  static const String routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter MVP'),
        ),
        body: new ChampionList());
  }
}

class ChampionList extends StatefulWidget {
  ChampionList({Key key}) : super(key: key);

  @override
  _ChampionListState createState() => new _ChampionListState();
}

class _ChampionListState extends State<ChampionList> implements HomeView {
  bool _isLoading = true;
  LoadingStatus _status = LoadingStatus.loading;
  List<Champion> _champions;
  HomePresenter _presenter;

  @override
  void initState() {
    super.initState();
    _champions = new List();
    _presenter = new HomePresenter(this);
    _presenter.loadChampionList();
  }

  @override
  Widget build(BuildContext context) {
    return new LoadingView(
      status: _status,
      loadingContent: new PlatformAdaptiveProgressIndicator(),
      errorContent: new ErrorView(
        description: 'Error loading events.',
        onRetry: () => _presenter.loadChampionList(),
      ),
      successContent: new EventGrid(
        events: _champions,
        onReloadCallback: () => _presenter.loadChampionList(),
      ),
    );
  }

  @override
  void onChampionLoaded(List<Champion> championList) {
    setState(() {
      _status = LoadingStatus.success;
      _champions = championList;
    });
  }

  @override
  void onError(String msg) {
    setState(() {
      _status = LoadingStatus.error;
      _champions = null;
    });
  }
}
