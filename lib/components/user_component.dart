import 'package:angular2/angular2.dart';

@Component(
  selector: 'dnp1-user',
  templateUrl: 'user_component.html',
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
  ],
)
class UserComponent {
  @Input()
  String id;
  String name;
}
