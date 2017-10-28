import 'dart:async';
import 'package:angular/di.dart';
import 'package:danilo_info/model/email.dart';

@Injectable()
class UserEmailService {
  Future<List<Email>> ofUser(String userId) async {
    if (userId=='1') {
      return [new Email(
        '1',
        true,
        'user@danilo.info',
        new DateTime(2017, 1,1),
      )];
    }
    return const [];
  }
}