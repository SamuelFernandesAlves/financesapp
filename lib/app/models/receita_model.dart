
///Model de user para relizar ações necessarias
class ReceitaModel {
  String tip;
  double value;
  String title;
  String description;
  DateTime data;

  ReceitaModel(

      {this.tip = '',
        this.value = 0.0,
        this.title = '',
        this.description = '',
        this.data,

      });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "tip": tip,
      "value": value,
      "title": title,
      "description": description,
      "data": data,
    };
    return map;
  }

  factory ReceitaModel.fromMap(Map<String, dynamic> dados) {
    return ReceitaModel(
      tip: dados["tip"] ?? "",
      value: dados["value"] ?? "0.0",
      title: dados['title'] ?? "",
      description: dados['description'] ?? "",
      data: dados['data'].toDate() ?? DateTime.now(),

    );
  }

}
