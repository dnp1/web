import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:danilo_info/model/article.dart';
import 'package:danilo_info/services/article_service.dart';
import 'package:danilo_info/services/title_service.dart';

@Component(
  selector: 'article',
  templateUrl: 'article_component.html',
  styleUrls: const ['article_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class ArticleComponent implements OnInit  {
  final ArticleService _articleService;
  final TitleService _titleService;

  Article article;

  @Input()
  bool fullPage = false;

  String _id;
  @Input('articleId')
  void set id(String id)  {
    _id = id;
  }

  ArticleComponent(this._articleService, this._titleService);


  @override
  Future<Null> ngOnInit() async {
    article = await _articleService.get(_id);
    if (fullPage) {
      _titleService.setTitle(article.title);
    }
  }
}
