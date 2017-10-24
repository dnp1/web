import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'form[dnp1-change-email-component]',
    templateUrl: "change_email_component.html",
    styleUrls: const ['../styles/form.css', 'change_email_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives]
)
class ChangeEmailComponent {
}