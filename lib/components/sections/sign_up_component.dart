import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:angular_router/angular_router.dart';
import 'package:angular_router/src/instruction.dart';
import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/base/form_helper.dart';
import 'package:danilo_info/components/partials/common/captcha_component.dart';
import 'package:danilo_info/model/sign_up.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/services/session_service.dart';
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

  Map<String, bool> controlStateClasses(NgControl control) =>
      FormHelper.controlStateClasses(control);

  final UserService _userService;
  final SessionService _sessionService;

  SignUpComponent(this._userService,
      this._sessionService,
      TitleService titleService,
      RouteData data,
      Router router) : super(titleService, data, router);

  Future<Null> save() async {
    if (!sending) {
      sending = true;
      try {
        await _userService.create(signUp);
      } catch (e) {
        // TODO:deal with error
      }
      sending = false;
    }
  }

  @override
  Future<Null> ngOnInit() async {
    signUp = new SignUp();
    captcha = new Captcha('/wcz', '12');
  }

  Future<bool> allowed() async =>
      (await _sessionService.load()).anonymous();
}
