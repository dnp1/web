import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:danilo_info/components/retractile_menu_component.dart';
import 'package:danilo_info/model/menu_item.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/services/session_service.dart';


@Component(
    selector: 'dnp1-main-menu',
    templateUrl: 'main_menu_component.html',
    styleUrls: const['main_menu_component.css'],
    directives: const [COMMON_DIRECTIVES, ROUTER_DIRECTIVES, RetractileMenuComponent]
)
class MainMenuComponent implements OnInit {
  final SessionService _sessionService;

  MainMenuComponent(this._sessionService);

  Session session = null;
  List<MenuItem> items;

  double menuLength() {
    return items.map((menu) => menu.getMenuWidth()).reduce((w0, w1) => w0 + w1);
  }

  List<MenuItem> allItems() {
    return [
      new MenuItem(
          "dnp1-posts-link",
          "Articles",
          "postagens",
          MenuItemShowCondition.always),
      new MenuItem(
          "dnp1-archive-link",
          "Archive",
          "arquivo",
          MenuItemShowCondition.always),
      new MenuItem(
          "dnp1-about-link",
          "About",
          "sobre",
          MenuItemShowCondition.always),
      new MenuItem(
          "dnp1-login-link",
          "Login",
          "conecte-se",
          MenuItemShowCondition.unauthenticated),
      new MenuItem(
          "dnp1-logout-link",
          "Logout",
          "sair",
          MenuItemShowCondition.authenticated),
    ];
  }

  @override
  Future<Null> ngOnInit() async {
//    window.onResize.listen(); See...
    session = await _sessionService.getCurrentSession();
    MenuItemShowCondition condition;
    if (session.user != null) {
      condition = MenuItemShowCondition.authenticated;
    } else {
      condition = MenuItemShowCondition.unauthenticated;
    }

    items = allItems().where((item) =>
    item.showCondition ==
        MenuItemShowCondition.always || item.showCondition == condition);
  }
}

