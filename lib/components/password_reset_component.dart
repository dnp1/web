import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/captcha_component.dart';

@Component(
  selector: 'dnp1-password-reset',
  templateUrl: "password_reset_component.html",
  styleUrls: const ['styles/form.css', 'password_reset_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives, CaptchaComponent]
)
class PasswordResetComponent implements OnInit {
  String email;
  Captcha captcha;
  bool sending;

  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      await (new Future.delayed(const Duration(seconds: 6), () => 1));
      captcha = new Captcha('1', '/invlaid');
      sending = false;
    }
  }

  Future<Null> ngOnInit() async {
    captcha = new Captcha("rr", "1");
  }
}
