import '../../../core/app_export.dart';

/// This class is used in the [send_item_widget] screen.
class SendItemModel {
  SendItemModel({
    this.id,
    this.widget,
    this.status,
    this.xuanThuyCau,
    this.xQuanJeanxAo,
    this.hangOnWashing,
    this.box,
    this.nothing,
    this.callshipper,
    this.editorder,
    this.revoke,
    this.fiftySeven,
  }) {
    id = id ?? Rx("ID");
    widget = widget ?? Rx("33589549623491-001");
    status = status ?? Rx("Pending");
    xuanThuyCau = xuanThuyCau ?? Rx("144 Xuan Thuy, Cau Giay, Ha Noi");
    xQuanJeanxAo =
        xQuanJeanxAo ?? Rx("10xQuan Jean; 10xAo so mi; 10xThat lung da");
    hangOnWashing = hangOnWashing ?? Rx("Hang On, Washing");
    box = box ?? Rx("Box");
    nothing = nothing ?? Rx("Nothing");
    callshipper = callshipper ?? Rx("Call shipper");
    editorder = editorder ?? Rx("Edit order");
    revoke = revoke ?? Rx("Revoke");
    fiftySeven = fiftySeven ?? Rx("...");
    id = id ?? Rx("");
  }

  Rx<String>? id;

  Rx<String>? widget;

  Rx<String>? status;

  Rx<String>? xuanThuyCau;

  Rx<String>? xQuanJeanxAo;

  Rx<String>? hangOnWashing;

  Rx<String>? box;

  Rx<String>? nothing;

  Rx<String>? callshipper;

  Rx<String>? editorder;

  Rx<String>? revoke;

  Rx<String>? fiftySeven;
}
