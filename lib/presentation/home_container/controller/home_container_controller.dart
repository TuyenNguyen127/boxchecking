import 'package:lastapp/model/orderModel.dart';

import '../../../core/app_export.dart';

class HomeContainerController extends GetxController {
  RxList<OrderModel> listOrderByUser = <OrderModel>[].obs;
}
