import 'package:lastapp/model/boxOrderModel.dart';

import '../../../../core/app_export.dart';
import '../../../../model/orderModel.dart';
import '../models/send_box_choose_box_model.dart';
import 'package:lastapp/model/selectionPopupModel/selection_popup_model.dart';

/// A controller class for the SendBoxChooseBoxScreen.
///
/// This class manages the state of the SendBoxChooseBoxScreen, including the
/// current sendBoxChooseBoxModelObj
class SendBoxChooseBoxController extends GetxController {
  Rx<SendBoxChooseBoxModel> sendBoxChooseBoxModelObj =
      SendBoxChooseBoxModel().obs;

  RxList<OrderModel> listOrders = <OrderModel>[
    OrderModel(
        orderId: 1,
        status: "WaitingGetBack",
        shipStatusName: "Finished",
        boxes: [
          BoxOrderModel(
              boxId: 1,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 50000),
          BoxOrderModel(
              boxId: 2,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 80000)
        ],
        name: "Do Ngoc Long",
        phoneNumber: "0123456789",
        address: "Toa song Da, Pham Hung",
        date: "22-4-2024",
        toWardCode: "1",
        toDistrictId: 1)
  ].obs;

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
