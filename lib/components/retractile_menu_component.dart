import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/model/menu_item.dart';
import 'package:danilo_info/services/menu_item_service.dart';

@Component(
    selector: 'dnp1-retractile-menu',
    templateUrl: 'retractile_menu_component.html',
    styleUrls: const ['retractile_menu_component.css'],
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class RetractileMenuComponent implements OnInit {
  final MenuItemService _menuItemService;

  RetractileMenuComponent(this._menuItemService);

  bool visible;
  List<MenuItem> items;

  @Directive(
    selector: '.dnp1-retractile-menu-btn',
  )
  @HostListener('click', const [r'$event'])
  void showMenu(event) {
    visible = !visible;
  }

  @override
  Future<Null> ngOnInit() async {
    //    window.onResize.listen(); See...
    items = await _menuItemService.getMenuItems();
  }
}
