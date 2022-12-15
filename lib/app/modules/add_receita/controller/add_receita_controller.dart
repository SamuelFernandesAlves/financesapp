import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/receita_model.dart';
import '../../../repositories/auth_repositorie.dart';
import '../../utilities/show_dialog.dart';

class AddReceitaController extends GetxController {
  DateTime dataSelected;
  ReceitaModel receitaModel;
  String valueEmText = "";
  RxBool hoje = true.obs;
  RxBool ontem = false.obs;
  RxBool outro = false.obs;
  AuthRepositorie authRepositorie;

  RxBool tipo = false.obs;
  RxBool load = false.obs;

  AddReceitaController() {
    receitaModel = ReceitaModel();

    authRepositorie = AuthRepositorie();
  }

  @override
  Future<void> onInit() {
    receitaModel.title ="";
    receitaModel.description ="";
    receitaModel.value =0.0;
    valueEmText = "";
    // TODO: implement onInit
    super.onInit();
  }

  Future<String> validate() async {
    if (receitaModel.title.isNotEmpty &&
        valueEmText.isNotEmpty &&
        receitaModel.description.isNotEmpty) {
      receitaModel.value = UtilBrasilFields.converterMoedaParaDouble(valueEmText);
      return addReceita();
    } else {
      return "Insira todos os dados!";
    }
  }

  Future<String> addReceita() async {
    Get.focusScope.unfocus();
    load.value = true;
    String resultLogin = "";
    resultLogin = await authRepositorie.addReceita(receitaModel);
    if (resultLogin != true) {
      load.value = true;
      return "SUCCESS";
    } else {
      load.value = true;
      return resultLogin.toString();
    }
  }
}
