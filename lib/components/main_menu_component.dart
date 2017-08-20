import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/services/session_service.dart';


@Component(
    selector: 'dnp1-main-menu',
    templateUrl: 'main_menu_component.html',
    styleUrls: const['main_menu_component.css'],
    directives: const [COMMON_DIRECTIVES, ROUTER_DIRECTIVES]
)
class MainMenuComponent implements OnInit {
  final SessionService _sessionService;

  MainMenuComponent(this._sessionService);

  Session session = null;
  List<MenuItem> items;

  double menuLength() {
    return items.map((menu) => menu.getMenuWidth()).reduce((w0, w1) => w0 + w1);
  }

  @Directive(
    selector: '#dnp1-menu',
  )
  @HostListener('click', const [r'$event'])
  void onClick(event) {
    print(event);
  }

  @Directive(
    selector: 'window',
  )
  @HostListener('resize', const [r'$event'])
  void onResize(event) {
    print(event);
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

class MenuItem {
  final String domClass;
  final String route;
  final String label;
  final MenuItemShowCondition showCondition;

  MenuItem(this.domClass, this.route, this.label, this.showCondition);

  double getMenuWidth() {
    final border = .06;
    final padding = 1;
    final fontSize = 1.3;
    final fontRatio = .72;
    final charWidth = fontSize * fontRatio;
    final textWidth = this.label.length;
    return textWidth + padding + border;
  }
}

enum MenuItemShowCondition {
  always,
  authenticated,
  unauthenticated,
}