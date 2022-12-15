import 'package:financesapp/app/modules/add_receita/bindings/add_receita_biding.dart';
import 'package:financesapp/app/modules/add_receita/view/add_receita_view.dart';
import 'package:financesapp/app/modules/auth/bindings/initial_biding.dart';
import 'package:financesapp/app/modules/auth/bindings/login_biding.dart';
import 'package:financesapp/app/modules/auth/view/initial_page.dart';
import 'package:financesapp/app/modules/auth/view/login_view.dart';
import 'package:financesapp/app/modules/home/bidings/home_binding.dart';
import 'package:get/get.dart';

import '../auth/bindings/auth_binding.dart';
import '../auth/view/register_view.dart';
import '../home/view/home_page.dart';
import 'app_routes.dart';

class Theme1AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(name: Routes.ROOT, page: () => InitialPage(), binding: InitialBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginView(), binding: LoginBinding()),
    GetPage(name: Routes.REGISTER, page: () => RegisterView(), binding: AuthBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.ADDRECEITA, page: () => AddReceitaView(), binding: AddReceitaBinding()),
  ];
}
