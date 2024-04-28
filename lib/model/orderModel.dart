import 'package:lastapp/model/boxOrderModel.dart';

class OrderModel {
  int orderId;
  String status;
  String shipStatusName;
  List<BoxOrderModel> boxes;
  String name;
  String phoneNumber;
  String address;
  String date;
  String toWardCode;
  int toDistrictId;
  bool? checked = false;

  OrderModel( 
    {
    required this.orderId,
    required this.status,
    required this.shipStatusName,
    required this.boxes,
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.date,
    required this.toWardCode,
    required this.toDistrictId,
  });
}
