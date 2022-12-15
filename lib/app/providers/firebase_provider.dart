import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;

import '../models/models.dart';
import '../models/receita_model.dart';
import '../modules/utilities/assets_names.dart';

class FirebaseProvider extends GetxService {
  final fba.FirebaseAuth _auth = fba.FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<FirebaseProvider> init() async {
    return this;
  }

  Future<List<ReceitaModel>> recuperarReceitar() async {

      var response = await db
          .collection(NamesCustom.FIREBASEUSERCOLLECTION)
          .doc(_auth.currentUser.uid)
          .collection(NamesCustom.FIREBASERECEITACOLLECTION).get();
          print(response);
      return response.docs.map((e) => ReceitaModel.fromMap(e.data())).toList();

  }


  Future addReceita(ReceitaModel receitaModel) async {
    try {
      String id = db
          .collection(NamesCustom.FIREBASEUSERCOLLECTION)
          .doc(_auth.currentUser.uid)
          .collection(NamesCustom.FIREBASERECEITACOLLECTION)
          .doc()
          .id;

      await db
          .collection(NamesCustom.FIREBASEUSERCOLLECTION)
          .doc(_auth.currentUser.uid)
          .collection(NamesCustom.FIREBASERECEITACOLLECTION)
          .doc(id)
          .set(receitaModel.toMap());
      return "SUCESS";
    } catch (e) {
      return "Erro ao realizar operação, por favor tente mais tarde";
    }
  }

  Future recuperarDadosUsuario() async {
    User user = _auth.currentUser;
    UsuarioModel usuario = UsuarioModel();
    DocumentSnapshot snapshot = await db.collection(NamesCustom.FIREBASEUSERCOLLECTION).doc(user.uid).get();
    usuario = UsuarioModel.fromMap(snapshot.data() as Map<String, dynamic>);
    return usuario;
  }
  Future registerUser(String name, String email, String passoword) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: passoword);
      db.collection(NamesCustom.FIREBASEUSERCOLLECTION).doc(_auth.currentUser.uid).set({
        "name": name,
        "email": email,
        "id_Firebase": _auth.currentUser.uid,
      });
      return true;
    } on FirebaseException catch (error) {
      String errorMessage;
      switch (error.code) {
        case "invalid-email":
          errorMessage = "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;
        case "wrong-password":
          errorMessage = "Senha errada!";
          return errorMessage;

        case "user-not-found":
          errorMessage = "O usuário não existe, verifique os dados e tente novamente!";

          return errorMessage;
        case "user-disable":
          errorMessage = "Esse usuário foi desabilitado.";
          return errorMessage;

        case "too-many-requests":
          errorMessage = "Muitas requisições. Tente mais tarde.";
          return errorMessage;

        case "operation-not-allowed":
          errorMessage = "Login com email e senha não está habilitado.";
          return errorMessage;

        case "email-already-in-use":
          errorMessage = "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }

  Future loginUser(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      return true;
    } on FirebaseException catch (error) {
      String errorMessage;
      switch (error.code) {
        case "invalid-email":
          errorMessage = "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;
        case "wrong-password":
          errorMessage = "Senha errada!";
          return errorMessage;

        case "user-not-found":
          errorMessage = "O usuário não existe, verifique os dados e tente novamente!";

          return errorMessage;
        case "user-disable":
          errorMessage = "Esse usuário foi desabilitado.";
          return errorMessage;

        case "too-many-requests":
          errorMessage = "Muitas requisições. Tente mais tarde.";
          return errorMessage;

        case "operation-not-allowed":
          errorMessage = "Login com email e senha não está habilitado.";
          return errorMessage;

        case "email-already-in-use":
          errorMessage = "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }
}
