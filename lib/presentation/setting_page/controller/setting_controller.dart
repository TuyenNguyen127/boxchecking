import '../../../core/app_export.dart';
import '../models/setting_model.dart';

/// A controller class for the SettingPage.
///
/// This class manages the state of the SettingPage, including the
/// current settingModelObj
class SettingController extends GetxController {
  SettingController(this.settingModelObj);

  Rx<SettingModel> settingModelObj;
}
