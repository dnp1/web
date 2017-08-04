import 'package:angular2/angular2.dart';

@Component(
  selector: 'dnp1-comment',
  templateUrl: 'comment_component.html',
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
  ],
)
class CommentComponent {
  @Input()
  String id;
  String articleId;
  String parentCommentId;
  String userId;
  String content;


}
