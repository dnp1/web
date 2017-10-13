class Comment {
  bool isNew() => id == null;

  String id;
  String articleId;
  String userId;
  String content;
  DateTime publicationDate;
  DateTime editionDate;

  Comment({this.id: null, this.articleId, this.userId, this.content, this.publicationDate, this.editionDate});
}
