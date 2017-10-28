import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/common/user_avatar_component.dart';
import 'package:danilo_info/components/partials/settings/base_settings_form.dart';
import 'package:danilo_info/util/image_editor.dart';

@Component(
  selector: 'div[dnp1-change-avatar]',
  templateUrl: "change_avatar_component.html",
  styleUrls: const ['../../styles/form.css', 'change_avatar_component.css'],
  directives: const [CORE_DIRECTIVES, formDirectives, UserAvatarComponent],
)
class ChangeAvatarComponent extends BaseSettingsForm {
  ImageEditor _imageEditor;
  ChangeAvatarComponent(this._imageEditor);

  File file;
  String imgSrc = null;
  File smallFile; // 2x2
  File mediumFile; // 8x8
  String password;

  get base64 => null;

  Future<Null> setFile(FileUploadInputElement fileInput) async {
    File file = fileInput.files[0];
    file = await _imageEditor.resizeImageFile(file, 128, 128, true);
    imgSrc = await _imageEditor.dataURIFromFile(file);
  }


  @override
  Future<Null> save() async {
//  print(file);
  }
}