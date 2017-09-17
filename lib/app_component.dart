// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:danilo_info/components/about_component.dart';
import 'package:danilo_info/components/archive_component.dart';
import 'package:danilo_info/components/article_listing_component.dart';
import 'package:danilo_info/components/article_page_component.dart';
import 'package:danilo_info/components/login_component.dart';
import 'package:danilo_info/components/main_menu_component.dart';
import 'package:danilo_info/components/retractile_menu_component.dart';
import 'package:danilo_info/components/sign_up_component.dart';
import "package:danilo_info/services/article_service.dart";
import 'package:danilo_info/services/comment_service.dart';
import 'package:danilo_info/services/session_service.dart';
import 'package:danilo_info/services/user_service.dart';
import 'package:danilo_info/services/menu_item_service.dart';

@Component(
  selector: 'dnp1-app',
  templateUrl: "app_component.html",
  styleUrls: const ['app_zero.css', 'app_layout.css', 'app_logo.css'],
  directives: const [
    CORE_DIRECTIVES,
    ROUTER_DIRECTIVES,
    MainMenuComponent,
    RetractileMenuComponent
  ],
  providers: const [
    UserService,
    ArticleService,
    CommentService,
    SessionService,
    MenuItemService,
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
  const Route(path: '/sign-in', name: 'Login', component: LoginComponent),
  const Route(path: '/logout', name: 'Logout', component: AboutComponent),
  const Route(path: '/sign-up', name: 'SignUp', component: SignUpComponent),
])
class AppComponent {
  var name = 'Angular';
}
