import 'package:lastapp/presentation/onb_oderbox_screen/models/new_box.dart';

import '../../../core/app_export.dart';
import '../models/subject_model.dart';
import '../models/onb_oderbox_model.dart';
import '../../../model/onb.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

/// A controller class for the OnbOderboxScreen.
///
/// This class manages the state of the OnbOderboxScreen, including the
/// current onbOderboxModelObj
class OnbOderboxController extends GetxController {
  RxList<NewOrderBox> khueListOrders = <NewOrderBox>[].obs;
  late NewOrderBox newOrderBox;

  var currentList = <NewOrderBox>[].obs;

  Rx<OnbOderboxModel> onbOderboxModelObj = OnbOderboxModel().obs;

  Rx<NewOrderBoxModel> listOrders = NewOrderBoxModel().obs;

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

  refreshDropDown() {
    onSelected(null);
    onSelected1(null);
    onSelected2(null);
  }

  onAdd() {
    refreshDropDown();
    //listOrders.
  }

  void addNewOrderBox(String typeBox, String modelBox, String services) {
    newOrderBox = NewOrderBox(
        typeBox: typeBox, modelBox: modelBox, services: services, amount: 1);
    khueListOrders.add(newOrderBox);

    // print(khueListOrders);
  }

  void removeOrderBox(index) {
    if (khueListOrders.isEmpty) return;

    // int removeIdx = khueListOrders.length - 1;
    // khueListOrders[index].dispose();

    khueListOrders.removeAt(index);
  }

  //
  // multi select
  List<SubjectModel> subjectData = [];
  List<MultiSelectItem> dropDownData = [];

  getSubjectData() {
    subjectData.clear();
    dropDownData.clear();

    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {"subject_id": "1", "service_name": "Hang On"},
        {"subject_id": "2", "service_name": "Washing"},
        {"subject_id": "3", "service_name": "Chemistry"},
      ]
    };

    if (apiResponse['code'] == 200) {
      List<SubjectModel> tempSubjectData = [];
      apiResponse['data'].forEach(
        (data) => {
          tempSubjectData.add(
            SubjectModel(
              subjectId: data['subject_id'],
              subjectName: data['service_name'],
            ),
          )
        },
      );
      // print(tempSubjectData);
      subjectData.addAll(tempSubjectData);
      // print(subjectData);

      dropDownData = subjectData.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.subjectName);
      }).toList();

      update();
    } else if (apiResponse['code'] == 400) {
      print("Show Error model why error occurred..");
    } else {
      print("show some error model like something went worng..");
    }
  }
}
