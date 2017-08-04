import 'package:angular2/angular2.dart';

@Component(
  selector: 'dnp1-user-avatar',
  template: '''
  <img class='dnp1-comment-avatar' src='/user/{{ id }}/avatar'/>
  ''',
  // styleUrls: const ['article__component.css'],
  directives: const [
    CORE_DIRECTIVES,
  ],
)
class UserAvatarComponent {
  @Input()
  String id;
}
