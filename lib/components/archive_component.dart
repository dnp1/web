import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

import 'package:danilo_info/model/article.dart';
import 'package:danilo_info/model/month.dart';
import 'package:danilo_info/services/article_service.dart';


class Year<T> {
  int year;
  List<MonthData<T>> months = new List();

  Year(this.year);
}

@Component(
  selector: 'dnp1-archive',
  templateUrl: 'archive_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class ArchiveComponent implements OnInit {
  final ArticleService _articleService;
  List<Year<Article>> years;

  ArchiveComponent(this._articleService);

  Future<Null> ngOnInit() async {
      var articles = (await _articleService.get()).toList();
      var list = new List<Year<Article>>();
      Article previous = null;

      Year<Article> year = null;
      MonthData<Article> month = null;

      for (var article in articles) {
          if (year == null || article.publishedOn.year != previous.publishedOn.year) { // Ano mudou
            if (year != null) {
              list.add(year);
            }
            year = new Year(article.publishedOn.year);
            month = null;
          }

          if (month == null || article.publishedOn.month != previous.publishedOn.month) { // Mês mudou
            if (month != null) {
                year.months.add(month);
            }
            month = new MonthData(article.publishedOn.month);
          }

          month.items.add(article);
          previous = article;
      }
      if (year != null) {
        if (month != null) {
          year.months.add(month);
        }
        list.add(year);
      }

      this.years = list;
    }
}
