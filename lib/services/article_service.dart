import 'dart:async';
import 'package:angular2/angular2.dart';

import "package:danilo_info/model/article.dart";

@Injectable()
class ArticleService {
  Future<List<Article>> get() async {
    return const [];
  }
}
