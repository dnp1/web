import 'dart:async';

import 'package:angular/di.dart';

class BaseSettingsForm {
  final StreamController<Null> _dispose = new StreamController.broadcast();
  @Output()
  Stream<Null> get onDispose => _dispose.stream;
  void dispose() => _dispose.add(null);
}