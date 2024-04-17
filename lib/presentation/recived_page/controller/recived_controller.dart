// import '../../../core/app_export.dart';
// import '../models/recived_model.dart';

// /// A controller class for the RecivedPage.
// ///
// /// This class manages the state of the RecivedPage, including the
// /// current recivedModelObj
// class RecivedController extends GetxController {
//   RecivedController(this.recivedModelObj);

//   Rx<RecivedModel> recivedModelObj;

//   SelectionPopupModel? selectedDropDownValue;

//   onSelected(dynamic value) {
//     for (var element in recivedModelObj.value.dropdownItemList.value) {
//       element.isSelected = false;
//       if (element.id == value.id) {
//         element.isSelected = true;
//       }
//     }
//     recivedModelObj.value.dropdownItemList.refresh();
//   }
// }
