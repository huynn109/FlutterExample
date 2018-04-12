import 'dart:async';
import 'dart:convert';

import 'package:flutternw/data/model/champion_response.dart';
import 'package:http/http.dart' as http;

String _baseUrl = "www.probuilds.net";
Utf8Decoder _utf8Decoder = new Utf8Decoder();

Map<String, String> _getHeaders() {
  return {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "User-Agent": "Heroes Companion"
  };
}

String _getUtf8String(http.Response response) {
  return _utf8Decoder.convert(response.bodyBytes);
}

Future<ChampionResponse> getChampionList() async {
  Uri uri = new Uri.https(_baseUrl, '/ajax/championListNew');
  http.Response response = await http.get(uri, headers: _getHeaders());
  if (response.statusCode != 200) {
    return null;
  }
  dynamic jsonData = json.decode(_getUtf8String(response));
  return new ChampionResponse.fromJson(jsonData);
}
