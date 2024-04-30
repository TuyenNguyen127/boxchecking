import 'package:lastapp/presentation/features/get_back/choose_box_screen/controller/get_back_choose_box_controller.dart';
import 'package:get/get.dart';

/// A binding class for the GetBackChooseBoxScreen.
///
/// This class ensures that the GetBackChooseBoxController is created when the
/// GetBackChooseBoxScreen is first loaded.
class GetBackChooseBoxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetBackChooseBoxController());
  }
}
