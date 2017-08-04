import 'package:angular2/angular2.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';

import 'package:danilo_info/components/article_component.dart';
import 'package:danilo_info/components/article_comments_component.dart';

@Component(
  selector: 'dnp1-article-page',
  templateUrl: 'article_page_component.html',
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
    ArticleCommentsComponent,
    ArticleComponent,
  ],
)
class ArticlePageComponent implements OnActivate {
  String articleId;
  final RouteParams _routeParams;
  final Location _location;


  ArticlePageComponent(this._routeParams, this._location);

  void goBack() => _location.back();

  @override
  routerOnActivate(ComponentInstruction nextInstruction,
      ComponentInstruction prevInstruction) {
      articleId = _routeParams.get('id');
  }
}
