import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'dart:async';

import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/partials/article/article_component.dart';
import 'package:danilo_info/components/partials/comments/article_comments_component.dart';
import 'package:danilo_info/services/title_service.dart';

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
class ArticlePageComponent extends BaseRouteComponent implements OnInit {
  String articleId;
  final RouteParams _routeParams;


  ArticlePageComponent(this._routeParams,
      TitleService title,
      RouteData data,
      Router router) : super(title, data, router);

  @override
  Future<Null> ngOnInit() async {
    articleId = _routeParams.get('id');
  }
}
