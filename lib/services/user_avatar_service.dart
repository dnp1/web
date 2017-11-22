import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:angular/di.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

@Injectable()
class UserAvatarService extends BaseHttpService {
  UserAvatarService(AuthClient http) : super(http);

  Future<Null> create(File file, String userId, String password) async {
    try {
      var formData = new FormData();
      formData.appendBlob('file', file, file.name);
      var req = await HttpRequest
          .request(
          urlPrefix + '/file',
          method: "POST",
          withCredentials: true,
          sendData: formData)
          .asStream()
          .first;
      var data = JSON.decode(req.responseText);
//      final resp = await http.post(urlPrefix + '/file', body: formData);
//      var data = extractData(resp);
      await http.put(
        '/user/$userId/avatar',
        body: JSON.encode({
          'userId': userId,
          'fileId': data['id'],
          'password': password,
        }),
      );
    } catch (e) {
      throw handleError(e);
    }
  }
}