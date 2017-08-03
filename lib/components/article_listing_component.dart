import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:danilo_info/model/article.dart';
import 'package:danilo_info/services/article_service.dart';

@Component(
  selector: 'dnp1-article-listings',
  templateUrl: 'article_listing_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class ArticleListingComponent {
    final ArticleService _articleService;
    List<Article> articles;

    ArticleListingComponent(this._articleService);

    Future<Null> ngOnInit() async {
        articles = (await _articleService.get()).toList();
    }
}
