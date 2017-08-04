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
    UserAvatarComponent,
    CommentService,
  ],
)
class CommentComponent implements OnInit {
  @Input()
  String id;
  Comment comment;

  CommentService _commentService;

  CommentComponent(this._commentService);


  @override
  ngOnInit() async {
    comment = await _commentService.get(id);
  }
}
