import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/partials/user_avatar_component.dart';
import 'package:danilo_info/components/partials/user_name_component.dart';
import 'package:danilo_info/model/email.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/model/sign_up.dart';
import 'package:danilo_info/services/email_service.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/title_service.dart';


@Component(
  selector: 'section',
  templateUrl: "settings_component.html",
  styleUrls: const ['../styles/form.css', 'settings_component.css'],
  directives: const [
    CORE_DIRECTIVES,
    ROUTER_DIRECTIVES,
    formDirectives,
    UserNameComponent,
    UserAvatarComponent,
  ],
  preserveWhitespace: false,
)
class SettingsComponent extends BaseRouteComponent implements OnInit {
  final SessionService _sessionService;
  final EmailService _emailService;

  Session session;
  List<Email> emailList;

  bool sending = false;

  SignUp signUp = new SignUp(12);

  SettingsComponent(this._sessionService,
      this._emailService,
      TitleService titleService,
      RouteData data,
      Router router)
      : super(titleService, data, router);

  Future<bool> allowed() async  {
    session = await _sessionService.load();
    return (session?.anonymous() ?? true) == false;
  }

  onSubmit() => null;

  @override
  Future<Null >ngOnInit() async {
    emailList = await _emailService.ofUser(session.userId);
  }
}