import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/model/sign_up.dart';

@Component(
  selector: 'dnp1-sign-up',
  templateUrl: "sign_up_component.html",
  styleUrls: const ['sign_up_component.css', "styles/dnp1_page.css"],
  directives: const [CORE_DIRECTIVES, formDirectives]
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
