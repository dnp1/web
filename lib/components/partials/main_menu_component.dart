import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/model/menu_item.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/services/menu_item_service.dart';
import 'package:danilo_info/services/session_service.dart';


@Component(
  selector: 'nav',
  templateUrl: 'main_menu_component.html',
  styleUrls: const['main_menu_component.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  preserveWhitespace: false,
)
class MainMenuComponent implements OnInit {
  final MenuItemService _menuItemService;
  final SessionService _sessionService;

  MainMenuComponent(this._menuItemService, this._sessionService);

  Session session;
  List<MenuItem> items;

  double menuLength() {
    return items.map((menu) => menu.getMenuWidth()).reduce((w0, w1) => w0 + w1);
  }

  @override
  Future<Null> ngOnInit() async {
    session = await _sessionService.load();
    items = await _menuItemService.getMenuItems();
  }

  bool visible(MenuItem item) {
    if (item.showCondition == MenuItemShowCondition.always) {
      return true;
    } else if (session.anonymous()) {
      return item.showCondition == MenuItemShowCondition.unauthenticated;
    } else {
      return item.showCondition == MenuItemShowCondition.authenticated;
    }
  }
}
