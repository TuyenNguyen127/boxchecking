import 'package:get/get.dart';

/// A binding class for the OnbCheckingAndPaymentScreen.
///
/// This class ensures that the OnbCheckingAndPaymentController is created when the
/// OnbCheckingAndPaymentScreen is first loaded.
class OnbCheckingAndPaymentBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => OnbCheckingAndPaymentController());
  }
}
