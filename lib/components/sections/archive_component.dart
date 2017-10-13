import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/model/article.dart';
import 'package:danilo_info/model/month.dart';
import 'package:danilo_info/services/article_service.dart';
import 'package:danilo_info/services/title_service.dart';


class Year<T> {
  int year;
  List<MonthData<T>> months = new List();

  Year(this.year);
}

@Component(
  selector: 'section',
  templateUrl: 'archive_component.html',
  styleUrls: const ["archive_component.css"],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class ArchiveComponent extends BaseRouteComponent implements OnInit {
  final ArticleService _articleService;
  List<Year<Article>> years;

  ArchiveComponent(this._articleService, TitleService titleService, RouteData data):super(titleService, data);

  Future<Null> ngOnInit() async {
    var articles = (await _articleService.archive()).toList();
    var list = new List<Year<Article>>();
    Article previous = null;

    Year<Article> year = null;
    MonthData<Article> month = null;

    for (var article in articles) {
      if (year == null ||
          article.publicationDate.year != previous.publicationDate.year) { // Ano mudou
        year = new Year(article.publicationDate.year);
        list.add(year);
      }

      if (month == null || article.publicationDate.month !=
          previous.publicationDate.month) { // Mês mudou
        month = new MonthData(article.publicationDate.month);
        year.months.add(month);
      }

      month.items.add(article);
      previous = article;
    }
    this.years = list;
  }
}
