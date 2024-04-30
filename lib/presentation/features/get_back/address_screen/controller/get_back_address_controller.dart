import 'package:lastapp/model/addressModel.dart';

import '../../../../../core/app_export.dart';
import 'package:flutter/material.dart';

/// A controller class for the GetBackAddressScreen.
///
/// This class manages the state of the GetBackAddressScreen, including the
/// current getBackAddressModelObj
class GetBackAddressController extends GetxController {
  RxList<String> phoneNumberStringList = <String>[].obs;
  TextEditingController phoneNumberController = TextEditingController();

  RxList<String> fullNameStringList = <String>[].obs;
  TextEditingController fullNameController = TextEditingController();

  RxList<String> addressStringList = <String>[].obs;
  TextEditingController addressController = TextEditingController();

  RxList<String> towardCodeStringList = <String>[].obs;
  TextEditingController towardCodeController = TextEditingController();

  RxList<String> provinceStringList = <String>[].obs;
  TextEditingController provinceController = TextEditingController();

  RxList<String> districtIdStringList = <String>[].obs;
  TextEditingController districtIdController = TextEditingController();

  late RxList<AddressModel> tuyenListAddress = <AddressModel>[].obs;
  late AddressModel newAddress;

  List<dynamic> dataProvince = [];
  List<dynamic> dataDistrict = [];
  List<dynamic> dataWard = [];
  late int? selectedProvinceId = null;
  late int? selectedDistrictId = null;
  late String? selectedWardId = null;

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    fullNameController.dispose();
    addressController.dispose();
    towardCodeController.dispose();
    districtIdController.dispose();
    provinceController.dispose();
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
    provinceController = TextEditingController(
      text: provinceStringList.length > 0 ? provinceStringList.last : '',
    );
    // typeController = TextEditingController(
    //   text: typeStringList.length > 0 ? typeStringList.last : '',
    // );
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

  void addNewAddress(newAddress) {
    print('oke');
    tuyenListAddress.add(newAddress);
  }

  void removeAddress(index) {
    // if (tuyenListAddress.isEmpty) return;
    // tuyenListAddress.removeAt(index);
  }
}
