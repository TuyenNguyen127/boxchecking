import 'dart:convert';

import 'package:lastapp/model/boxOrder.dart';

class OrderGet {
  int id;
  String status;
  List<BoxOrder> boxs;
  bool checked;

  OrderGet(
      {required this.id,
      required this.status,
      required this.boxs,
      required this.checked});

  factory OrderGet.fromJson(Map<String, dynamic> json) {
    List<dynamic> boxListJson = json['boxs'];
    List<BoxOrder> _boxs =
        boxListJson.map((boxJson) => BoxOrder.fromJson(boxJson)).toList();
    return OrderGet(
      id: json["orderId"] ?? 1,
      status: json["status"] ?? 'Check',
      boxs: _boxs,
      checked: false,
    );
  }

  // Map<String, dynamic> toJson() => {
  //       "type_box": typeBox,
  //       "model_box": modelBox,
  //       "services": services,
  //       "amount": amount
  //     };
}
