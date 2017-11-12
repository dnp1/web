import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/settings/base_settings_form.dart';
import 'package:danilo_info/services/user_password_service.dart';

@Component(
    selector: 'div[dnp1-change-password]',
    templateUrl: "change_password_component.html",
    styleUrls: const ['../../styles/form.css', 'change_password_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives]
)
class ChangePasswordComponent extends BaseSettingsForm {
  String password, passwordConfirmation, currentPassword;
  final UserPasswordService _userPasswordService;

  ChangePasswordComponent(this._userPasswordService);

  @override
  Future<Null> save() async {
    sending = true;
    await _userPasswordService.updatePassword(password, userId, currentPassword);
    dispose();
    sending = false;
  }
}