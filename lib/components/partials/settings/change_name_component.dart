import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/settings/base_settings_form.dart';
import 'package:danilo_info/services/user_name_service.dart';

@Component(
    selector: 'div[dnp1-change-name]',
    templateUrl: "change_name_component.html",
    styleUrls: const ['../../styles/form.css', 'change_name_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives]
)
class ChangeNameComponent extends BaseSettingsForm {
  final UserNameService _userNameService;

  String givenName, familyName, password;

  ChangeNameComponent(this._userNameService);

  @override
  Future<Null> save() async {
    sending = true;
    await _userNameService.update(userId, givenName, familyName);
    dispose();
    sending = false;
  }
}