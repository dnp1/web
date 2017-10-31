import 'dart:convert';

import 'package:danilo_info/util/auth_client.dart';
import 'package:http/http.dart';

class BaseHttpService {
  BaseHttpService(this._http);

  Map<String, dynamic> extractData(Response resp) => JSON.decode(resp.body)['data'];
  List<dynamic> extractDataList(Response resp) => JSON.decode(resp.body)['dataList'];

  final AuthClient _http;
  AuthClient get http => _http;

  Exception handleError(dynamic e) {
    return new Exception('TODO:Server error; cause: $e');
  }
}