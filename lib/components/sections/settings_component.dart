import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/components/base/base_route_component.dart';
import 'package:danilo_info/components/partials/settings/change_avatar_component.dart';
import 'package:danilo_info/components/partials/settings/change_email_component.dart';
import 'package:danilo_info/components/partials/settings/change_name_component.dart';
import 'package:danilo_info/components/partials/settings/change_password_component.dart';
import 'package:danilo_info/components/partials/common/user_avatar_component.dart';
import 'package:danilo_info/components/partials/common/user_name_component.dart';
import 'package:danilo_info/model/email.dart';
import 'package:danilo_info/model/session.dart';
import 'package:danilo_info/model/sign_up.dart';
import 'package:danilo_info/services/user_email_service.dart';
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
    ChangePasswordComponent,
    ChangeEmailComponent,
    ChangeNameComponent,
    ChangeAvatarComponent,
  ],
  preserveWhitespace: false,
)
class SettingsComponent extends BaseRouteComponent implements OnInit {
  final SessionService _sessionService;
  final UserEmailService _emailService;

  final List<SettingsItem> items = const [
    const SettingsItem('name', 'Nome', 'Alteração do nome'),
    const SettingsItem('avatar', 'Foto', 'Alteração da foto'),
    const SettingsItem('email', 'Email', 'Alteração do email'),
    const SettingsItem('password', 'Senha', 'Alteração da senha'),
  ];

  String section;

  Session session;
  List<Email> emailList;

  bool sending = false;

  SignUp signUp = new SignUp();

  SettingsComponent(this._sessionService,
      this._emailService,
      TitleService titleService,
      RouteData data,
      Router router)
      : super(titleService, data, router);

  Future<bool> allowed() async {
    session = await _sessionService.load();
    return (session?.anonymous() ?? true) == false;
  }

  onSubmit() => null;

  @override
  Future<Null> ngOnInit() async {
    emailList = await _emailService.find(session.userId);
  }

  void edit(String name) => section = name;
}

class SettingsItem {
  final String name;
  final String label;
  final String editionHeader;

  const SettingsItem(this.name,
      this.label,
      this.editionHeader);
}