import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:danilo_info/model/sign_up.dart';

@Component(
  selector: 'dnp1-sign-up',
  templateUrl: "sign_up_component.html",
  styleUrls: const ['sign_up_component.css', "styles/dnp1_page.css"],
  directives: const [COMMON_DIRECTIVES]
)
class SignUpComponent {
  SignUp signUp = new SignUp();
  bool sending;

  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      await (new Future.delayed(const Duration(seconds: 6), () => print("foi")));
      sending = false;
    }
  }
}
