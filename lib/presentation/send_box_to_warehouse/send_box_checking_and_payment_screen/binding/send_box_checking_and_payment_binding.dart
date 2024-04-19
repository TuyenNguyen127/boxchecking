import 'package:lastapp/presentation/send_box_to_warehouse/send_box_checking_and_payment_screen/controller/send_box_checking_and_payment_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SendBoxCheckingAndPaymentScreen.
///
/// This class ensures that the SendBoxCheckingAndPaymentController is created when the
/// SendBoxCheckingAndPaymentScreen is first loaded.
class SendBoxCheckingAndPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendBoxCheckingAndPaymentController());
  }
}
