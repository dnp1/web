import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';


@Component(
  selector: 'section',
  templateUrl: 'about_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  styleUrls: const ['about_component.css'],
)
class AboutComponent {
}
