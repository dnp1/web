import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:danilo_info/model/login.dart';

@Component(
  selector: 'dnp1-login',
  templateUrl: "login_component.html",
  styleUrls: const ['login_component.css', "styles/dnp1_page.css"],
  directives: const [COMMON_DIRECTIVES]
)
class LoginComponent {
  Login login = new Login();
  bool sending;

  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      print('teste');
      login.email += 'e';
      await (new Future.delayed(const Duration(seconds: 6), () => print("foi")));
      sending = false;
    }
  }
}
