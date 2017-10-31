import 'dart:async';
import 'package:angular/di.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:http/browser_client.dart'  as base;
import 'package:http/http.dart';

@Injectable()
class AuthClient extends base.BrowserClient {
  final SessionService _sessionService;
  static const _header = 'Authorization';
  static const _tokenType = 'Bearer';

  AuthClient(this._sessionService);
  /// Sends an HTTP request and asynchronously returns the response.
  Future<StreamedResponse> send(BaseRequest request) async {
    var session = await _sessionService.load();
    request.headers[_header] = _tokenType + session.id;
    return super.send(request);
  }
}
