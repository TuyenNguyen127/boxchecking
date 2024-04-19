import 'package:lastapp/model/addressModel.dart';
import 'package:lastapp/model/boxOrderModel.dart';

class OrderModel {
  int id; // id order
  String createdAt; // thời gian tạo
  String finishedAt; // thời gian hoàn thành
  String status; // trạng thái. ví dụ: pending, finished,...
  List<BoxOrderModel> boxes; // list boxOrder
  bool checked; // checkbox
  AddressModel? addressModel; // địa chỉ
  String? description; // mô tả/ghi chú

  OrderModel({
    required this.id,
    required this.createdAt,
    required this.finishedAt,
    required this.status,
    required this.boxes,
    required this.checked,
    this.addressModel,
    this.description,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> boxListJson = json['boxes'];
    List<BoxOrderModel> _boxes =
        boxListJson.map((boxJson) => BoxOrderModel.fromJson(boxJson)).toList();

    AddressModel address = AddressModel(
      phoneNumber: json["orderId"] ?? '',
      name: json["name"] ?? '',
      wardCodeId: json["wardCodeId"] ?? 0,
      districtId: json["districtId"] ?? 0,
      cityId: json["cityId"] ?? 1,
      addressNumber: json["addressNumber"] ?? '',
    );

    return OrderModel(
      id: json["orderId"] ?? 1,
      createdAt: json["date"] ?? '',
      finishedAt: json["date"] ?? '',
      status: json["status"] ?? 'Check',
      boxes: _boxes,
      checked: false,
      addressModel: address,
      description: json['description'] ?? '',
    );
  }

  // Map<String, dynamic> toJson() => {
  //       "type_box": typeBox,
  //       "model_box": modelBox,
  //       "services": services,
  //       "amount": amount
  //     };
}
