import 'package:lastapp/presentation/onb_oderbox_screen/controller/onb_oderbox_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OnbOderboxScreen.
///
/// This class ensures that the OnbOderboxController is created when the
/// OnbOderboxScreen is first loaded.
class OnbOderboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnbOderboxController());
  }
}
