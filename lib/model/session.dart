class Session {
  bool _valid = false;

  bool get valid {
    return _valid;
  }

  String _id;

  String get id {
    return _id;
  }

  String _userId;

  String get userId {
    return _userId;
  }

  Session._();

  static final Session instance = new Session._();

  factory Session(id, userId) {
    instance
      .._userId = userId
      .._id = id
      .._valid = true;
    return instance;
  }

  void invalidate() {
    _valid = false;
  }


  bool anonymous() {
    return _userId == null;
  }

  Map<String, dynamic> toMap() => {'id': id, 'userId': userId};

  factory Session.fromMap(Map<String, dynamic> js) {
    var id = js['id'];
    var userId = js['userId'];
    return new Session(id, userId);
  }
  
}

