import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/common/user_avatar_component.dart';
import 'package:danilo_info/components/partials/settings/base_settings_form.dart';

@Component(
    selector: 'div[dnp1-change-avatar]',
    templateUrl: "change_avatar_component.html",
    styleUrls: const ['../../styles/form.css', 'change_avatar_component.css'],
    directives: const [CORE_DIRECTIVES, formDirectives, UserAvatarComponent]
)
class ChangeAvatarComponent extends BaseSettingsForm {
  File file;

  void setFile(FileUploadInputElement fileInput) => file = (fileInput.files[0]);

  @override
  Future<Null> save() async {
    print(file);
  }
}