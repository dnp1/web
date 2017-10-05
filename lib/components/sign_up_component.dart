import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/components/captcha_component.dart';
import 'package:danilo_info/model/sign_up.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/services/user_service.dart';

@Component(
  selector: 'dnp1-sign-up',
  templateUrl: "sign_up_component.html",
  styleUrls: const ['sign_up_component.css'],
  directives: const [CORE_DIRECTIVES, formDirectives, CaptchaComponent]
)
class SignUpComponent implements OnInit {
  SignUp signUp;
  Captcha captcha;
  bool sending;

  final UserService _userService;

  SignUpComponent(this._userService);

  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      await (new Future.delayed(const Duration(seconds: 6), () => print("foi")));

      sending = false;
    }
  }

  @override
  Future<Null> ngOnInit() async {
    signUp = new SignUp(await _userService.passwordMinLength());
    captcha = new Captcha('/wcz', '12');
  }
}
