import '../../../../../core/app_export.dart';
import '../../../../../model/orderModel.dart';
import '../models/send_box_choose_box_model.dart';

/// A controller class for the SendBoxChooseBoxScreen.
///
/// This class manages the state of the SendBoxChooseBoxScreen, including the
/// current sendBoxChooseBoxModelObj
class SendBoxChooseBoxController extends GetxController {
  Rx<SendBoxChooseBoxModel> sendBoxChooseBoxModelObj =
      SendBoxChooseBoxModel().obs;

  RxList<OrderModel> listOrders = <OrderModel>[].obs;

  void clearData() {
    listOrders.clear();
  }
}
