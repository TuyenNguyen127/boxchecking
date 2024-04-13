import 'package:lastapp/core/app_export.dart';
import '../../../core/app_export.dart';
import 'send_item_model.dart';

/// This class defines the variables used in the [send_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SendModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "14 days ago",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "1 month ago",
    ),
    SelectionPopupModel(
      id: 3,
      title: "3 months ago",
    )
  ]);

  Rx<List<SendItemModel>> sendItemList = Rx([
    SendItemModel(
        id: "ID".obs,
        widget: "33589549623491-001".obs,
        status: "Pending".obs,
        address: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        service: "Hang On, Washing".obs,
        type: "Box".obs,
        note: "Nothing".obs),
    SendItemModel(
        id: "ID".obs,
        widget: "33589549623491-002".obs,
        status: "Pending".obs,
        address: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        service: "Hang On, Washing".obs,
        type: "Box".obs,
        note: "Nothing".obs),
    SendItemModel(
        id: "ID".obs,
        widget: "33589549623491-003".obs,
        status: "Pending".obs,
        address: "144 Xuan Thuy, Cau Giay, Ha Noi".obs,
        commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        service: "Hang On, Washing".obs,
        type: "Bag".obs,
        note: "Nothing".obs)
  ]);
}
