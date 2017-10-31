import 'dart:async';
import 'dart:convert';
import 'package:angular/di.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

@Injectable()
class UserPasswordService extends BaseHttpService {
  UserPasswordService(AuthClient http) : super(http);

  Future<String> createChangeRequest(String newPassword, String userId,
      String currentPassword) async {
    try {
      final resp = await http.post(
          '/user/$userId/password/change',
          body: JSON.encode(
              {
                "newPassword": newPassword,
                "userId": userId,
                "password": String
              }
          )
      );
      return extractData(resp)['id'].toString();
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Null> putEmail(String password, String userId, String key) async {
    try {
      await http.put(
          '/user/$userId/password',
          body: JSON.encode(
              {
                "password": password,
                "userId": userId,
                "key": key
              }
          )
      );
    } catch (e) {
      throw handleError(e);
    }
  }
}
