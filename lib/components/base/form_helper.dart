import 'package:angular_forms/angular_forms.dart';

abstract class FormHelper {
  static Map<String, bool> controlStateClasses(NgControl control) =>
      {
        'ng-dirty': control.dirty ?? false,
        'ng-pristine': control.pristine ?? false,
        'ng-touched': control.touched ?? false,
        'ng-untouched': control.untouched ?? false,
        'ng-valid': control.valid ?? false,
        'ng-invalid': control.valid == false
      };
}