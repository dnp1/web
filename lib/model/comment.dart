class Comment {
  bool _new;
  String id;
  String articleId;
  String userId;
  String content;
  DateTime publishedOn;
  DateTime editedOn;

  Comment(this.id, this.articleId, this.userId, this.content, this.publishedOn, this.editedOn);
}
