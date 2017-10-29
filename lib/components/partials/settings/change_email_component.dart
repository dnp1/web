import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/settings/base_settings_form.dart';
import 'package:danilo_info/services/user_email_service.dart';

@Component(
    selector: 'div[dnp1-change-email]',
    templateUrl: "change_email_component.html",
    styleUrls: const ['../../styles/form.css', 'change_email_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives]
)
class ChangeEmailComponent extends BaseSettingsForm {
  final UserEmailService _userEmailService;
  String email, emailConfirmation, password;

  ChangeEmailComponent(this._userEmailService);

  @override
  Future<Null> save() async {
    sending = true;
    await _userEmailService.update(email, emailConfirmation, password);
    dispose();
    sending = false;
  }
}