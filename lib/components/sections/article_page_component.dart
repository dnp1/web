import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'dart:async';

import 'package:danilo_info/components/partials/article_component.dart';
import 'package:danilo_info/components/partials/article_comments_component.dart';

@Component(
  selector: 'section',
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
