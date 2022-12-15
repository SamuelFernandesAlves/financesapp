import 'package:financesapp/app/modules/utilities/assets_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/models.dart';
import '../../../models/receita_model.dart';
import '../../../repositories/auth_repositorie.dart';
import '../../routes/app_routes.dart';

class HomeController extends GetxController {
  UsuarioModel usuario;
  AuthRepositorie authRepositorie;
  FirebaseAuth _auth;
  final GetStorage _box = GetStorage();
  final RxDouble totalRceita = 0.0.obs;
  final RxDouble totalDespesas = 0.0.obs;
  final RxDouble totalGeral = 0.0.obs;

  final receitas = <ReceitaModel>[].obs;


  RxBool loadDados = false.obs;

  HomeController(){
    usuario = UsuarioModel();
    authRepositorie = AuthRepositorie();
    _auth = FirebaseAuth.instance;
}

  @override
  Future<void> onInit() async {
    await recuperarDadosUser();
    super.onInit();
  }

  RxBool visibleValue = true.obs;


  void openVisibleValues(){
    visibleValue.value = !visibleValue.value;
  }


  recuperarDadosUser() async {
    totalRceita.value = 0.0;
    totalDespesas.value = 0.0;
    totalGeral.value = 0.0;
    receitas.clear();
    loadDados.value = true;
    usuario = await authRepositorie.recuperarUser();
    receitas(await authRepositorie.recuperarReceitar());
    receitas.sort((a, b) => b.data.compareTo(a.data));

    for(int i =0;i<receitas.length;i++ ){
      if(receitas[i].tip == NamesCustom.RECEITA){
        totalRceita.value = totalRceita.value +  receitas[i].value;
        print("Receita${totalRceita.value}");
      }else{
        totalDespesas.value =  totalDespesas.value + receitas[i].value;
        print("Despesa${totalRceita.value}");
      }
    }
    totalGeral.value = totalRceita.value - totalDespesas.value;
    loadDados.value = false;
  }

  sighOut() async {
    dynamic result = await verificarUserLogado();
    if (result == true) {
      Get.toNamed(Routes.LOGIN);
    }
  }

  Future<bool> verificarUserLogado() async {
    usuario = new UsuarioModel();
    await _auth.signOut();
    await _box.remove('current_user');
    User user = _auth.currentUser;
    return user == null ? true : false;
  }
}
