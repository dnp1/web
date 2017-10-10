import 'dart:html';
import 'package:angular/di.dart';

@Injectable()
class StorageService extends Storage {
  factory StorageService() => window.localStorage;
}