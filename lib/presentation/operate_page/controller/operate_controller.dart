import '../../../core/app_export.dart';
import '../models/operate_model.dart';

/// A controller class for the OperatePage.
///
/// This class manages the state of the OperatePage, including the
/// current operateModelObj
class OperateController extends GetxController {
  OperateController(this.operateModelObj);

  Rx<OperateModel> operateModelObj;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in operateModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    operateModelObj.value.dropdownItemList.refresh();
  }
}
