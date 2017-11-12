import 'dart:async';
import 'dart:html';
import 'package:angular/di.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:http/browser_client.dart'  as base;
import 'package:http/http.dart';

@Injectable()
class AuthClient extends base.BrowserClient {
  String _baseUrl = "http://localhost:3000";
  Storage _localStorage = window.localStorage;
  static const _header = 'Authorization';

  AuthClient() : super();
  /// Sends an HTTP request and asynchronously returns the response.
  Future<StreamedResponse> send(BaseRequest request) async {
    String token = await load();
    request.headers[_header] = token;
    var url = request.url;
    print(url);
    var resp = await super.send(request);
    if (resp.headers.containsKey(_header)) {
      setAuthHeader(resp.headers[_header]);
    }
    return resp;
  }

  String _token;

  bool _loading = false;
  final StreamController loaded = new StreamController.broadcast();

  Future<String> load() async {
    if (_loading) {
      await loaded.stream.first;
    }
    if (_token == null) {
      try {
        _loading = true;
        final resp = await post(_baseUrl + "/session");
        _localStorage[_header] = resp.headers[_header];
        loaded.add(loaded);
      } catch(e) {
        window.alert("shit is happening");
      } finally {
        _loading = false;
      }
    }
    return _token;
  }

  Future<Null> setAuthHeader(String token) async {
    if (_loading) {
      await loaded.stream.first;
    }
    _token = token;
    _localStorage[_header] = _token;
  }
}
