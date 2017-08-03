import 'dart:async';
import 'package:angular2/angular2.dart';

import "package:danilo_info/model/article.dart";
import "package:danilo_info/model/tag.dart";

@Injectable()
class ArticleService {
  final List<Article> articles = [
      new Article(
        1,
        DateTime.parse('2013-12-20'),
        DateTime.parse('2013-12-20'),
        'A Casa do Pedra',
        [
          new Tag("AAA"),
          new Tag("BBB"),
        ],
        '''
        A Casa era de pedra.<br>Dormia na Fazendo<br><br>Foi-se, voltou, morreu.<br>hahahaha', '2013-12-22
        ''',
      ),
      new Article(
        2,
        DateTime.parse('2014-04-22'),
        DateTime.parse('2014-01-25'),
        'Mama mia let it go!',
        [
          new Tag("AAA"),
          new Tag("BBB"),
        ],
        '''
        Mama mia let it go! Mama mia let it go! Mama mia let it go! Mama mia let it go! Mama mia let it go!.<br><br>Mama mia let it go!<br><br>Mama mia let it go!<br>Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!Mama mia let it go!
        ''',
      ),
      new Article(
        3,
        DateTime.parse('2014-05-23'),
        DateTime.parse('2014-06-20'),
        'Paranoid Android',
        [
          new Tag("AAA"),
          new Tag("BBB"),
        ],
        '''
        Paranoid Android<br>Paranoid Android<br>Paranoid Android<br>Paranoid Android<br>Paranoid Android<br>
        ''',
      ),
      new Article(
        4,
        DateTime.parse('2014-05-28'),
        DateTime.parse('2014-06-27'),
        'Stockholm Syndrome',
        [
          new Tag("AAA"),
          new Tag("BBB"),
        ],
        '''
        Doença.<br>Apaixonar pelo sequestrador<br><br>Laalalalal.<br>hahahahaHeyehyey<br>Fui Fui', '2014-06-27
        ''',
      ),
      new Article(
        5,
        DateTime.parse('2014-06-13'),
        DateTime.parse('2013-12-21'),
        'Lelelelel',
        [
          new Tag("AAA"),
          new Tag("BBB"),
        ],
        '''
        A Casa era de pedra.<br> lelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallala<br><br>lelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallalalelelelealallala<br>hahahaha
        ''',
      ),
  ];

  Future<Article> get(int id) async {
    return articles.elementAt(id -1);
  }

  Future<List<int>> list() async {
    return articles.map((a) => a.id).toList();
  }

  Future<List<Article>> archive() async {
    var _articles = articles.toList();
    _articles.sort((Article a,b) => a.publishedOn.compareTo(b.publishedOn));
    return _articles;
  }
}
