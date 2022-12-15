import 'package:financesapp/app/modules/auth/controller/login_controller.dart';
import 'package:financesapp/app/modules/auth/controller/register_controller.dart';
import 'package:get/get.dart';

import '../controller/initial_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
  }
}
