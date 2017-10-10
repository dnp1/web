import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:danilo_info/services/article_service.dart';
import 'package:danilo_info/components/article_component.dart';

@Component(
  selector: 'section[dnp1-article-listings]',
  templateUrl: 'article_listing_component.html',
  styleUrls: const ['article_listing_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, ArticleComponent],
)
class ArticleListingComponent implements OnInit {
  final ArticleService _articleService;
  List<String> articles;

  ArticleListingComponent(this._articleService);

  Future<Null> ngOnInit() async {
    articles = (await _articleService.list()).toList();
  }
}
