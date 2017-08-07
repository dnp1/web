import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:danilo_info/components/user_avatar_component.dart';
import 'package:danilo_info/model/comment.dart';
import 'package:danilo_info/services/comment_service.dart';

@Component(
    selector: 'dnp1-comment',
    templateUrl: 'comment_component.html',
    // styleUrls: const ['article__component.css'],
    directives: const [
      CORE_DIRECTIVES,
      CommentService,
    ],
    pipes: const [COMMON_PIPES]
)
class CommentComponent implements OnInit {
  @Input()
  String commentId;
  Comment comment;

  CommentService _commentService;

  CommentComponent(this._commentService);

  Future<Null> ngOnInit() async {
    print(commentId);
    comment = await _commentService.get(commentId);
  }
}
