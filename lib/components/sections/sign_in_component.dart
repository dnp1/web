import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/base/form_helper.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/partials/captcha_component.dart';
import 'package:danilo_info/services/regexp_string_service.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/title_service.dart';
import 'package:danilo_info/services/user_service.dart';

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
  bool sending;
  Map<String, bool> controlStateClasses(NgControl control) => FormHelper.controlStateClasses(control);

  final SessionService _sessionService;
  final UserService _userService;
  final RegexpService _regexpService;
  final Location _location;

  SignInComponent(this._sessionService, this._userService, this._regexpService, this._location, TitleService titleService, RouteData data) : super(titleService, data);


  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      _sessionService.authenticate(login);
      sending = false;
      _location.back();
    }
  }

  int _passwordMinLength;
  int get passwordMinLength =>  _passwordMinLength;


  String _emailRegexpString;
  String get emailRegexpString => _emailRegexpString;

  @override
  Future<Null> ngOnInit() async {
    _passwordMinLength = await _userService.passwordMinLength();
    _emailRegexpString = _regexpService.emailRegexpString;
    login = new SignIn();
  }
}
