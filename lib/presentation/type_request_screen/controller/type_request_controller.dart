import '../../../core/app_export.dart';
import '../models/type_request_model.dart';

/// A controller class for the TypeRequestScreen.
///
/// This class manages the state of the TypeRequestScreen, including the
/// current typeRequestModelObj
class TypeRequestController extends GetxController {
  Rx<TypeRequestModel> typeRequestModelObj = TypeRequestModel().obs;
}
