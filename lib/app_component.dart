// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/components/about_component.dart';
import 'package:danilo_info/components/archive_component.dart';
import 'package:danilo_info/components/article_listing_component.dart';
import 'package:danilo_info/components/article_page_component.dart';
import 'package:danilo_info/components/sign_in_component.dart';
import 'package:danilo_info/components/sign_up_component.dart';
import 'package:danilo_info/components/main_menu_component.dart';
import 'package:danilo_info/components/password_reset_component.dart';

import "package:danilo_info/services/article_service.dart";
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/services/menu_item_service.dart';
import 'package:danilo_info/services/regexp_string_service.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/storage_service.dart';
import 'package:danilo_info/services/user_service.dart';


@Component(
  selector: 'body[dnp1-app]',
  templateUrl: "app_component.html",
  styleUrls: const ['app_zero.css', 'app_layout.css', 'app_logo.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES, MainMenuComponent],
  providers: const [
      ArticleService,
      CommentService,
      MenuItemService,
      StorageService,
      SessionService,
      UserService,
      RegexpService,
      ROUTER_PROVIDERS,
  ],
)
@RouteConfig(
  const [

  const Route(
      path: '/article',
      name: 'Articles',
      component: ArticleListingComponent,
      useAsDefault: true),
  const Route(path: '/article/:id', name: 'ArticlePage', component: ArticlePageComponent),
  const Route(path: '/archive', name: 'Archive', component: ArchiveComponent),
  const Route(path: '/about', name: 'About', component: AboutComponent),
  const Route(path: '/sign-in', name: 'SignIn', component: SignInComponent),
  const Route(path: '/sign-up', name: 'SignUp', component: SignUpComponent),
  const Route(path: '/password-reset', name: 'PasswordReset', component: PasswordResetComponent),
  const Route(path: '/settings', name: 'Settings', component: AboutComponent),
])
class AppComponent {
  var name = 'danilo.info';
}
