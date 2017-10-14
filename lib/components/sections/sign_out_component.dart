import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/title_service.dart';


@Component(
    selector: 'section',
    templateUrl: "sign_out_component.html",
    styleUrls: const ['../styles/form.css'],
    directives: const [
      CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives
    ]
)
class SignOutComponent extends BaseRouteComponent {

  final SessionService _sessionService;
  final Location _location;

  SignOutComponent(this._sessionService,
      this._location,
      TitleService titleService,
      RouteData data,
      Router router) : super(titleService, data, router);

  Future<Null> onSubmit() async {
    await _sessionService.clear();
    _location.back();
  }

  Future<bool> allowed() async =>
      (await _sessionService.load()).anonymous() == false;
}