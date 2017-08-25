import 'package:danilo_info/model/menu_item.dart';
import 'dart:async';
import 'package:danilo_info/services/session_service.dart';
import 'package:angular2/angular2.dart';

@Injectable()
class MenuItemService {
    SessionService _sessionService;
    MenuItemService(this._sessionService);

    List<MenuItem> _allItems() {
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

    Future<List<MenuItem>> getMenuItems() async {
      var session = await _sessionService.getCurrent();
      MenuItemShowCondition condition;
      if (session.user != null) {
        condition = MenuItemShowCondition.authenticated;
      } else {
        condition = MenuItemShowCondition.unauthenticated;
      }

      return _allItems().where((item) =>
      item.showCondition ==
          MenuItemShowCondition.always || item.showCondition == condition);
    }
}
