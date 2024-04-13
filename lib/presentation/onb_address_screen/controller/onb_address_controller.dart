import 'package:lastapp/model/address.dart';

import '../../../core/app_export.dart';
import '../models/onb_address_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the OnbAddressScreen.
///
/// This class manages the state of the OnbAddressScreen, including the
/// current onbAddressModelObj
class OnbAddressController extends GetxController {
  RxList<String> phoneNumberStringList = <String>[].obs;
  TextEditingController phoneNumberController = TextEditingController();

  RxList<String> fullNameStringList = <String>[].obs;
  TextEditingController fullNameController = TextEditingController();

  RxList<String> addressStringList = <String>[].obs;
  TextEditingController addressController = TextEditingController();

  RxList<String> towardCodeStringList = <String>[].obs;
  TextEditingController towardCodeController = TextEditingController();

  RxList<String> districtIdStringList = <String>[].obs;
  TextEditingController districtIdController = TextEditingController();

  RxList<DateTime> dateTimeList = <DateTime>[].obs;
  Rx<DateTime> dateController = DateTime.now().obs;

  RxList<Address> tuyenListAddress = <Address>[].obs;
  late Address newAddress;

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    fullNameController.dispose();
    addressController.dispose();
    towardCodeController.dispose();
    // addressController1.dispose();
    districtIdController.dispose();
    // typeController.dispose();
  }

  @override
  void onInit() {
    super.onInit();

    fullNameController = TextEditingController(
      text: fullNameStringList.length > 0 ? fullNameStringList.last : '',
    );
    phoneNumberController = TextEditingController(
      text: phoneNumberStringList.length > 0 ? phoneNumberStringList.last : '',
    );
    addressController = TextEditingController(
      text: addressStringList.length > 0 ? addressStringList.last : '',
    );
    towardCodeController = TextEditingController(
      text: towardCodeStringList.length > 0 ? towardCodeStringList.last : '',
    );
    districtIdController = TextEditingController(
      text: districtIdStringList.length > 0 ? districtIdStringList.last : '',
    );
    // typeController = TextEditingController(
    //   text: typeStringList.length > 0 ? typeStringList.last : '',
    // );
    dateController.value =
        dateTimeList.length > 0 ? dateTimeList.last : DateTime.now();
  }

  void addFullname(value) {
    if (fullNameStringList.length > 0) {
      fullNameStringList.clear();
    }

    fullNameStringList.add(value);
  }

  void addPhoneNumber(value) {
    if (phoneNumberStringList.length > 0) {
      phoneNumberStringList.clear();
    }

    phoneNumberStringList.add(value);
  }

  void addAddress(value) {
    if (addressStringList.length > 0) {
      addressStringList.clear();
    }

    addressStringList.add(value);
  }

  void addTowardCode(value) {
    if (towardCodeStringList.length > 0) {
      towardCodeStringList.clear();
    }

    towardCodeStringList.add(value);
  }

  void addDistrictId(value) {
    if (districtIdStringList.length > 0) {
      districtIdStringList.clear();
    }

    districtIdStringList.add(value);
  }

  void addDate(value) {
    if (dateTimeList.length > 0) {
      dateTimeList.clear();
    }

    dateTimeList.add(value);
  }

  void addNewAddress(newAddress) {
    print(newAddress.name);
    print(newAddress.phoneNumber);
    print(newAddress.date);
    print(newAddress.address);
    print(newAddress.towardCode);
    print(newAddress.districtId);

    tuyenListAddress.add(newAddress);
  }

  void removeAddress(index) {
    // if (tuyenListAddress.isEmpty) return;
    // tuyenListAddress.removeAt(index);
  }
}
