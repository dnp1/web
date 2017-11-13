import 'package:danilo_info/util/json_encodable_datetime.dart';

class Email {
  String address;

  Email(this.address);

  Email.fromJson(Map<String, dynamic> data) {
    address = data['address'];
  }
}