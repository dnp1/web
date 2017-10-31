import 'package:danilo_info/util/json_encodable_datetime.dart';

class Email {
  String address;
  JsonEncodableDatetime registrationDate;

  Email(this.address);

  Email.fromJson(Map<String, dynamic> data) {
    address = data['address'];
    registrationDate =
    new JsonEncodableDatetime.fromJson(data['registrationDatetime']);
  }
}