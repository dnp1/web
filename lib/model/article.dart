import "package:danilo_info/model/tag.dart";
import 'package:danilo_info/util/json_encodable_datetime.dart';

class Article {
  static Map<String, Article> _cache = new Map<String, Article>();
  String id;
  JsonEncodableDatetime publicationDate;
  JsonEncodableDatetime editionDate;
  String title;
  List<Tag> tags;

  Article.fromJson(Map<String, dynamic> data) {
    _setFromJson(data);
  }

  void _setFromJson(Map<String, dynamic> data) {
    id = data['id'];
    publicationDate = new JsonEncodableDatetime.fromJson(data['publicationDatetime']);
    editionDate = new JsonEncodableDatetime.fromJson(data['editionDatetime']);
    title = data['title'];
  }

  factory Article.cachedFromJson(Map<String, dynamic> data) {
    String id = data['id'];
    var article =  _cache.putIfAbsent(id, () => new Article.fromJson(data));
    return article;
  }
}
