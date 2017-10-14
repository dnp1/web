import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/user.dart';
import 'package:danilo_info/services/user_service.dart';

@Component(
  selector: 'dnp1-user-avatar',
  template: '''
  <img class='dnp1-comment-avatar' [style.width]="size" [style.height]="size" src='{{ url }}'/>
  ''',
  styles: const ['''
  .dnp1-comment-avatar {
      display: block;
      border-radius: .12em;
      margin: .06em .06em .06em .06em;
  }
  '''],
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
  ],
)
class UserAvatarComponent implements OnInit {
  String url = "/img/author.png";

  String _id;
  @Input()
  void set id(String id) {
    _id = id;
  }

  String get id {
    return _id;
  }

  @Input()
  String size = "4em";

  User user;

  UserService _userService;

  UserAvatarComponent(this._userService);

  Future<Null> ngOnInit() async {
    user = await _userService.get(_id);
    if (user != null && user.avatarId != null) {
      url = "/user/"+id+"/avatar";
    }
  }
}