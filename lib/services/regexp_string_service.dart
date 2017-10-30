import 'package:angular/di.dart';

@Injectable()
class RegexpService {
  //TODO: It should be used, but we're waiting for fix in "minLength"
  String get emailRegexpString => '''/^[a-zA-Z0-9.!#\$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\$/''';
}