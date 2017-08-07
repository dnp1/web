import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'dart:async';

import 'package:danilo_info/components/article_component.dart';
import 'package:danilo_info/components/article_comments_component.dart';

@Component(
  selector: 'dnp1-article-page',
  templateUrl: 'article_page_component.html',
  styleUrls: const ['article_page_component.css'],
  directives: const [
    CORE_DIRECTIVES,
    ArticleCommentsComponent,
    ArticleComponent,
  ]
)
class ArticlePageComponent implements OnInit {
  String articleId;
  final RouteParams _routeParams;

  ArticlePageComponent(this._routeParams);

  @override
  Future<Null> ngOnInit() async {
    articleId = _routeParams.get('id');
  }
}
