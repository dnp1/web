class SignUp {
  String givenName;
  String familyName;
  String email;
  String emailConfirmation;
  String password;
  String passwordConfirmation;

  SignUp();

  toJson() {
    return {
      'givenName': givenName,
      'familyName': familyName,
      'email': email,
      'password': password,
    };
  }
}
