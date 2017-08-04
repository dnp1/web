import 'package:angular2/angular2.dart';
import 'package:danilo_info/components/user_avatar_component.dart';

@Component(
  selector: 'dnp1-comment',
  templateUrl: 'comment_component.html',
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
    UserAvatarComponent,
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
