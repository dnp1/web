import 'dart:async';
import 'package:angular/angular.dart';
import 'package:danilo_info/model/session.dart';

@Injectable()
class SessionService {
  Session _currentSession;
  Future<Session> getCurrent() async {
    if (_currentSession == null) {
      _currentSession = new Session('anonymous', null);
    }
    return _currentSession;
  }

  Future<Null> authenticate(String username, password) async {
    if (username == "user" && password == "password") {
      _currentSession = new Session('logged', "1");
    }
  }
}
