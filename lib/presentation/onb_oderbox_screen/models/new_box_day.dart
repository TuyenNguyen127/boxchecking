class NewOrderBoxDay {
  int? typeBox;
  int? modelBox;
  String services;
  int amount;
  bool? selected;

  NewOrderBoxDay({
    required this.typeBox,
    required this.modelBox,
    required this.services,
    required this.amount,
    required this.selected,
  });
  // factory NewOrderBoxDay.fromJson(Map<String, dynamic> json) => NewOrderBoxDay(
  //     typeBox: json["type_box"] ?? 1,
  //     modelBox: json["model_box"] ?? 1,
  //     services: json["services"] ?? '',
  //     amount: json["amount"] ?? '');

  // Map<String, dynamic> toJson() => {
  //       "type_box": typeBox,
  //       "model_box": modelBox,
  //       "services": services,
  //       "amount": amount
  //     };
}
