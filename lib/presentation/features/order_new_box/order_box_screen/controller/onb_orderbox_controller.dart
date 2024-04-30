import 'package:lastapp/model/boxOrderModel.dart';

import '../../../../../core/app_export.dart';

/// A controller class for the OnbOrderboxScreen.
///
/// This class manages the state of the OnbOrderboxScreen, including the
/// current onbOrderboxModelObj
class OnbOrderboxController extends GetxController {
  RxList<BoxOrderModel> listBoxes = <BoxOrderModel>[].obs;

  List<List<int>> boxServices = [];

  void addBoxesToOrder(List<BoxOrderModel> _listBoxes) {
    listBoxes.clear();
    for (var boxItem in _listBoxes) {
      listBoxes.add(boxItem);
    }
  }
}
