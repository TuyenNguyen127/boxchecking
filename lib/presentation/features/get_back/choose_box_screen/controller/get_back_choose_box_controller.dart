import 'package:lastapp/model/orderModel.dart';

import '../../../../../core/app_export.dart';
import '../models/get_back_choose_box_model.dart';
import 'package:lastapp/model/selectionPopupModel/selection_popup_model.dart';

/// A controller class for the GetBackChooseBoxScreen.
///
/// This class manages the state of the GetBackChooseBoxScreen, including the
/// current getBackChooseBoxModelObj
class GetBackChooseBoxController extends GetxController {
  Rx<GetBackChooseBoxModel> getBackChooseBoxModelObj =
      GetBackChooseBoxModel().obs;

  RxList<OrderModel> listOrders = <OrderModel>[].obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  onSelected(dynamic value) {
    for (var element in getBackChooseBoxModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    getBackChooseBoxModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element
        in getBackChooseBoxModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    getBackChooseBoxModelObj.value.dropdownItemList1.refresh();
  }
}
