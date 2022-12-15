import 'package:get/get.dart';

import '../controller/add_receita_controller.dart';


class AddReceitaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddReceitaController>(
          () => AddReceitaController(),
    );
  }
}
