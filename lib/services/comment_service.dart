import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:danilo_info/model/comment.dart';

@Injectable()
class CommentService {
    final Map<String, Comment> _comments = {
      '1': new Comment('1','1', '1', '''
      Teste final dbhdgauyqwg asdhgsa asjdni wq ehuiadas djahsds whqui hdasjkas dasdqw
      dnjiasda
      dsakj daodio d oai jdwq9ie yhkjasc k aha diasjhskj dhaijaksckncjwgfuiwehf aj  asdsadj ddd hduqhwud ds dhudqwu s eesj er fdsfdsf fs
      asmdada dsad
      '''),
      '2': new Comment('2','1', '1', '''
      Teste final dbhdgauyqwg asdhgsa asjdni wq ehuiadas djahsds whqui hdasjkas dasdqw
      dnjiasda
      dsakj daodio d oai jdwq9ie yhkjasc k aha diasjhskj dhaijaksckncjwgfuiwehf aj  asdsadj ddd hduqhwud ds dhudqwu s eesj er fdsfdsf fs
      asmdada dsad
      ''')
    };

    Future<List<String>> ofArticle(String articleId) async {
      return  _comments.values
          .where((comment) => comment.articleId == articleId)
          .map((comment) => comment.id).toList();
    }

    Future<Comment> get(String id) async {
      return _comments[id];
    }
}
