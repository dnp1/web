import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/partials/user_avatar_component.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/services/session_service.dart';


@Component(
  selector: 'section[dnp1-comment-form]',
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

  Session session;

  final CommentService _commentService;
  final SessionService _sessionService;

  CommentFormComponent(this._commentService, this._sessionService);


  Future<Null> submit() async {
    print("on submit");
    if (!onSubmit) {
      onSubmit = true;
    //   await (_commentService.)

      onSubmit = false;
    }
  }
  @override
  Future<Null> ngOnInit() async {
    session = await _sessionService.load();
  }

  bool canComment() {
    return session != null && !session.anonymous();
  }
}
