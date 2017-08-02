// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';


@Component(
  selector: 'dnp1-app',
  templateUrl: "app_component.html",
  styleUrls: const ['app_zero.css', 'app_layout.css', 'app_logo.css', 'app_menu.css'],
  directives: const [CORE_DIRECTIVES]
)
@RouteConfig(
  const [
    /*
  const Route(
      path: '/dashboard',
      name: 'Dashboard',
      component: DashboardComponent,
      useAsDefault: true),
  const Route(
      path: '/detail/:id', name: 'HeroDetail', component: HeroDetailComponent),
  const Route(path: '/heroes', name: 'Heroes', component: HeroesComponent)*/
])
class AppComponent {
  var name = 'Angular';
  final List<MenuItem> items = [
    new MenuItem("dnp1-posts-link","/articles","postagens"),
    new MenuItem("dnp1-archive-link","/archive","arquivo"),
    new MenuItem("dnp1-about-link","/about","about"),
    new MenuItem("dnp1-logout-link","/logout","logout"),
    new MenuItem("dnp1-logout-link","/login","login"),
  ];
}

class MenuItem {
  final String domClass;
  final String href;
  final String label;

  MenuItem(this.domClass, this.href, this.label);
}
