import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/captcha_component.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/user_service.dart';

@Component(
    selector: 'dnp1-sign-in',
    templateUrl: "sign_in_component.html",
    styleUrls: const ['sign_in_component.css'],
    directives: const [
      CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives, CaptchaComponent]
)
class SignInComponent implements OnInit {
  SignIn login;
  Captcha captcha;
  bool sending;

  final SessionService _sessionService;
  final UserService _userService;

  SignInComponent(this._sessionService, this._userService);


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

  @override
  Future<Null> ngOnInit() async {
    var passwordMinLength = await _userService.passwordMinLength();
    login = new SignIn(passwordMinLength);
  }
}
