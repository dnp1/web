import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'dnp1-main-menu',
    templateUrl: 'main_menu_component.html',
    styleUrls: const['main_menu_component.css'],
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class MainMenuComponent {
  final List<MenuItem> items = [
    new MenuItem("dnp1-posts-link", "Articles", "postagens"),
    new MenuItem("dnp1-archive-link", "Archive", "arquivo"),
    new MenuItem("dnp1-about-link", "About", "sobre"),
    new MenuItem("dnp1-login-link", "Login", "conecte-se"),
    new MenuItem("dnp1-logout-link", "Logout", "sair"),
  ];
}

class MenuItem {
  final String domClass;
  final String route;
  final String label;

  MenuItem(this.domClass, this.route, this.label);
}
