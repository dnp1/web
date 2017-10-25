import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/profile.dart';
import 'package:danilo_info/services/profile_service.dart';

@Component(
  selector: 'span[dnp1-user-avatar]',
  template: '''
  <img [style.width]="size" [style.height]="size" src='{{ url }}'/>
  ''',
  styles: const ['''
  img {
      display: block;
      border-radius: .12em;
  }
  '''],
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
  ],
)
class UserAvatarComponent implements OnInit {
  String url = "/img/author.png";

  String _userId;
  @Input()
  void set userId(String id) {
    _userId = id;
  }

  String get userId {
    return _userId;
  }

  @Input()
  String size = "4em";

  Profile user;

  ProfileService _userService;

  UserAvatarComponent(this._userService);

  Future<Null> ngOnInit() async {
    user = await _userService.get(_userId);
    if (user != null && user.avatarId != null) {
      url = "/user/"+userId+"/avatar";
    }
  }
}
