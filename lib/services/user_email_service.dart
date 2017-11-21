import 'dart:async';
import 'dart:convert';
import 'package:angular/di.dart';
import 'package:danilo_info/model/email.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

@Injectable()
class UserEmailService extends BaseHttpService {
  UserEmailService(AuthClient http) : super(http);

  Future<Email> read(String userId) async {
    final resp = await http.get(urlPrefix + '/user/$userId/email');
    return new Email.fromJson(extractData(resp));
  }

  Future<String> createChangeRequest(String email, String userId,
      String password) async {
    try {
      final resp = await http.post(
          '/user/$userId/email/change',
          body: JSON.encode(
              {
                "email": email,
                "userId": userId,
                "password": password
              }
          )
      );
      return extractData(resp)['id'];
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Null> setEmail(String email, String userId, String key) async {
    try {
      await http.put(
          '/user/$userId/email',
          body: JSON.encode(
              {
                "email": email,
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