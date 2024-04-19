import 'package:lastapp/presentation/order_new_box/onb_checking_and_payment_screen/controller/onb_checking_and_payment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnbCheckingAndPaymentScreen.
///
/// This class ensures that the OnbCheckingAndPaymentController is created when the
/// OnbCheckingAndPaymentScreen is first loaded.
class OnbCheckingAndPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnbCheckingAndPaymentController());
  }
}
