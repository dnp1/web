enum PersonNamePart {
  first,
  last,
  full
}

class User {
  String id;
  String firstName;
  String lastName;
  String avatarId;

  User(this.id, this.firstName, this.lastName, this.avatarId);

  String getName(PersonNamePart part) {
    switch(part) {
      case PersonNamePart.first:
        return firstName;
      case PersonNamePart.last:
          return lastName;
      break;
      case PersonNamePart.full:
      default:
        return firstName + " " + lastName;
    }
  }
}
