import "package:danilo_info/model/tag.dart";

class Article {
  int id;
  DateTime publishedOn;
  DateTime editedOn;
  String title;
  List<Tag> tags;
  String content;
}
