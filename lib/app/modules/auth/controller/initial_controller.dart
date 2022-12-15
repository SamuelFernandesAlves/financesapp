import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
class InitialController extends GetxController {

  FirebaseAuth _auth;

  InitialController(){
    _auth = FirebaseAuth.instance;
  }

  @override
  Future<void> onInit() async {
    Timer(const Duration(milliseconds: 2500), () async {
      bool logado = await verificarUserLogado();
      if(logado){
        Get.toNamed(Routes.HOME);
      }else{
        Get.toNamed(Routes.LOGIN);
      }
    });
    super.onInit();
  }

  Future verificarUserLogado() async {
    User user = _auth.currentUser;
    return user != null ? true : false;
  }

}
