// Copyright (c) 2017. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.
import 'package:angular/angular.dart';

import 'package:angular_router/angular_router.dart';
import 'package:danilo_info/app_component.dart';
import 'package:danilo_info/util/auth_client.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

void main() {
  bootstrap(AppComponent,
      [
        ROUTER_PROVIDERS,
        provide(Client, useFactory: () => new BrowserClient(), deps: []),
        AuthClient,
      ]);
}
