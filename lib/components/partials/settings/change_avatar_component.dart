import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/common/user_avatar_component.dart';
import 'package:danilo_info/components/partials/settings/base_settings_form.dart';
import 'package:danilo_info/services/user_avatar_service.dart';
import 'package:danilo_info/util/image_editor.dart';

@Component(
  selector: 'div[dnp1-change-avatar]',
  templateUrl: "change_avatar_component.html",
  styleUrls: const ['../../styles/form.css', 'change_avatar_component.css'],
  directives: const [CORE_DIRECTIVES, formDirectives, UserAvatarComponent],
)
class ChangeAvatarComponent extends BaseSettingsForm {
  final ImageService _imageService;
  final UserAvatarService _userAvatarService;
  ChangeAvatarComponent(this._imageService, this._userAvatarService);

  File file;
  String imgSrc = null;
  String password = null;

  get base64 => null;

  Future<Null> setFile(FileUploadInputElement fileInput) async {
    var files = fileInput.files;
    if (files.length > 0) {
      File _file = files[0];
      file = await _imageService.resizeImageFile(_file, 128, 128, true);
      imgSrc = await _imageService.dataURIFromFile(file);
    }
  }

  Future<Null> setFileToNull() async {
    file = null;
    imgSrc = null;
  }

  @override
  Future<Null> save() async {
    sending = true;
    await _userAvatarService.create(file, userId, password);
    sending = false;
    dispose();
  }
}