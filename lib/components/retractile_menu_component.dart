import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:danilo_info/model/menu_item.dart';


@Component(
    selector: 'dnp1-retractile-menu',
    templateUrl: 'retractile_menu_component.html',
    styleUrls: const ['retractile_menu_component.css'],
    directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES]
)
class RetractileMenuComponent {
  bool visible;
  @Input()
  List<MenuItem> items;

  @Directive(
    selector: '.dnp1-retractile-menu-btn',
  )
  @HostListener('click', const [r'$event'])
  void showMenu(event) {
    visible = !visible;
  }
}