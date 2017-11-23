import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/user_name.dart';
import 'package:danilo_info/services/user_avatar_service.dart';
import 'package:danilo_info/services/user_name_service.dart';

@Component(
  selector: 'span[dnp1-user-avatar]',
  template: '''
  <template [ngIf]="url != null">
    <img [style.width]="size" [style.height]="size" src='{{ url }}'/>
  </template>
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
  String url = null;

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


  UserAvatarService _userAvatarService;

  UserAvatarComponent(this._userAvatarService);

  Future<Null> ngOnInit() async {
    var _url = await _userAvatarService.readAvatarUrl(_userId);
    if (_url != null) {
      print(_url);
      url = _url;
    } else {
      url = "/img/author.png";
    }
  }
}
