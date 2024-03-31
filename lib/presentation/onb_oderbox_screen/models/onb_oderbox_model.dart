import 'package:lastapp/core/app_export.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [onb_oderbox_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnbOderboxModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Bag",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Box",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "50 x 50 x 50",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "100 x 50 x 50",
    ),
    SelectionPopupModel(
      id: 3,
      title: "100 x 100 x 50",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList2 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Hang On",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Washing",
    )
  ]);
}
