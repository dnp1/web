import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'form[dnp1-change-avatar-component]',
    templateUrl: "change_avatar_component.html",
    styleUrls: const ['../styles/form.css', 'change_avatar_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives]
)
class ChangeAvatarComponent {
}