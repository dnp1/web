import 'dart:async';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/user.dart';
import 'package:danilo_info/services/user_service.dart';

@Component(
  selector: 'dnp1-user-name',
  template: '''
  {{ name }}
  ''',
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
  ],
)
class UserNameComponent implements OnInit {
  String _id;
  @Input()
  void set id(String id) {
    _id = id;
  }

  PersonNamePart _namePart = PersonNamePart.full;
  @Input()
  void set namePart(PersonNamePart part) {
    _namePart = part;
  }

  String name = "";
  UserService _userService;

  UserNameComponent(this._userService);

  Future<Null> ngOnInit() async {
    var user = await _userService.get(_id);
    if (user  != null) {
      name = user.getName(_namePart);
    }
  }
}
