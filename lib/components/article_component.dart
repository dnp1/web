import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import "package:danilo_info/model/tag.dart";
import 'package:danilo_info/services/article_service.dart';

@Injectable()
@Component(
  selector: 'dnp1-article',
  templateUrl: 'article_component.html',
  styleUrls: const ['article_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class ArticleComponent implements OnInit {
  final ArticleService _articleService;
  @Input()
  String id;
  DateTime publishedOn;
  DateTime editedOn;
  String title;
  List<Tag> tags;
  String content;

  ArticleComponent(this._articleService);

  Future<Null> ngOnInit() async {
        var article = (await _articleService.get(id));
        this.publishedOn = article.publishedOn;
        this.editedOn = article.editedOn;
        this.title = article.title;
        this.tags = article.tags;
        this.content = article.content;
    }
}
