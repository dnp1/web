import 'package:danilo_info/model/menu_item.dart';
import 'dart:async';
import 'package:angular/angular.dart';

@Injectable()
class MenuItemService {
    static final List<MenuItem> _items = [
      new MenuItem(
          "dnp1-articles-link",
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
          "SignIn",
          "conecte-se",
          MenuItemShowCondition.unauthenticated),
      new MenuItem(
          "dnp1-settins-link",
          "Settings",
          "preferências",
          MenuItemShowCondition.authenticated),
      new MenuItem(
          "dnp1-logout-link",
          "SignOut",
          "sair",
          MenuItemShowCondition.authenticated),
    ];

    Future<List<MenuItem>> getMenuItems() async {
      return _items;
    }
}
