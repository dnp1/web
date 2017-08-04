import "package:danilo_info/model/tag.dart";

class Article {
  String id;
  DateTime publishedOn;
  DateTime editedOn;
  String title;
  List<Tag> tags;
  String content;

  Article(this.id, this.publishedOn, this.editedOn, this.title, this.tags, this.content);
}
