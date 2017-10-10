import 'dart:html';

import 'dart:html_common';
import 'package:angular/di.dart';

@Injectable()
class StorageService extends Storage {
  factory StorageService() => window.localStorage;
}