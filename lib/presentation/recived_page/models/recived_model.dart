import 'package:lastapp/core/app_export.dart';
import '../../../core/app_export.dart';
import 'recived_item_model.dart';

/// This class defines the variables used in the [recived_page],
/// and is typically used to hold data that is passed between different parts of the application.
class RecivedModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<RecivedItemModel>> recivedItemList = Rx([
    RecivedItemModel(
        id: "ID".obs,
        widget: "33589549623491-001".obs,
        status: "Pending".obs,
        xuanThuyCau: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        nguyNVNTuyN: "Nguyễn Văn Tuyển".obs,
        mobileNo: "0123456789".obs,
        nothing: "Nothing".obs,
        callshipper: "Call shipper".obs,
        editorder: "Edit order".obs,
        revoke: "Revoke".obs,
        sixtySix: "...".obs),
    RecivedItemModel(
        id: "ID".obs,
        widget: "33589549623491-002".obs,
        status: "Pending".obs,
        xuanThuyCau: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        nguyNVNTuyN: "Nguyễn Văn Tuyển".obs,
        mobileNo: "0123456789".obs,
        nothing: "Nothing".obs),
    RecivedItemModel(
        id: "ID".obs,
        widget: "33589549623491-003".obs,
        status: "Pending".obs,
        xuanThuyCau: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        nguyNVNTuyN: "Nguyễn Văn Tuyển".obs,
        mobileNo: "0123456789".obs,
        nothing: "Nothing".obs)
  ]);
}
