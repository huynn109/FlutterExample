import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutternw/model/champion_response.dart';
import 'package:html/parser.dart' show parse;

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown';

  _getIPAddress() async {
    var url = '';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
//        _main(response.toString());

        var jsonString = await response.transform(utf8.decoder).join();
//        debugPrint(jsonString);
//        _main(jsonString);
        var data = json.decode(jsonString);
//        debugPrint("Hello " + data.toString());
        var championResponse = new ChampionResponse.fromJson(data);
        result = championResponse.champions.last.name;
        debugPrint(championResponse.champions.last.name);
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
      debugPrint(exception.toString());
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }

  void _main(data) {
    var document = parse(data);
//    print(document.outerHtml);
    debugPrint(document.body
        .getElementsByClassName('champion-tags__tag')
        .length
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
          ],
        ),
      ),
    );
  }
}
