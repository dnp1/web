import 'package:danilo_info/util/json_encodable_datetime.dart';

class Comment {
  static Map<String, Comment> _cache = new Map<String, Comment>();

  bool isNew() => id == null;

  String id;
  String articleId;
  String userId;
  String content;
  JsonEncodableDatetime publicationDate;
  JsonEncodableDatetime editionDate;

  Comment(
      {this.id: null, this.articleId, this.userId, this.content, this.publicationDate, this.editionDate});

  Comment._(this.id);


  factory Comment.cachedFromJson(Map<String, dynamic> data) {
    String id = data['id'];
    var comment = _cache.putIfAbsent(id, () => new Comment._(id));
    comment.articleId = data['articleId'];
    comment.userId = data['userId'];
    comment.content = data['content'];
    comment.publicationDate = new JsonEncodableDatetime.fromJson(data['publicationDate']);
    comment.editionDate = new JsonEncodableDatetime.fromJson(data['publicationDate']);
    return comment;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'articleId': articleId,
      'userId': userId,
      'content': content,
      'publicationDate': publicationDate,
      'editionDate': editionDate,
    };
  }
}
