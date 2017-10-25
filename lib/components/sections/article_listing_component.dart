import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/services/article_service.dart';
import 'package:danilo_info/components/partials/article/article_component.dart';
import 'package:danilo_info/services/title_service.dart';

@Component(
  selector: 'section[dnp1-article-listings]',
  templateUrl: 'article_listing_component.html',
  styleUrls: const ['article_listing_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, ArticleComponent],
)
class ArticleListingComponent extends BaseRouteComponent implements OnInit {
  final ArticleService _articleService;
  List<String> articles;

  ArticleListingComponent(this._articleService,
      TitleService titleService,
      RouteData data,
      Router router) :super(titleService, data, router);

  Future<Null> ngOnInit() async {
    articles = (await _articleService.list()).toList();
  }
}
