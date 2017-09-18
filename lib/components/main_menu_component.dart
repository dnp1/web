import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/model/menu_item.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/services/menu_item_service.dart';


@Component(
    selector: 'dnp1-main-menu',
    templateUrl: 'main_menu_component.html',
    styleUrls: const['main_menu_component.css'],
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
)
class MainMenuComponent implements OnInit {
  final MenuItemService _menuItemService;

  MainMenuComponent(this._menuItemService);

  Session session = null;
  List<MenuItem> items;

  double menuLength() {
    return items.map((menu) => menu.getMenuWidth()).reduce((w0, w1) => w0 + w1);
  }

  Future<Null> _getItems() async {
      items = await _menuItemService.getMenuItems();
      print("items:");
      print(items);
  }

  @override
  void ngOnInit() {
      _getItems();
    //    window.onResize.listen(); See...
  }
}
