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

  Session(this._id, this._userId);

  bool anonymous() {
    return _userId == null;
  }

  Map<String, dynamic> toJson() => {'id': id, 'userId': userId};

  Session.fromJson(Map<String, dynamic> js) {
    _id = js['id'];
    _userId = js['userId'];
  }

}

