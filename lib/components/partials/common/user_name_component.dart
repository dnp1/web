import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/user_name.dart';
import 'package:danilo_info/services/user_name_service.dart';

@Component(
  selector: 'span[dnp1-user-name]',
  template: '''
  {{ name }}
  ''',
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
  ],
)
class UserNameComponent implements OnInit {
  String _userId;
  @Input()
  void set userId(String id) {
    _userId = id;
  }

  PersonNamePart _namePart = PersonNamePart.full;
  @Input()
  void set namePart(PersonNamePart part) {
    _namePart = part;
  }

  String name = "";
  UserNameService _userService;

  UserNameComponent(this._userService);

  Future<Null> ngOnInit() async {
    var user = await _userService.get(_userId);
    if (user  != null) {
      name = user.getName(_namePart);
    }
  }
}
