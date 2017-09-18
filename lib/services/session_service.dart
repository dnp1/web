import 'dart:async';
import 'package:angular/angular.dart';
import 'package:danilo_info/model/session.dart';

@Injectable()
class SessionService {
  Session _currentSession;
  Future<Session> getCurrent() async {
    if (_currentSession == null) {
      _currentSession = new Session();
    }
    return _currentSession;
  }

  Future<Null> setCurrent(String username, password) async {
    if (username == "user" && password == "password") {
      _currentSession = new Session();
    }
  }
}
