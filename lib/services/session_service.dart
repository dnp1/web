import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';
import "dart:io" show  HttpStatus;

enum AuthenticationReturn {
  Authenticated,
  InvalidCredentials,
  CaptchaNeededInvalidCredentials,
  BlockedDeTooManyInvalidCredentials,
}

class InvalidCredentials implements Exception {

}

@Injectable()
class SessionService extends BaseHttpService {
  SessionService(AuthClient authClient) : super(authClient);
  Session _session;

  bool _loading = false;
  final StreamController loaded = new StreamController.broadcast();

  Future<Session> load() async {
    if (_loading) {
      await loaded.stream.first;
    }
    if (_session == null) {
      try {
        _loading = true;
        _session =  new Session.fromMap(extractData(await http.get("/session")));
      } catch(e) {
        throw handleError(e);
      } finally {
        _loading = false;
        loaded.add(true);
      }
    }
    return _session;
  }

  Future<Null> authenticate(SignIn signIn) async {
      final resp = await http.post('/authenticate', body: JSON.encode(signIn.toJson()));
      switch (resp.statusCode) {
        case HttpStatus.OK:
          var data = extractData(resp);
          _session = new Session.fromMap(data);
        break;
        case HttpStatus.UNAUTHORIZED:
          throw new InvalidCredentials();
        break;
        default:
          throw new Exception();
      }
  }

  Future<Null> clear() async {
    _session = null;
    http.clearToken();
    load();
  }
}
