

class NewOrderBox {
  int? typeBox;
  int? modelBox;
  String services;
  NewOrderBox({
    required this.typeBox,
    required this.modelBox,
    required this.services,
  });
  factory NewOrderBox.fromJson(Map<String, dynamic> json) => NewOrderBox(
        typeBox: json["type_box"] ?? 1,
        modelBox: json["model_box"] ?? 1,
        services: json["services"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "type_box": typeBox,
        "model_box": modelBox,
        "services": services,
      };
}
