import 'dart:async';
import 'package:angular2/angular2.dart';

import 'package:danilo_info/model/comment.dart';
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/components/user_avatar_component.dart';

@Component(
    selector: 'dnp1-comment',
    templateUrl: 'comment_component.html',
    styleUrls: const ['comment_component.css'],
    directives: const [
      UserAvatarComponent,
      COMMON_DIRECTIVES,
    ]
)
class CommentComponent implements OnInit {
  String _id;

  @Input()
  void set id(String id) {
    _id = id;
  }

  Comment comment;

  CommentService _commentService;

  CommentComponent(this._commentService);

  Future<Null> ngOnInit() async {
    comment = await _commentService.get(_id);
  }
}
