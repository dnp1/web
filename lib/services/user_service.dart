import 'dart:async';
import 'dart:convert';
import 'package:angular/di.dart';
import 'package:danilo_info/model/sign_up.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

@Injectable()
class UserService extends BaseHttpService {
  UserService(AuthClient http) : super(http);

  Future<Null> create(SignUp model) async {
    try {
      http.post('/user', body: JSON.encode(model));
    } catch(e) {
      throw handleError(e);
    }
  }
}