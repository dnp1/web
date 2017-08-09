import 'dart:async';
import 'package:angular2/angular2.dart';

import 'package:danilo_info/model/user.dart';

@Injectable()
class UserService {
    final Map<String, User> _users = {
      '1': new User('1', 'Viviane', 'Almeida', null)
    };

    Future<User> get(String id) async {
      return _users[id];
    }
}
