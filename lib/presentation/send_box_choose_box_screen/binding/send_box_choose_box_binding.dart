import 'package:lastapp/presentation/send_box_choose_box_screen/controller/send_box_choose_box_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SendBoxChooseBoxScreen.
///
/// This class ensures that the SendBoxChooseBoxController is created when the
/// SendBoxChooseBoxScreen is first loaded.
class SendBoxChooseBoxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendBoxChooseBoxController());
  }
}
