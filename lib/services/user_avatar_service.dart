import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:angular/di.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

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
      await http.put(
        urlPrefix + '/user/$userId/avatar',
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

  Future<String> readAvatarUrl(String userId) async  {
    var resp = await http.get(urlPrefix + '/user/$userId/avatar');
    var data = extractData(resp);
    if (data.containsKey("fileId")) {
      return urlPrefix + "/file/${data["fileId"]}";
    } else {
      return null;
    }
  }
}