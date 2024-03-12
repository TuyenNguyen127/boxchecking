import '../../../core/app_export.dart';
import '../models/onb_address_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the OnbAddressScreen.
///
/// This class manages the state of the OnbAddressScreen, including the
/// current onbAddressModelObj
class OnbAddressController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  TextEditingController addressController2 = TextEditingController();

  TextEditingController typeController = TextEditingController();

  Rx<OnbAddressModel> onbAddressModelObj = OnbAddressModel().obs;

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    fullNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    addressController1.dispose();
    addressController2.dispose();
    typeController.dispose();
  }
}
