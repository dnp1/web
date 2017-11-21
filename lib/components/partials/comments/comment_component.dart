import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/comment.dart';
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/components/partials/common/user_avatar_component.dart';
import 'package:danilo_info/components/partials/common/user_name_component.dart';

@Component(
    selector: 'section[dnp1-comment]',
    templateUrl: 'comment_component.html',
    styleUrls: const [
      'comment_component.css'
    ],
    directives: const [
      UserAvatarComponent,
      UserNameComponent,
      CORE_DIRECTIVES,
    ])
class CommentComponent implements OnInit {
  String content;

  @Input()
  String articleId;

  @Input()
  String commentId;

  @Input()
  Comment comment;

  CommentService _commentService;

  CommentComponent(this._commentService);

  Future<Null> loadContent() async {
    try {
      content = await _commentService.readContent(articleId, commentId);
    } catch (e) {
      content = "Ocorreu um erro inesperado";
    }
  }

  Future<Null> ngOnInit() async {
    if (comment == null) {
      comment = await (_commentService.read(articleId, commentId));
    } else {
      commentId = comment.id;
    }
    loadContent();
  }
}
