import 'dart:async';

import 'package:angular/di.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:danilo_info/components/base/form_helper.dart';

abstract class BaseSettingsForm {
  bool sending = false;
  Map<String, bool> controlStateClasses(NgControl control) =>
      FormHelper.controlStateClasses(control);
  @Input()
  String userId;
  final StreamController<Null> _dispose = new StreamController.broadcast();
  @Output()
  Stream<Null> get onDispose => _dispose.stream;
  void dispose() => _dispose.add(null);
  void save();
}