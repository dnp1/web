// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:danilo_info/components/about_component.dart';
import 'package:danilo_info/components/archive_component.dart';
import 'package:danilo_info/components/article_listing_component.dart';
import "package:danilo_info/services/article_service.dart";

@Component(
  selector: 'dnp1-app',
  templateUrl: "app_component.html",
  styleUrls: const ['app_zero.css', 'app_layout.css', 'app_logo.css', 'app_menu.css'],
  directives: const [CORE_DIRECTIVES, ROUTER_DIRECTIVES],
  providers: const [ROUTER_PROVIDERS, ArticleService],
)
@RouteConfig(
  const [

  const Route(
      path: '/article',
      name: 'Articles',
      component: ArticleListingComponent,
      useAsDefault: true),
  const Route(path: '/article/:id', name: 'Article', component: AboutComponent),
  const Route(path: '/archive', name: 'Archive', component: ArchiveComponent),
  const Route(path: '/about', name: 'About', component: AboutComponent),
  const Route(path: '/login', name: 'Login', component: AboutComponent),
  const Route(path: '/logout', name: 'Logout', component: AboutComponent),
])
class AppComponent {
  var name = 'Angular';
  final List<MenuItem> items = [
    new MenuItem("dnp1-posts-link","Articles","postagens"),
    new MenuItem("dnp1-archive-link","Archive","arquivo"),
    new MenuItem("dnp1-about-link","About","about"),
    new MenuItem("dnp1-logout-link","Logout","logout"),
    new MenuItem("dnp1-login-link","Login","login"),
  ];
}

class MenuItem {
  final String domClass;
  final String route;
  final String label;

  MenuItem(this.domClass, this.route, this.label);
}
