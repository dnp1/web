import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/components/base/BaseFormComponent.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/captcha_component.dart';
import 'package:danilo_info/services/regexp_string_service.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/user_service.dart';

@Component(
    selector: 'dnp1-sign-in',
    templateUrl: "sign_in_component.html",
    styleUrls: const ['styles/form.css', 'sign_in_component.css'],
    directives: const [
      CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives, CaptchaComponent]
)
class SignInComponent extends BaseFormComponent implements OnInit {
  SignIn login;
  Captcha captcha;
  bool sending;

  final SessionService _sessionService;
  final UserService _userService;
  final RegexpService _regexpService;

  SignInComponent(this._sessionService, this._userService, this._regexpService);


  Future<Null> onSubmit() async {
    if (!sending) {
      sending = true;
      var duration = const Duration(seconds: 6);
      _sessionService.authenticate(login);
      var future = new Future.delayed(duration, () => print("foi"));
      await (future);
      captcha = new Captcha('1', '/invlaid');
      sending = false;
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
