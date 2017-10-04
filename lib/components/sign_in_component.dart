import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/captcha_component.dart';

@Component(
  selector: 'dnp1-sign-in',
  templateUrl: "sign_in_component.html",
  styleUrls: const ['sign_in_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives, CaptchaComponent]
)
class SignInComponent {
  SignIn login = new SignIn();
  Captcha captcha;
  bool sending;

  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      await (new Future.delayed(const Duration(seconds: 6), () => print("foi")));
      captcha = new Captcha('1', '/invlaid');
      sending = false;
    }
  }
}
