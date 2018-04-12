import 'dart:async';

import 'package:flutternw/data/model/champion.dart';
import 'package:flutternw/data/model/champion_response.dart';
import 'package:flutternw/data/networking/network_util.dart';

class NetworkData {
  NetworkUtil _networkUtil;
  final String apiKey = "Replace api key here";

  NetworkData() {
    _networkUtil = NetworkUtil();
  }

  Future<List<Champion>> fetchChampionList() async {
    var response = await _networkUtil.request('/ajax/championListNew');
    var champions = new ChampionResponse.fromJson(await response);
    return champions.champions;
  }
}
