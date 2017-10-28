import "dart:html";

import 'package:angular/di.dart';

@Injectable()
class TitleService {

  String getTitle() {
    return document.title;
  }

  void setTitle(String newTitle) {
    document.title = newTitle;
  }

}