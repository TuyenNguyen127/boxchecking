import 'package:lastapp/model/orderModel.dart';

import '../../../core/app_export.dart';
import '../models/home_container_model.dart';

class HomeContainerController extends GetxController {
  RxList<OrderModel> listOrderByUser = <OrderModel>[].obs;
  
}
