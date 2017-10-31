enum PersonNamePart {
  first,
  last,
  full
}

class UserName {
  static Map<String, UserName> _cache = new Map<String, UserName>();

  String userId;
  String givenName;
  String familyName;


  void _setFromJson(Map<String, dynamic> data) {
    userId = data['userId'];
    givenName = data['givenName'];
    familyName = data['familyName'];
  }

  UserName.fromJson(Map<String, dynamic> data) {
    _setFromJson(data);
  }

  factory UserName.cachedFromJson(Map<String, dynamic> data) {
    String id = data['userId'];
    var userName =  _cache.putIfAbsent(id, () => new UserName.fromJson(data));
    return userName;
  }


  String getName(PersonNamePart part) {
    switch (part) {
      case PersonNamePart.first:
        return givenName;
      case PersonNamePart.last:
        return familyName;
        break;
      case PersonNamePart.full:
      default:
        return givenName + " " + familyName;
    }
  }
}
