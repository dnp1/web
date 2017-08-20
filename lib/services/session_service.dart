import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:danilo_info/model/session.dart';

@Injectable()
class SessionService {
  Session _currentSession;


  Future<Session> getCurrentSession() async {
    if (_currentSession == null) {
      _currentSession = new Session();
    }
    return _currentSession;
  }
}