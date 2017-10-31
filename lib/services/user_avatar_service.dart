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
      final resp = await http.post('/file', body: formData);
      var data = extractData(resp);
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