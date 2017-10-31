import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/profile.dart';

@Injectable()
class UserNameService {
    final Map<String, UserName> _users = {
      '1': new UserName('1', 'Danilo', 'Pereira')
    };

    Future<UserName> get(String id) async {
      return _users[id];
    }

    Future<Null> update(String userId, String givenName, String familyName) async {

    }
}
