import 'package:lastapp/presentation/features/send_box_to_warehouse/address_screen/controller/send_box_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SendBoxAddressScreen.
///
/// This class ensures that the SendBoxAddressController is created when the
/// SendBoxAddressScreen is first loaded.
class SendBoxAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendBoxAddressController());
  }
}
