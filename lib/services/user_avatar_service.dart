import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular/di.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

@Injectable()
class UserAvatarService extends BaseHttpService {
  UserAvatarService(AuthClient http) : super(http);

  Future<Null> create(String value, String filename, String contentType, String userId, String password) async {
    try {
      var uri = Uri.parse(urlPrefix + "/file");
      var request = new MultipartRequest("POST", uri);
      var _type = new MediaType.parse(contentType);
      request.files.add(new MultipartFile.fromString("file", value, filename: filename, contentType: _type));

      var send = await http.send(request);
      window.alert("dshada");
//      final resp = await http.post(urlPrefix + '/file', body: formData);
      final resp = await send.stream.first;
      var data = JSON.decode(UTF8.decode(resp));
      await http.put(
        '/user/$userId/avatar',
        body: JSON.encode({
          'userId': userId,
          'fileId': data['id'],
          'password': password,
        }),
      );
    } catch(e) {
      throw handleError(e);
    }
  }
}