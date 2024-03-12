import '../../../core/app_export.dart';

/// This class is used in the [recived_item_widget] screen.
class RecivedItemModel {
  RecivedItemModel({
    this.id,
    this.widget,
    this.status,
    this.xuanThuyCau,
    this.xQuanJeanxAo,
    this.nguyNVNTuyN,
    this.mobileNo,
    this.nothing,
    this.callshipper,
    this.editorder,
    this.revoke,
    this.sixtySix,
    this.id,
  }) {
    id = id ?? Rx("ID");
    widget = widget ?? Rx("33589549623491-001");
    status = status ?? Rx("Pending");
    xuanThuyCau = xuanThuyCau ?? Rx("144 Xuan Thuy, Cau Giay, Ha Noi");
    xQuanJeanxAo =
        xQuanJeanxAo ?? Rx("10xQuan Jean; 10xAo so mi; 10xThat lung da");
    nguyNVNTuyN = nguyNVNTuyN ?? Rx("Nguyễn Văn Tuyển");
    mobileNo = mobileNo ?? Rx("0123456789");
    nothing = nothing ?? Rx("Nothing");
    callshipper = callshipper ?? Rx("Call shipper");
    editorder = editorder ?? Rx("Edit order");
    revoke = revoke ?? Rx("Revoke");
    sixtySix = sixtySix ?? Rx("...");
    id = id ?? Rx("");
  }

  Rx<String>? id;

  Rx<String>? widget;

  Rx<String>? status;

  Rx<String>? xuanThuyCau;

  Rx<String>? xQuanJeanxAo;

  Rx<String>? nguyNVNTuyN;

  Rx<String>? mobileNo;

  Rx<String>? nothing;

  Rx<String>? callshipper;

  Rx<String>? editorder;

  Rx<String>? revoke;

  Rx<String>? sixtySix;

  Rx<String>? id;
}
