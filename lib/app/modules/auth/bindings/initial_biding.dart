import 'package:get/get.dart';

import '../controller/initial_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(
          () => InitialController(),
    );
  }
}
