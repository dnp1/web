import 'dart:async';
import 'dart:html' show window, Storage;
import 'dart:io';
import 'package:angular/di.dart';
import 'package:http/browser_client.dart' as base;
import 'package:http/http.dart';
import 'package:cookie/cookie.dart' as cookie;

@Injectable()
class AuthClient extends base.BrowserClient {
  final String urlPrefix = 'http://danilo.local:3000';
  final tokenName = 'Authorization';
  final Client _inner;

  AuthClient(this._inner) : super() {
    withCredentials = true;
  }

  /// Sends an HTTP request and asynchronously returns the response.
  Future<StreamedResponse> send(BaseRequest request) async {
    await load();
    var resp = await super.send(request);
    return resp;
  }

  bool _loaded = false;

  bool _loading = false;
  final StreamController loaded = new StreamController.broadcast();


  bool _hasToken() {
    return cookie.get(tokenName) != null;
  }

  Future<Null> load() async {
    if (_loading) {
      await loaded.stream.first;
    }
    if (_loaded == false) {
      _loading = true;
      if (_hasToken()) {
        var resp = await _inner.get(urlPrefix + "/session");
        if (resp.statusCode == HttpStatus.OK) {
          _loaded = true;
          _loading = false;
          loaded.add(true);
        }
      }
      try {
        final resp = await _inner.post(urlPrefix + "/session");
        if (resp.statusCode == HttpStatus.OK) {
          _loaded = true;
        } else {
          _loaded = false;
        }
      } catch (e) {
        window.alert("shit is happening"); // TODO remove it
      } finally {
        _loading = false;
        loaded.add(true);
      }
    }
  }

  void clearToken() {
    _loaded = null;
    cookie.remove(tokenName);
  }
}
