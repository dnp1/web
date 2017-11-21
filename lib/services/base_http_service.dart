import 'dart:convert';

import 'package:danilo_info/util/auth_client.dart';
import 'package:http/http.dart';

class BaseHttpService {
  final String urlPrefix = 'http://danilo.local:3000';
  BaseHttpService(this._http);

  Map<String, dynamic> extractData(Response resp) => JSON.decode(resp.body);

  List<dynamic> extractDataList(Response resp) {
    return JSON.decode(resp.body);
  }

  final AuthClient _http;
  AuthClient get http => _http;

  Exception handleError(dynamic e) {
    throw e;
  }
}