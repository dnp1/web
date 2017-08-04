import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:danilo_info/model/comment.dart';

@Injectable()
class CommentService {
    Map<String, Comment> _articles = {

    };

    Future<List<String>> ofArticle(String articleId) async {
      return const [];
    }

    Future<Comment> get(String id) async {
      return _articles[id];
    }
}