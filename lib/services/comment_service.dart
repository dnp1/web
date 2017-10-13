import 'dart:async';

import 'package:angular/angular.dart';
import 'package:danilo_info/model/comment.dart';

@Injectable()
class CommentService {
  final Map<String, Comment> _comments = {
    '1': new Comment(
        id: '1',
        articleId: '1',
        userId: '1',
        content: '''
      Teste final dbhdgauyqwg asdhgsa asjdni wq ehuiadas djahsds whqui hdasjkas dasdqw
      dnjiasda
      dsakj daodio d oai jdwq9ie yhkjasc k aha diasjhskj dhaijaksckncjwgfuiwehf aj  asdsadj ddd hduqhwud ds dhudqwu s eesj er fdsfdsf fs
      asmdada dsad
      ''',
        publicationDate: new DateTime.utc(2015, 06, 15),
        editionDate: new DateTime.utc(2015, 06, 15)
    ),
    '2': new Comment(
        id: '2',
        articleId: '1',
        userId: '1',
        content: '''
      Teste final dbhdgauyqwg asdhgsa asjdni wq ehuiadas djahsds whqui hdasjkas dasdqw
      dnjiasda
      dsakj daodio d oai jdwq9ie yhkjasc k aha diasjhskj dhaijaksckncjwgfuiwehf aj  asdsadj ddd hduqhwud ds dhudqwu s eesj er fdsfdsf fs
      asmdada dsad
      ''',
        publicationDate: new DateTime.utc(2015, 06, 15),
        editionDate: new DateTime.utc(2015, 06, 15)
    )
  };

  Future<List<String>> ofArticle(String articleId) async {
    return _comments.values
        .where((comment) => comment.articleId == articleId)
        .map((comment) => comment.id).toList();
  }

  Future<Comment> get(String id) async {
    return _comments[id];
  }


  Future<Map<String, String>> save(Comment comment) {
    print("TODO:MISSING_IMPLEMENT");
    return null;
  }
}
