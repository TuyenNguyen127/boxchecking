import '../../../../../core/app_export.dart';
import '../models/received_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the RecivedTabContainerPage.
///
/// This class manages the state of the RecivedTabContainerPage, including the
/// current recivedTabContainerModelObj
class RecivedTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RecivedTabContainerController(this.recivedTabContainerModelObj);

  Rx<RecivedTabContainerModel> recivedTabContainerModelObj;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 2));
}
