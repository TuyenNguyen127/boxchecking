import '../../../core/app_export.dart';

/// This class is used in the [send_item_widget] screen.
class SendItemModel {
  SendItemModel({
    this.id,
    this.widget,
    this.status,
    this.address,
    this.commodity,
    this.service,
    this.type,
    this.note,
    this.callshipper,
    this.editorder,
    this.revoke,
    this.fiftySeven,
  }) {
    id = id ?? Rx("ID");
    widget = widget ?? Rx("33589549623491-001");
    status = status ?? Rx("Pending");
    address = address ?? Rx("144 Xuan Thuy, Cau Giay, Ha Noi");
    commodity =
        commodity ?? Rx("10xQuan Jean; 10xAo so mi; 10xThat lung da");
    service = service ?? Rx("Hang On, Washing");
    type = type ?? Rx("Box");
    note = note ?? Rx("Nothing");
    callshipper = callshipper ?? Rx("Call shipper");
    editorder = editorder ?? Rx("Edit order");
    revoke = revoke ?? Rx("Revoke");
    fiftySeven = fiftySeven ?? Rx("...");
  }

  Rx<String>? id;

  Rx<String>? widget;

  Rx<String>? status;

  Rx<String>? address;

  Rx<String>? commodity;

  Rx<String>? service;

  Rx<String>? type;

  Rx<String>? note;

  Rx<String>? callshipper;

  Rx<String>? editorder;

  Rx<String>? revoke;

  Rx<String>? fiftySeven;
}
