import 'package:lastapp/presentation/type_request_screen/controller/type_request_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TypeRequestScreen.
///
/// This class ensures that the TypeRequestController is created when the
/// TypeRequestScreen is first loaded.
class TypeRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeRequestController());
  }
}
