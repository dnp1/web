import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/services/storage_service.dart';


@Injectable()
class SessionService {
  final StorageService _localStorage;
  static const String _key  = "session";

  SessionService(this._localStorage);

  Session _session;


  Future<Session> getCurrent() async {
    if (_session == null) {
      if (_localStorage.containsKey(_key)) {
        var js = JSON.decode(_localStorage[_key]);
        _session = new Session.fromMap(js);
      } else {
        _session = new Session('anonymous', null);
        _localStorage[_key] = JSON.encode(_session.toMap());
      }
    }
    return _session;
  }

  Future<Null> authenticate(SignIn signIn) async {
    if (signIn.email == "user@danilo.info" &&
        signIn.password == "passworddanilo") {
      _session = new Session('logged', "1");
      _localStorage[_key] = JSON.encode(_session.toMap());
    }
  }

  Future<Null> clear() async {
    _localStorage.remove(_key);
    _session.invalidate();
  }
}
