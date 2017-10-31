import "package:danilo_info/model/tag.dart";
import 'package:danilo_info/util/json_encodable_datetime.dart';

class Article {
  static Map<String, Article> _cache = new Map<String, Article>();
  String id;
  JsonEncodableDatetime publicationDate;
  JsonEncodableDatetime editionDate;
  String title;
  List<Tag> tags;
  String content;

  Article.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    _setFromJson(data);
  }

  Article._(this.id);

  void _setFromJson(Map<String, dynamic> data) {
    publicationDate = data['publicationDate'];
    editionDate = data['editionDate'];
    title = data['title'];
    content = data['content'];
  }

  factory Article.cachedFromJson(Map<String, dynamic> data) {
    String id = data['id'];
    var article =  _cache.putIfAbsent(id, () => new Article._(id));
    article._setFromJson(data);
    return article;
  }
}
