import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/components/partials/comment_component.dart';
import 'package:danilo_info/components/partials/comment_form_component.dart';

import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/services/session_service.dart';

@Component(
  selector: 'section[dnp1-article-comments]',
  templateUrl: 'article_comments_component.html',
  styleUrls: const ['article_comments_component.css'],
  directives: const [
    CORE_DIRECTIVES,
    CommentComponent,
    CommentFormComponent,
  ],
)
class ArticleCommentsComponent implements OnInit {
  @Input()
  String articleId;

  List<String> comments;
  Session session;

  final CommentService _commentService;
  final SessionService _sessionService;

  ArticleCommentsComponent(this._commentService, this._sessionService);

  @override
  Future<Null> ngOnInit() async {
    comments = await _commentService.ofArticle(articleId);
    session = await _sessionService.load();
  }

  bool canComment() {
    return session != null && !session.anonymous();
  }
}
