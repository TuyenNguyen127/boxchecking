import '../../../core/app_export.dart';
import '../models/onb_checking_and_payment_model.dart';

/// A controller class for the OnbCheckingAndPaymentScreen.
///
/// This class manages the state of the OnbCheckingAndPaymentScreen, including the
/// current onbCheckingAndPaymentModelObj
class OnbCheckingAndPaymentController extends GetxController {
  Rx<OnbCheckingAndPaymentModel> onbCheckingAndPaymentModelObj =
      OnbCheckingAndPaymentModel().obs;

  Rx<bool> agreethetermsofuse = false.obs;
}
