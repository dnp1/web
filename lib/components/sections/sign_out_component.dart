import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/services/session_service.dart';


@Component(
    selector: 'section',
    templateUrl: "sign_out_component.html",
    styleUrls: const ['../styles/form.css'],
    directives: const [
      CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives
    ]
)
class SignOutComponent {

  final SessionService _sessionService;
  SignOutComponent(this._sessionService);
  
  void onSubmit() {
    _sessionService.clear();
  }

}