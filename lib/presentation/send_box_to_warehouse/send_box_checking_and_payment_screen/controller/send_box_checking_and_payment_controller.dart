import '../../../../core/app_export.dart';
import '../models/send_box_checking_and_payment_model.dart';

/// A controller class for the SendBoxCheckingAndPaymentScreen.
///
/// This class manages the state of the SendBoxCheckingAndPaymentScreen, including the
/// current sendBoxCheckingAndPaymentModelObj
class SendBoxCheckingAndPaymentController extends GetxController {
  Rx<SendBoxCheckingAndPaymentModel> sendBoxCheckingAndPaymentModelObj =
      SendBoxCheckingAndPaymentModel().obs;

  Rx<bool> agreethetermsofuse = false.obs;
}
