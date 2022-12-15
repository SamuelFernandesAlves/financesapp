
///Model de user para relizar ações necessarias
class UsuarioModel {
  String nome;
  String email;
  String id;
  String other;

  UsuarioModel(
      {this.nome = '',
        this.email = '',
        this.id = '',
        this.other= '',
      });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": nome,
      "email": email,
      "id_Firebase": id,
      "other": other,
    };
    return map;
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> dados) {
    return UsuarioModel(
      nome: dados["name"] ?? "",
      email: dados['email'] ?? "",
      id: dados['id_Firebase'] ?? "",
      other: dados['other'] ?? "",

    );
  }


}
