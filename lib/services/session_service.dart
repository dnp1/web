import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/services/storage_service.dart';


@Injectable()
class SessionService {
  final StorageService _localStorage;

  SessionService(this._localStorage);

  Session _currentSession;

  int counter = 0;

  Future<Session> getCurrent() async {
    print(counter++);
    if (_currentSession == null) {
      if (_localStorage.containsKey('session')) {
        var js = JSON.decode(_localStorage['session']);
        _currentSession = new Session.fromJson(js);
      } else {
        _currentSession = new Session('anonymous', null);
        _localStorage["session"] = JSON.encode(_currentSession.toJson());
      }
    }
    return _currentSession;
  }

  Future<Null> authenticate(SignIn signIn) async {
    if (signIn.email == "user@danilo.info" &&
        signIn.password == "passworddanilo") {
      print("logger");
      _currentSession = new Session('logged', "1");
      _localStorage["session"] = JSON.encode(_currentSession.toJson());
    }
  }
}
