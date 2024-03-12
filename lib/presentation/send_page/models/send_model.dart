import 'package:lastapp/core/app_export.dart';
import '../../../core/app_export.dart';
import 'send_item_model.dart';

/// This class defines the variables used in the [send_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SendModel {
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

  Rx<List<SendItemModel>> sendItemList = Rx([
    SendItemModel(
        id: "ID".obs,
        widget: "33589549623491-001".obs,
        status: "Pending".obs,
        xuanThuyCau: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        hangOnWashing: "Hang On, Washing".obs,
        box: "Box".obs,
        nothing: "Nothing".obs,
        callshipper: "Call shipper".obs,
        editorder: "Edit order".obs,
        revoke: "Revoke".obs,
        fiftySeven: "...".obs),
    SendItemModel(
        id: "ID".obs,
        widget: "33589549623491-002".obs,
        status: "Pending".obs,
        xuanThuyCau: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        hangOnWashing: "Hang On, Washing".obs,
        box: "Box".obs,
        nothing: "Nothing".obs),
    SendItemModel(
        id: "ID".obs,
        widget: "33589549623491-003".obs,
        status: "Pending".obs,
        xuanThuyCau: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        hangOnWashing: "Hang On, Washing".obs,
        box: "Bag".obs,
        nothing: "Nothing".obs)
  ]);
}
