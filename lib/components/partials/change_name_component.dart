import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/base_settings_form.dart';

@Component(
    selector: 'form[dnp1-change-name]',
    templateUrl: "change_name_component.html",
    styleUrls: const ['../styles/form.css', 'change_name_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives]
)
class ChangeNameComponent extends BaseSettingsForm {
}