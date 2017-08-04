import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

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
  ],
)
class ArticlePageComponent implements OnActivate {
  String articleId;
  final RouteParams _routeParams;

  ArticlePageComponent(this._routeParams);

  @override
  routerOnActivate(ComponentInstruction nextInstruction,
      ComponentInstruction prevInstruction) {
    articleId = _routeParams.get('id');
  }
}
