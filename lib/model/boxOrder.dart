class BoxOrder {
  int id;
  int? typeBox;
  int? modelBox;
  String services;
  String items;
  String dimension;
  bool selected;
  int price;
  int weight;

  BoxOrder({
    required this.id,
    required this.typeBox,
    required this.modelBox,
    required this.services,
    required this.items,
    required this.dimension,
    required this.selected,
    required this.price,
    required this.weight
  });
  factory BoxOrder.fromJson(Map<String, dynamic> json) {
    List<dynamic> ser = json["boxServices"];
    String service_ = '';
    for (var element in ser) {
      service_ += element.toString();
    }
    return BoxOrder(
      typeBox: json["boxTypeId"] ?? 1,
      modelBox: json["boxModelId"] ?? 1,
      services: service_,
      dimension: json["dimension"] ?? '', 
      id: json["boxId"] ?? 1, 
      items: json["listItem"] ?? '', 
      selected: false,
      price: json["price"] ?? 0,
      weight: json["weight"] ?? 0);
  }
  // Map<String, dynamic> toJson() => {
  //       "type_box": typeBox,
  //       "model_box": modelBox,
  //       "services": services,
  //       "amount": amount
  //     };
}
