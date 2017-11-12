import 'dart:async';
import 'dart:html' show window, Storage;
import 'package:angular/di.dart';
import 'package:collection/collection.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:http/browser_client.dart' as base;
import 'package:http/http.dart';

@Injectable()
class AuthClient extends base.BrowserClient {
  Storage _localStorage = window.localStorage;
  static const _header = 'Authorization';
  final Client _inner;

  AuthClient(this._inner) : super();

  /// Sends an HTTP request and asynchronously returns the response.
  Future<StreamedResponse> send(BaseRequest request) async {
    String token = await load();
    request.headers[_header] = token;
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
        final resp = await _inner.post("/session");
        var headers = new CanonicalizedMap.from(
            resp.headers, (String key) => key.toLowerCase());
        _localStorage[_header] = headers[_header];
        _token = headers[_header];
        loaded.add(true);
      } catch (e) {
        window.alert("shit is happening"); // TODO remove it
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
