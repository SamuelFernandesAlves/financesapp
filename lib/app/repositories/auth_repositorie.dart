
import 'package:financesapp/app/models/receita_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../providers/firebase_provider.dart';


class AuthRepositorie {

  FirebaseProvider _firebaseProvider;

  AuthRepositorie(){
    this._firebaseProvider = Get.find<FirebaseProvider>();
  }
  Future registerUser(String name,String email, String senha){
    _firebaseProvider = Get.find<FirebaseProvider>();
    return _firebaseProvider.registerUser(name,email,senha);
  }

  Future loginUser(String email, String senha){
    _firebaseProvider = Get.find<FirebaseProvider>();
    return _firebaseProvider.loginUser(email,senha);
  }

  Future recuperarUser(){
    _firebaseProvider = Get.find<FirebaseProvider>();
    return _firebaseProvider.recuperarDadosUsuario();
  }

  Future addReceita(ReceitaModel receitaModel){
    _firebaseProvider = Get.find<FirebaseProvider>();
    return _firebaseProvider.addReceita(receitaModel);
  }


  Future<List<ReceitaModel>> recuperarReceitar(){
    _firebaseProvider = Get.find<FirebaseProvider>();
    return _firebaseProvider.recuperarReceitar();
  }

}