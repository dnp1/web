import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/services/title_service.dart';


@Component(
  selector: 'section',
  templateUrl: 'about_component.html',
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  styleUrls: const ['about_component.css'],
)
class AboutComponent extends BaseRouteComponent {
  AboutComponent(TitleService titleService, RouteData data) : super(titleService, data);
}
