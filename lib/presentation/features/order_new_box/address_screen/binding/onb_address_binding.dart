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
