import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/profile.dart';

@Injectable()
class ProfileService {
    final Map<String, Profile> _users = {
      '1': new Profile('1', 'Danilo', 'Pereira', null)
    };

    Future<Profile> get(String id) async {
      return _users[id];
    }

    Future<int> passwordMinLength() async =>  12;
}
