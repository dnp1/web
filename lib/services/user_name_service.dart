import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/user_name.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

@Injectable()
class UserNameService extends BaseHttpService {
  UserNameService(AuthClient http) : super(http);

  Future<UserName> read(String userId) async {
    try {
      final resp = await http.get(urlPrefix + "/user/$userId/name");
      return new UserName.fromJson(extractData(resp));
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Null> update(String userId, String givenName,
      String familyName, String password) async {
    try {
      await http.put(urlPrefix + "/user/$userId/name", body: JSON.encode({
        "givenName": givenName,
        "familyName": familyName,
        "password": password,
      }));
    } catch (e) {
      throw handleError(e);
    }
  }
}
