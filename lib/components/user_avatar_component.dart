import 'dart:async';
import 'package:angular2/angular2.dart';

import 'package:danilo_info/model/user.dart';
import 'package:danilo_info/services/user_service.dart';

@Component(
  selector: 'dnp1-user-avatar',
  template: '''
  <img class='dnp1-comment-avatar' src='/user/{{ id }}/avatar'/>
  ''',
  styles: const ['''
  .dnp1-comment-avatar {
      display: block;
      height: 2em;
      width: 2em;
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
  String _id;
  @Input()
  void set id(String id) {
    _id = id;
  }

  User user;

  UserService _userService;

  UserAvatarComponent(this._userService);

  Future<Null> ngOnInit() async {
    user = await _userService.get(_id);
  }
}
