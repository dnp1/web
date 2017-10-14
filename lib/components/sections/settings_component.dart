import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/model/sign_up.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/title_service.dart';


@Component(
    selector: 'section',
    templateUrl: "settings_component.html",
    styleUrls: const ['../styles/form.css', 'settings_component.css'],
    directives: const [
      CORE_DIRECTIVES,
      ROUTER_DIRECTIVES,
      formDirectives
    ],
    preserveWhitespace: false,
)
class SettingsComponent extends BaseRouteComponent {
  final SessionService _sessionService;

  SignUp signUp = new SignUp(12);

  SettingsComponent(SessionService this._sessionService,
      TitleService titleService,
      RouteData data,
      Router router)
      : super(titleService, data, router);

  Future<bool> allowed() async =>
      (await _sessionService.load()).anonymous() == false;

  onSubmit() => null;
}