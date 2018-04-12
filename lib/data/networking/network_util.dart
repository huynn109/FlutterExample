import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutternw/data/networking/http_util.dart';

class NetworkUtil {
  String _baseUrl = "www.probuilds.net";

  Future<dynamic> request(String param) async {
    Uri uri = new Uri.http(_baseUrl, param);
    var response = await getRequest(uri);
    return json.decode(response);
  }
}
