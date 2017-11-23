import 'dart:async';
import 'dart:convert';
import 'package:angular/di.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

@Injectable()
class UserPasswordService extends BaseHttpService {
  UserPasswordService(AuthClient http) : super(http);

  Future<Null> updatePassword(String newPassword, String userId,
      String currentPassword) async {
    try {
      await http.put(
          urlPrefix + '/user/$userId/password',
          body: JSON.encode(
              {
                "newPassword": newPassword,
                "password": currentPassword
              }
          )
      );
    } catch (e) {
      throw handleError(e);
    }
  }
}
