class Session {
  bool _valid = false;

  bool get valid {
    return _valid;
  }

  String userId;


  Session._();

  static final Session instance = new Session._();

  factory Session(userId) {
    instance
      ..userId = userId
      .._valid = true;
    return instance;
  }

  void invalidate() {
    _valid = false;
  }


  bool anonymous() {
    return userId == null;
  }


  factory Session.fromMap(Map<String, dynamic> js) {
    var userId = js['userId'];
    return new Session(userId);
  }
}

