import '../../../core/app_export.dart';
import '../models/onb_oderbox_model.dart';

/// A controller class for the OnbOderboxScreen.
///
/// This class manages the state of the OnbOderboxScreen, including the
/// current onbOderboxModelObj
class OnbOderboxController extends GetxController {
  Rx<OnbOderboxModel> onbOderboxModelObj = OnbOderboxModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  onSelected(dynamic value) {
    for (var element in onbOderboxModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    onbOderboxModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in onbOderboxModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    onbOderboxModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in onbOderboxModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    onbOderboxModelObj.value.dropdownItemList2.refresh();
  }
}
