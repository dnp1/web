import 'dart:async';
import 'dart:convert';
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
  directives: const [CORE_DIRECTIVES, formDirectives, UserAvatarComponent],
)
class ChangeAvatarComponent extends BaseSettingsForm {
  File file;
  String imgSrc = null;
  File smallFile; // 2x2
  File mediumFile; // 8x8
  String password;

  get base64 => null;

  Future<Null> setFile(FileUploadInputElement fileInput) async {
    File file = fileInput.files[0];
    ImageElement img = document.createElement("img");
    var reader = new FileReader();
    reader.readAsDataUrl(file);
    await reader.onLoadEnd.first;
    img.src = reader.result;
    await img.onLoad.first;
    CanvasElement canvas = document.createElement('canvas');
    CanvasRenderingContext2D ctx = canvas.getContext("2d");
    ctx.drawImage(img, 0, 0);

    final MAX_WIDTH = 128.0;
    final MAX_HEIGHT = 128.0;
    double width = img.width.toDouble();
    double height = img.height.toDouble();
    print(width);
    print(height);

    if (width > height) {
      if (width > MAX_WIDTH) {
        height *= MAX_WIDTH / width;
        width = MAX_WIDTH;
      }
    } else {
      if (height > MAX_HEIGHT) {
        width *= MAX_HEIGHT / height;
        height = MAX_HEIGHT;
      }
    }
    canvas.width = width.toInt();
    canvas.height = height.toInt();
    print(width);
    print(height);
    ctx = canvas.getContext("2d");
    ctx.drawImageScaled(img, 0, 0, width, height);

    var dataurl = canvas.toDataUrl("image/png", .7);
    imgSrc = dataurl;
    // final str2 = UTF8.encode(dataurl); missing cropoff mime
//    var blob = new File(str2, 'image/png');
//    print(blob);
  }


  @override
  Future<Null> save() async {
//  print(file);
  }
}