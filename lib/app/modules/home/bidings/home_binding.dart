import 'package:get/get.dart';
import '../../add_receita/controller/add_receita_controller.dart';

import '../controller/home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<AddReceitaController>(
          () => AddReceitaController(),
    );
  }
}