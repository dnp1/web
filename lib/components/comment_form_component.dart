import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/components/user_avatar_component.dart';
import 'package:danilo_info/services/session_service.dart';

import 'package:danilo_info/model/session.dart';

@Component(
  selector: 'dnp1-comment-form',
  templateUrl: 'comment_form_component.html',
  styleUrls: const ['comment_form_component.css'],
  directives: const [
    CORE_DIRECTIVES,
    UserAvatarComponent,
  ],
)
class CommentFormComponent implements OnInit {
  String _articleId;

  @Input()
  void set articleId(String id) {
    _articleId = id;
  }

  final SessionService _sessionService;

  Session session;

  CommentFormComponent(this._sessionService);

  @override
  Future<Null> ngOnInit() async {
    session = await _sessionService.getCurrent();
    if (session.userId == null) {
      session.userId = "1"; //TODO:REMOVE_IT;
    }
  }

  bool canComment() {
    if (session == null) {
      return false;
    } else {
      return true;
    }
    return session != null && session.userId != null;
  }

  void onSubmit() {

  }
}
