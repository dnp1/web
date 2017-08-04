import 'package:angular2/angular2.dart';

import 'package:danilo_info/components/article_component.dart';
import 'package:danilo_info/components/comment_component.dart';
import 'package:danilo_info/services/comment_service.dart';

@Component(
  selector: 'dnp1-article-comments',
  templateUrl: 'article_comments_component.html',
  styleUrls: const ['article_comments_component.css'],
  directives: const [
    CORE_DIRECTIVES,
    ArticleComponent,
    CommentComponent,
  ],
)
class ArticleCommentsComponent implements OnInit {
  @Input()
  String articleId;
  List<String> comments;

  final CommentService _commentService;

  ArticleCommentsComponent(this._commentService);


  @override
  ngOnInit() async {
    comments = (await _commentService.ofArticle(articleId));
  }
}
