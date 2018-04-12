import 'package:flutter/material.dart';
import 'package:flutternw/feature/home/home.dart';


/// Returns the color scheme used by lime
MaterialColor limeColor() {
  return new MaterialColor(0xFF0498C1, {
    50: new Color(0xFFE1F3F8),
    100: new Color(0xFFB4E0EC),
    200: new Color(0xFF82CCE0),
    300: new Color(0xFF4FB7D4),
    400: new Color(0xFF2AA7CA),
    500: new Color(0xFF0498C1),
    600: new Color(0xFF0390BB),
    700: new Color(0xFF0385B3),
    800: new Color(0xFF027BAB),
    900: new Color(0xFF016A9E)
  });
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {

  PageController pageController;
  int index = 0;
  // Create all the pages once and return same instance when required
  final Home _profilePage = new Home();
  final Container _planPage = new Container();
  final Container _startUpNamerPage = new Container();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: index != 0,
              child: new TickerMode(
                enabled: index == 0,
                child: new MaterialApp(home: new Home()),
              ),
            ),
            new Offstage(
              offstage: index != 1,
              child: new TickerMode(
                enabled: index == 1,
                child: new MaterialApp(home: new Container()),
              ),
            ),
            new Offstage(
              offstage: index != 2,
              child: new TickerMode(
                enabled: index == 2,
                child: new MaterialApp(home: new Home()),
              ),
            ),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text("trends"),
              ),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.favorite), title: new Text("feed")),
              new BottomNavigationBarItem(
                  icon: new Icon(Icons.settings), title: new Text("community"))
            ],
            onTap: onTap,
            currentIndex: index
        )
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.index);
  }


  void onTap(int index) {
    setState(() {
      this.index = index;
    });
  }

  void onPageChanged(int page) {

  }


}