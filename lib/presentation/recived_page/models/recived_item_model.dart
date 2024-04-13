import '../../../core/app_export.dart';

/// This class is used in the [recived_item_widget] screen.
class RecivedItemModel {
  RecivedItemModel(
      {this.id,
      this.widget,
      this.status,
      this.address,
      this.commodity,
      this.name,
      this.mobileNo,
      this.nothing,
      this.callshipper,
      this.editorder,
      this.revoke,
      this.sixtySix}) {
    id = id ?? Rx("ID");
    widget = widget ?? Rx("33589549623491-001");
    status = status ?? Rx("Pending");
    address = address ?? Rx("144 Xuan Thuy, Cau Giay, Ha Noi");
    commodity =
        commodity ?? Rx("10xQuan Jean; 10xAo so mi; 10xThat lung da");
    name = name ?? Rx("Nguyễn Văn Tuyển");
    mobileNo = mobileNo ?? Rx("0123456789");
    nothing = nothing ?? Rx("Nothing");
    callshipper = callshipper ?? Rx("Call shipper");
    editorder = editorder ?? Rx("Edit order");
    revoke = revoke ?? Rx("Revoke");
    sixtySix = sixtySix ?? Rx("...");
  }

  Rx<String>? id;

  Rx<String>? widget;

  Rx<String>? status;

  Rx<String>? address;

  Rx<String>? commodity;

  Rx<String>? name;

  Rx<String>? mobileNo;

  Rx<String>? nothing;

  Rx<String>? callshipper;

  Rx<String>? editorder;

  Rx<String>? revoke;

  Rx<String>? sixtySix;
}
