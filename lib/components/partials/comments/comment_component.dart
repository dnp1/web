import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/comment.dart';
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/components/partials/common/user_avatar_component.dart';
import 'package:danilo_info/components/partials/common/user_name_component.dart';

@Component(
    selector: 'section[dnp1-comment]',
    templateUrl: 'comment_component.html',
    styleUrls: const ['comment_component.css'],
    directives: const [
      UserAvatarComponent,
      UserNameComponent,
      CORE_DIRECTIVES,
    ]
)
class CommentComponent implements OnInit {
  String _id;

  @Input('id')
  void set id(String id) {
    _id = id;
  }

  String get id {
      return _id;
  }

  Comment comment;

  CommentService _commentService;

  CommentComponent(this._commentService);

  Future<Null> ngOnInit() async {
    comment = await (_commentService.get(_id));
  }
}
