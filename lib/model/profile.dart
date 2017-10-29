enum PersonNamePart {
  first,
  last,
  full
}

class UserName {
  String userId;
  String givenName;
  String familyName;

  UserName(this.userId, this.givenName, this.familyName);

  String getName(PersonNamePart part) {
    switch(part) {
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
