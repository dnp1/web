import 'dart:async';
import 'package:angular2/angular2.dart';

import 'package:danilo_info/components/comment_component.dart';
import 'package:danilo_info/services/comment_service.dart';

@Component(
  selector: 'dnp1-article-comments',
  templateUrl: 'article_comments_component.html',
  styleUrls: const ['article_comments_component.css'],
  directives: const [
    COMMON_DIRECTIVES,
    CommentComponent,
  ],
)
class ArticleCommentsComponent implements OnInit {
  String _articleId;

  @Input()
  void set articleId(String id) {
    _articleId = id;
  }

  List<String> comments;

  final CommentService _commentService;

  ArticleCommentsComponent(this._commentService);

  @override
  Future<Null> ngOnInit() async {
    comments = await _commentService.ofArticle(_articleId);
  }
}
