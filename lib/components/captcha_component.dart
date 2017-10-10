import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/model/captcha.dart';

@Component(
  selector: 'div[dnp1-component-captcha]',
  templateUrl: "captcha_component.html",
  styleUrls: const ['captcha_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives]
)
class CaptchaComponent {
  @Input()
  Captcha captcha;
}
