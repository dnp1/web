import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/model/captcha.dart';
import 'package:danilo_info/components/partials/captcha_component.dart';
import 'package:danilo_info/services/title_service.dart';

@Component(
  selector: 'section',
  templateUrl: "password_reset_component.html",
  styleUrls: const ['../styles/form.css', 'password_reset_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives, CaptchaComponent]
)
class PasswordResetComponent extends  BaseRouteComponent implements OnInit {
  String email;
  Captcha captcha;
  bool sending;

  PasswordResetComponent(TitleService titleService, RouteData data) : super(titleService, data);

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
