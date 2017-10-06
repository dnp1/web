import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/user_avatar_component.dart';
import 'package:danilo_info/services/comment_service.dart';


@Component(
  selector: 'section[dnp1-comment-form]',
  templateUrl: 'comment_form_component.html',
  styleUrls: const ['comment_form_component.css'],
  directives: const [
    CORE_DIRECTIVES,
    UserAvatarComponent,
    formDirectives,
  ],
)
class CommentFormComponent implements OnInit {
  bool onSubmit = false;

  String content;
  String _articleId;

  @Input()
  void set articleId(String id) {
    _articleId = id;
  }

  final CommentService _commentService;


  CommentFormComponent(this._commentService);


  Future<Null> submit() async {
    print("on submit");
    if (!onSubmit) {
      onSubmit = true;
    //   await (_commentService.)

      onSubmit = false;
    }
  }
  @override
  ngOnInit() {
    // TODO: implement ngOnInit
  }
}
