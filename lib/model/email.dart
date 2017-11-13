class Email {
  String address;

  Email(this.address);

  Email.fromJson(Map<String, dynamic> data) {
    address = data['address'];
  }
}