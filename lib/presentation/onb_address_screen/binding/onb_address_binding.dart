import 'package:lastapp/presentation/onb_address_screen/controller/onb_address_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnbAddressScreen.
///
/// This class ensures that the OnbAddressController is created when the
/// OnbAddressScreen is first loaded.
class OnbAddressBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => OnbAddressController());
  }
}
