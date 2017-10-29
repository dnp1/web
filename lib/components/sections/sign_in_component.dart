import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/base/form_helper.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/partials/common/captcha_component.dart';
import 'package:danilo_info/services/regexp_string_service.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/title_service.dart';
import 'package:danilo_info/services/user_profile_service.dart';

@Component(
    selector: 'section',
    templateUrl: "sign_in_component.html",
    styleUrls: const ['../styles/form.css', 'sign_in_component.css'],
    directives: const [
      CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives, CaptchaComponent]
)
class SignInComponent extends BaseRouteComponent implements OnInit {
  SignIn login;
  Captcha captcha;
  bool sending = false;
  bool invalid = false;

  Map<String, bool> controlStateClasses(NgControl control) =>
      FormHelper.controlStateClasses(control);

  final SessionService _sessionService;
  final UserNameService _userService;
  final RegexpService _regexpService;
  final Location _location;

  SignInComponent(this._sessionService,
      this._userService,
      this._regexpService,
      this._location,
      TitleService titleService,
      RouteData data,
      Router router)
      : super(titleService, data, router);

  Future<bool> allowed() async =>
      (await _sessionService.load()).anonymous();


  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      var result = await _sessionService.authenticate(login);
      if (result == AuthenticationReturn.Authenticated) {
        _location.back();
        return;
      } else if (result == AuthenticationReturn.CaptchaNeededInvalidCredentials) {
        captcha = new Captcha("sadas", "dsadz");
      }

      invalid = true;
      sending = false;
    }
  }

  int _passwordMinLength;

  int get passwordMinLength => _passwordMinLength;


  String _emailRegexpString;

  String get emailRegexpString => _emailRegexpString;

  @override
  Future<Null> ngOnInit() async {
    _passwordMinLength = await _userService.passwordMinLength();
    _emailRegexpString = _regexpService.emailRegexpString;
    login = new SignIn();
  }
}
