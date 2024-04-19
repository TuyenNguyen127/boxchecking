import '../../../../core/app_export.dart';
import '../../../../model/orderModel.dart';
import '../models/send_box_choose_box_model.dart';

/// A controller class for the SendBoxChooseBoxScreen.
///
/// This class manages the state of the SendBoxChooseBoxScreen, including the
/// current sendBoxChooseBoxModelObj
class SendBoxChooseBoxController extends GetxController {
  Rx<SendBoxChooseBoxModel> sendBoxChooseBoxModelObj =
      SendBoxChooseBoxModel().obs;

  RxList<OrderModel> listOrders = <OrderModel>[].obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  onSelected(dynamic value) {
    for (var element in sendBoxChooseBoxModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    sendBoxChooseBoxModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element
        in sendBoxChooseBoxModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    sendBoxChooseBoxModelObj.value.dropdownItemList1.refresh();
  }
}
