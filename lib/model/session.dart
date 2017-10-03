import 'package:danilo_info/model/user.dart';

class Session {
  String _id;

  String get id {
    return _id;
  }
  String _userId;
  String get userId {
   return _userId;
  }

  Session(_id, _userId);

  bool anonymous() {
    return _userId == null;
  }
}
