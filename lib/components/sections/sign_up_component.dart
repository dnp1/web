import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:angular_router/src/instruction.dart';
import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/partials/captcha_component.dart';
import 'package:danilo_info/model/sign_up.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/services/title_service.dart';
import 'package:danilo_info/services/user_service.dart';

@Component(
    selector: 'section',
    templateUrl: "sign_up_component.html",
    styleUrls: const ['../styles/form.css', 'sign_up_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives, CaptchaComponent]
)
class SignUpComponent extends BaseRouteComponent implements OnInit {
  SignUp signUp;
  Captcha captcha;
  bool sending;

  final UserService _userService;

  SignUpComponent(this._userService, TitleService titleService, RouteData data)
      : super(titleService, data);

  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      await (new Future.delayed(const Duration(seconds: 6), () => 1));

      sending = false;
    }
  }

  @override
  Future<Null> ngOnInit() async {
    signUp = new SignUp(await _userService.passwordMinLength());
    captcha = new Captcha('/wcz', '12');
  }
}
