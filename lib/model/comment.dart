import 'package:danilo_info/util/json_encodable_datetime.dart';

class Comment {
  static Map<String, Comment> _cache = new Map<String, Comment>();

  bool isNew() => id == null;

  String id;
  String userId;
  JsonEncodableDatetime publicationDate;
  JsonEncodableDatetime editionDate;

  Comment(
      {this.id: null, this.userId, this.publicationDate, this.editionDate});

  Comment._(this.id);


  factory Comment.cachedFromJson(Map<String, dynamic> data) {
    String id = data['id'];
    var comment = _cache.putIfAbsent(id, () => new Comment._(id));
    comment.userId = data['userId'];
    comment.publicationDate = new JsonEncodableDatetime.fromJson(data['publicationDatetime']);
    comment.editionDate = new JsonEncodableDatetime.fromJson(data['editionDatetime']);
    return comment;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'publicationDate': publicationDate,
      'editionDate': editionDate,
    };
  }
}
