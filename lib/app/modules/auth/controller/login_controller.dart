import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repositories/auth_repositorie.dart';
import '../../routes/app_routes.dart';
import '../../utilities/show_dialog.dart';

class LoginController extends GetxController {


  RxBool loadInitial = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
   GlobalKey<FormState> formKeyLogin =  GlobalKey<FormState>();
  AuthRepositorie authRepositorie;
  LoginController(){
    authRepositorie = AuthRepositorie();

  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  double errorEmail = 50;
  double errorPassword = 50;
  int test = 0;
  RxBool load = false.obs;

  void realizarLogin(context) async {
    loadInitial.value = true;
    Get.focusScope.unfocus();
    loadInitial.value = true;
    dynamic resultLogin = false;
    resultLogin = await authRepositorie.loginUser(emailController.text, senhaController.text);
    if (resultLogin != true) {
      loadInitial.value = false;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomShowDialog(
            text: resultLogin,
          );
        },
      );
    } else {
      loadInitial.value = false;
      Get.offNamedUntil(Routes.ROOT, (route) => false);
      Get.toNamed(Routes.HOME);
    }
    loadInitial.value = false;
  }
}
