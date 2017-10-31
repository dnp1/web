import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/services/storage_service.dart';
import 'package:danilo_info/util/auth_client.dart';
import 'package:http/http.dart';

enum AuthenticationReturn {
  Authenticated,
  InvalidCredentials,
  CaptchaNeededInvalidCredentials,
  BlockedDeTooManyInvalidCredentials,
}

@Injectable()
class SessionService extends BaseHttpService {
  final StorageService _localStorage;
  static const String _key = "session";
  final Client _anonymousClient;

  SessionService(this._localStorage, this._anonymousClient,
      AuthClient authClient) : super(authClient);
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
        final resp = await _anonymousClient.post("/session");
        _localStorage[_key] = JSON.encode(extractData(resp));
        _session = new Session.fromMap(JSON.decode(_localStorage[_key]));
        loaded.add(loaded);
      } catch(e) {
        throw handleError(e);
      } finally {
        _loading = false;
      }
    }
    return _session;
  }

  Future<Null> authenticate(SignIn signIn) async {
    try {
      final resp = await http.post('/session', body: JSON.encode(signIn));
      var data = extractData(resp);
      _session = new Session.fromMap(data);
      _localStorage[_key] = JSON.encode(_session.toMap());
    } catch (e) {
      handleError(e);
    }
  }

  Future<Null> clear() async {
    _localStorage.remove(_key);
    _session = null;
    load();
  }
}
