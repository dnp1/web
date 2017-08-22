import 'package:angular2/angular2.dart';
import 'package:danilo_info/model/login.dart';

@Component(
  selector: 'dnp1-login',
  templateUrl: "login_component.html",
  styleUrls: const ['login_component.css', "styles/dnp1_page.css"],
  directives: const [COMMON_DIRECTIVES]
)
class LoginComponent {
  Login login = new Login();

  onSubmit() {
    print('teste');
    login.email += 'e';
  }
}
