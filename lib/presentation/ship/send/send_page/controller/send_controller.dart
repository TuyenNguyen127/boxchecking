// import '../../../core/app_export.dart';
// import '../models/send_model.dart';

// /// A controller class for the SendPage.
// ///
// /// This class manages the state of the SendPage, including the
// /// current sendModelObj
// class SendController extends GetxController {
//   SendController(this.sendModelObj);

//   Rx<SendModel> sendModelObj;

//   SelectionPopupModel? selectedDropDownValue;

//   onSelected(dynamic value) {
//     for (var element in sendModelObj.value.dropdownItemList.value) {
//       element.isSelected = false;
//       if (element.id == value.id) {
//         element.isSelected = true;
//       }
//     }
//     sendModelObj.value.dropdownItemList.refresh();
//   }
// }
