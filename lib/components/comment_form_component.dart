import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

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
    formDirectives,
  ],
)
class CommentFormComponent implements OnInit {
  bool onSubmit = false;

  String content;
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

  void submit() {
    if (!onSubmit) {
      onSubmit = true;
    }
  }

  void keypress(KeyboardEvent $event) {
    if ($event.keyCode != 13) {
      return;
    }
    if (!$event.ctrlKey) {
      $event.preventDefault();
    }
  }

  void keyup(KeyboardEvent $event) {
    if ($event.keyCode == 13 && !$event.ctrlKey) {
        submit();
    }
  }
}
