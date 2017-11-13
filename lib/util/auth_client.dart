import 'dart:async';
import 'dart:html' show window, Storage;
import 'dart:io';
import 'package:angular/di.dart';
import 'package:collection/collection.dart';
import 'package:http/browser_client.dart' as base;
import 'package:http/http.dart';

@Injectable()
class AuthClient extends base.BrowserClient {
  Storage _localStorage = window.localStorage;
  static const header = 'authorization';
  final Client _inner;

  AuthClient(this._inner) : super();

  /// Sends an HTTP request and asynchronously returns the response.
  Future<StreamedResponse> send(BaseRequest request) async {
    String token = await load();
    request.headers[header] = token;
    var resp = await super.send(request);
    var headers = new CanonicalizedMap.from(
        resp.headers, (String key) => key.toLowerCase());
    if (headers.containsKey(header)) {
      String token = headers[header];
      _token = token;
      _localStorage[header] = token;
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
      _loading = true;
      if (_localStorage.containsKey(header)) {
        var tk =  _localStorage[header];
        var resp = await _inner.get("/session", headers: {header:tk});
        if (resp.statusCode == HttpStatus.OK) {
          _token = tk;
          _loading = false;
          loaded.add(true);
          return _token;
        }
      }
      try {
        final resp = await _inner.post("/session");
        var headers = new CanonicalizedMap.from(
            resp.headers, (String key) => key.toLowerCase());
        _localStorage[header] = headers[header];
        _token = headers[header];
      } catch (e) {
        window.alert("shit is happening"); // TODO remove it
      } finally {
        _loading = false;
        loaded.add(true);
      }
    }
    return _token;
  }

  void clearToken() {
    _token = null;
    _localStorage.remove(header);
  }
}
