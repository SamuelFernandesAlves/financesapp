import 'package:financesapp/app/modules/auth/controller/register_controller.dart';
import 'package:get/get.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
          () => RegisterController(),
    );
  }
}
