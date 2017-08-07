import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:danilo_info/model/article.dart';
import "package:danilo_info/model/tag.dart";
import 'package:danilo_info/services/article_service.dart';

@Injectable()
@Component(
  selector: 'dnp1-article',
  templateUrl: 'article_component.html',
  styleUrls: const ['article_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class ArticleComponent
    implements OnInit {
  final ArticleService _articleService;
  @Input()
  String id;
  Article article;

  ArticleComponent(this._articleService);

  Future<Null> ngOnInit() async {
    article = await _articleService.get(id);
  }
}
