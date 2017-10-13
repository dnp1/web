import "package:danilo_info/model/tag.dart";

class Article {
  String id;
  DateTime publicationDate;
  DateTime editionDate;
  String title;
  List<Tag> tags;
  String content;

  Article(this.id, this.publicationDate, this.editionDate, this.title, this.tags, this.content);
}
