// class BoxOrderModel {
//   int id; // id sản phẩm
//   int? typeBox; // loại box . ví dụ: plastic, paper
//   int? modelBox; // size box
//   String services; // dịch vụ
//   String items; // quần áo, hàng hóa
//   // String dimension; // name của typeBox (thông qua id typeBox) + modelBox
//   bool selected; // bool
//   int price; // giá tiền
//   double weight; // cân nặng đơn hàng

//   BoxOrderModel({
//     required this.id,
//     required this.typeBox,
//     required this.modelBox,
//     required this.services,
//     required this.items,
//     // required this.dimension,
//     required this.selected,
//     required this.price,
//     required this.weight,
//   });

//   factory BoxOrderModel.fromJson(Map<String, dynamic> json) {
//     List<dynamic> ser = json["boxServices"];
//     String service_ = '';

//     for (var element in ser) {
//       service_ += element.toString();
//     }

//     return BoxOrderModel(
//       typeBox: json["boxTypeId"] ?? 1,
//       modelBox: json["boxModelId"] ?? 1,
//       services: service_,
//       // dimension: json["dimension"] ?? '',
//       id: json["boxId"] ?? 1,
//       items: json["listItem"] ?? '',
//       selected: false,
//       price: json["price"] ?? 0,
//       weight: json["weight"] ?? 0,
//     );
//   }
//   // Map<String, dynamic> toJson() => {
//   //     "typeBox": boxTypeId,
//   //     "modelBox": boxModelId,
//   //     "services": service_,
//   //     // "dimension": dimension,
//   //     "id": boxId,
//   //     "items": listItem,
//   //     "selected": false,
//   //     "price": price,
//   //     "weight": weight,
//   //     };
// }

class BoxOrderModel {
  int boxId;
  int boxTypeId;
  int boxModelId;
  List<String> listItem;
  List<String> boxServices;
  int weight;
  int quantity;
  String dimension;
  int price;

  BoxOrderModel({
    required this.boxId,
    required this.boxTypeId,
    required this.boxModelId,
    required this.listItem,
    required this.boxServices,
    required this.weight,
    required this.quantity,
    required this.dimension,
    required this.price,
  });

  factory BoxOrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> listItemJson = json['listItem'];
    List<dynamic> boxServicesJson = json['boxServices'];

    return BoxOrderModel(
      boxId: json['boxId'],
      boxTypeId: json['boxTypeId'],
      boxModelId: json['boxModelId'],
      listItem: listItemJson.map((item) => item.toString()).toList(),
      boxServices:
          boxServicesJson.map((service) => service.toString()).toList(),
      weight: json['weight'],
      quantity: json['quantity'],
      dimension: json['dimension'],
      price: json['price'],
    );
  }
}
