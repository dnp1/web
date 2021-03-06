import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/base/form_helper.dart';
import 'package:danilo_info/model/sign_in.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/partials/common/captcha_component.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/title_service.dart';

@Component(
    selector: 'section',
    templateUrl: "sign_in_component.html",
    styleUrls: const ['../styles/form.css', 'sign_in_component.css'],
    directives: const [
      CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives, CaptchaComponent]
)
class SignInComponent extends BaseRouteComponent {
  SignIn login = new SignIn();
  Captcha captcha;
  bool sending = false;
  bool invalid = false;

  Map<String, bool> controlStateClasses(NgControl control) =>
      FormHelper.controlStateClasses(control);

  final SessionService _sessionService;
  final Location _location;

  SignInComponent(this._sessionService,
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
      try {
        await _sessionService.authenticate(login);
        _location.back();
      } on InvalidCredentials catch(_) {
        invalid = true;
      }
      sending = false;
    }
  }
}
