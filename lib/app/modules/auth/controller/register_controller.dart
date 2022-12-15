import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/auth_repositorie.dart';
import '../../routes/app_routes.dart';
import '../../utilities/show_dialog.dart';

class RegisterController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthRepositorie authRepositorie = AuthRepositorie();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool result = false.obs;
  double errorEmail = 50;
  double errorPassword = 50;
  double errorName = 50;
  RxBool load = false.obs;

  Future registerUser(context) async {
    Get.focusScope.unfocus();
    load.value = true;
    dynamic resultLogin = false;
    resultLogin = await authRepositorie.registerUser(
      nameController.text,
        emailController.text,
        passwordController.text,
    );
    if (resultLogin != true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomShowDialog(
            text: resultLogin,
          );
        },
      );
    } else {
      load.value = true;
      Get.offNamedUntil(Routes.ROOT, (route) => false);
      Get.toNamed(Routes.HOME);
    }
    load.value = false;
  }
}