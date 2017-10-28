// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/components/sections/about_component.dart';
import 'package:danilo_info/components/sections/archive_component.dart';
import 'package:danilo_info/components/sections/article_listing_component.dart';
import 'package:danilo_info/components/sections/article_page_component.dart';
import 'package:danilo_info/components/sections/settings_component.dart';
import 'package:danilo_info/components/sections/sign_in_component.dart';
import 'package:danilo_info/components/sections/sign_out_component.dart';
import 'package:danilo_info/components/sections/sign_up_component.dart';
import 'package:danilo_info/components/partials/main_menu_component.dart';
import 'package:danilo_info/components/sections/password_reset_component.dart';

import "package:danilo_info/services/article_service.dart";
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/services/user_email_service.dart';
import 'package:danilo_info/services/menu_item_service.dart';
import 'package:danilo_info/services/regexp_string_service.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/storage_service.dart';
import 'package:danilo_info/services/title_service.dart';
import 'package:danilo_info/services/profile_service.dart';
import 'package:danilo_info/services/user_avatar_service.dart';

@Component(
  selector: 'body',
  templateUrl: "app_component.html",
  styleUrls: const ['app_zero.css', 'app_layout.css', 'app_logo.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, MainMenuComponent],
  providers: const [
    ArticleService,
    CommentService,
    MenuItemService,
    StorageService,
    SessionService,
    ProfileService,
    RegexpService,
    TitleService,
    UserEmailService,
    UserAvatarService,
  ],
  preserveWhitespace: false,
)
@RouteConfig(const [
  const Route(
      path: '/article',
      name: 'Articles',
      component: ArticleListingComponent,
      useAsDefault: true,
      data: const {'title': 'Postagens'}),
  const Route(
      path: '/article/:id',
      name: 'ArticlePage',
      component: ArticlePageComponent,
      data: const {'title': 'Postagem'}),
  const Route(
      path: '/archive',
      name: 'Archive',
      component: ArchiveComponent,
      data: const {'title': 'Arquivo'}),
  const Route(
      path: '/about',
      name: 'About',
      component: AboutComponent,
      data: const {'title': 'Sobre'}),
  const Route(
      path: '/sign-in',
      name: 'SignIn',
      component: SignInComponent,
      data: const {'title': 'Autenticação'}),
  const Route(
      path: '/sign-up',
      name: 'SignUp',
      component: SignUpComponent,
      data: const {'title': 'Cadastro'}),
  const Route(
      path: '/password-reset',
      name: 'PasswordReset',
      component: PasswordResetComponent,
      data: const {'title': 'Recuperar Senha'}),
  const Route(
      path: '/settings',
      name: 'Settings',
      component: SettingsComponent,
      data: const {'title': 'Configurações'}),
  const Route(
      path: '/sign-out',
      name: 'SignOut',
      component: SignOutComponent,
      data: const {'title': 'Sair'}),
])
class AppComponent {
  var name = 'danilo.info';
}
