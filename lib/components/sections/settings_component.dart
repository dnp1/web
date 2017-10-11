import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

//
//@Component(
//  selector: 'div[dnp1-form-logout',
//  template: '<form (ngSubmit)',
//)
//class LogoutFormComponent {
//
//}

@Component(
    selector: 'section',
    templateUrl: "settings_component.html",
    styleUrls: const ['../styles/form.css', 'settings_component.css'],
    directives: const [
      CORE_DIRECTIVES, ROUTER_DIRECTIVES, formDirectives
    ]
)
class SettingsComponent {

}