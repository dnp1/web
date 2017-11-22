import 'dart:async';
import 'dart:html' show window, Storage;
import 'dart:io';
import 'package:angular/di.dart';
import 'package:http/browser_client.dart' as base;
import 'package:http/http.dart';

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
    var resp = await _inner.send(request);
    return resp;
  }

  bool _loaded = false;

  bool _loading = false;
  final StreamController loaded = new StreamController.broadcast();

  Future<Null> load() async {
    if (_loading) {
      await loaded.stream.first;
    }
    if (_loaded == false) {
      _loading = true;
      var resp = await _inner.get(urlPrefix + "/session");
      if (resp.statusCode == HttpStatus.OK) {
        _loaded = true;
        _loading = false;
        loaded.add(true);
        return;
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
//    cookie.remove(tokenName);
  }
}
