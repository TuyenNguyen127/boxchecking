class BoxOrderModel {
  int id;
  int? typeBox;
  int? modelBox;
  String services;
  String items;
  // String dimension;
  bool selected;
  int price;
  int weight;

  BoxOrderModel({
    required this.id, // id sản phẩm
    required this.typeBox, // loại box . ví dụ: plastic, paper
    required this.modelBox, // size box
    required this.services, // dịch vụ
    required this.items, // quần áo, hàng hóa
    // required this.dimension, // name của typeBox (thông qua id typeBox) + modelBox
    required this.selected, // bool
    required this.price, // giá tiền của order box
    required this.weight, // cân nặng đơn hàng
  });
  factory BoxOrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> ser = json["boxServices"];
    String service_ = '';
    for (var element in ser) {
      service_ += element.toString();
    }
    return BoxOrderModel(
        typeBox: json["boxTypeId"] ?? 1,
        modelBox: json["boxModelId"] ?? 1,
        services: service_,
        // dimension: json["dimension"] ?? '',
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
