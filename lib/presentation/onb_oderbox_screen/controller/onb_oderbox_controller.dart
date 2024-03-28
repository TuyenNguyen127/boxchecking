import '../../../core/app_export.dart';
import '../models/onb_oderbox_model.dart';
import '../../../model/onb.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

/// A controller class for the OnbOderboxScreen.
///
/// This class manages the state of the OnbOderboxScreen, including the
/// current onbOderboxModelObj
class OnbOderboxController extends GetxController {
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
}

class AppDataController extends GetxController {
  List<SubjectModel> subjectData = [];
  List<MultiSelectItem> dropDownData = [];

  getSubjectData() {
    subjectData.clear();
    dropDownData.clear();

    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {"subject_id": "1", "subject_name": "English"},
        {"subject_id": "2", "subject_name": "Physics"},
        {"subject_id": "3", "subject_name": "Chemistry"},
        {"subject_id": "4", "subject_name": "Geography"},
        {"subject_id": "5", "subject_name": "Math"},
        {"subject_id": "6", "subject_name": "History"},
        {"subject_id": "7", "subject_name": "Computer Science"},
        {"subject_id": "8", "subject_name": "Arts"}
      ]
    };

    if (apiResponse['code'] == 200) {
      List<SubjectModel> tempSubjectData = [];
      apiResponse['data'].forEach(
        (data) {
          tempSubjectData.add(
            SubjectModel(
              subjectId: data['subject_id'],
              subjectName: data['subject_name'],
            ),
          );
        },
      );
      print(tempSubjectData);
      subjectData.addAll(tempSubjectData);

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

class SubjectModel {
  String subjectId;
  String subjectName;
  SubjectModel({
    required this.subjectId,
    required this.subjectName,
  });
}
