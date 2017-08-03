import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:danilo_info/components/article_component.dart';

@Component(
  selector: 'dnp1-article-page',
  templateUrl: 'article_page_component.html',
  // styleUrls: const ['article__component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, ArticleComponent],
)
class ArticlePageComponent {
    @Input()
    int articleId;
}
