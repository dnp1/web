import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:danilo_info/components/user_avatar_component.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/comment_service.dart';

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
  final CommentService _commentService;

  Session session;

  CommentFormComponent(this._sessionService, this._commentService);

  @override
  Future<Null> ngOnInit() async {
    session = await _sessionService.getCurrent();
  }

  bool canComment() {
    return session != null && !session.anonymous();
  }


  Future<Null> submit() async {
    print("on submit");
    if (!onSubmit) {
      onSubmit = true;
    //   await (_commentService.)

      onSubmit = false;
    }
  }
}
