import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/model/addressModel.dart';
import 'package:http/http.dart' as http;

import 'controller/onb_address_controller.dart';

// ignore_for_file: must_be_immutable
class OnbAddressScreen extends StatefulWidget {
  OnbAddressScreen({Key? key}) : super(key: key);

  @override
  State<OnbAddressScreen> createState() => _OnbAddressScreenState();
}

class _OnbAddressScreenState extends State<OnbAddressScreen> {
  OnbAddressController addressGetXController = Get.put(OnbAddressController());

  TextEditingController phoneNumberController = TextEditingController();
  bool isErrorPhoneNumber = false;

  TextEditingController fullNameController = TextEditingController();
  bool isErrorFullname = false;

  TextEditingController wardCodeController = TextEditingController();
  bool isErrorWardCode = false;

  TextEditingController districtController = TextEditingController();
  bool isErrorDistrict = false;

  TextEditingController cityController = TextEditingController();
  bool isErrorCity = false;

  TextEditingController addressController = TextEditingController();
  bool isErrorAddress = false;

  List<dynamic> dataProvince = [
    {
      "ProvinceName": "0",
      "ProvinceID": 0,
    },
  ];

  List<dynamic> dataDistrict = [
    {"ProvinceID": 0, "DistrictID": 1, "DistrictName": ""},
  ];

  List<dynamic> dataWard = [
    {"ProvinceID": 0, "DistrictID": 1, "WardCode": "1", "WardName": ""}
  ];

  Future<void> getDataProvince() async {
    try {
      var uri = Uri.https(dotenv.get('HOST'), '/api/Address/GetProvince');
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "ngrok-skip-browser-warning": "69420",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          dataProvince = jsonResponse['data'];
          dataProvince
              .sort((a, b) => a["ProvinceName"].compareTo(b["ProvinceName"]));
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make API request.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> getDataDistrict(provinceId) async {
    try {
      var uri = Uri.https(dotenv.get('HOST'), '/api/Address/GetDistricts',
          {'provinceId': '${provinceId}'});
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "ngrok-skip-browser-warning": "69420",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          dataDistrict = jsonResponse['data'];
          dataDistrict
              .sort((a, b) => a["DistrictName"].compareTo(b["DistrictName"]));
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make API request.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future<void> getDataWard(int districtId) async {
    try {
      var uri = Uri.https(dotenv.get('HOST'), '/api/Address/GetWards',
          {'districtId': '${districtId}'});
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "ngrok-skip-browser-warning": "69420",
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          dataWard = jsonResponse['data'];
          dataWard.sort((a, b) => a["WardName"].compareTo(b["WardName"]));
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make API request.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  int? selectedProvinceId;
  int? selectedDistrictId;
  String? selectedWardId;

  @override
  void initState() {
    if (addressGetXController.dataProvince.isNotEmpty) {
      dataProvince = addressGetXController.dataProvince;
      selectedProvinceId = addressGetXController.selectedProvinceId;
    } else {
      getDataProvince();
    }
    if (addressGetXController.dataDistrict.isNotEmpty) {
      dataDistrict = addressGetXController.dataDistrict;
      selectedDistrictId = addressGetXController.selectedDistrictId;
    }
    if (addressGetXController.dataWard.isNotEmpty) {
      dataWard = addressGetXController.dataWard;
      selectedWardId = addressGetXController.selectedWardId;
    }
    if (addressGetXController.userInformation.isNotEmpty) {
      AddressModel addressModel = addressGetXController.userInformation[0];
      fullNameController.text = addressModel.name;
      phoneNumberController.text = addressModel.phoneNumber;
      addressController.text = addressModel.addressNumber;
      selectedDistrictId = addressModel.districtId;
      selectedProvinceId = addressModel.cityId;
      selectedWardId = addressModel.wardCodeId;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBarPageAddress(),
        body: Container(
          decoration: AppDecoration.fillPrimary,
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildSectionTrackProgress(),
                ),
              ),
              Positioned(
                top: 70.v,
                child: _buildFormPageAddress(context),
              ),
              _buildArrowRightLeft(context),
            ],
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarPageAddress() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: appTheme.redA200,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 22.h, top: 0.v, right: 22.h),
        onTap: () => onClickBackToNewOrderPage(),
      ),
      title: Text(
        'Address',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionTrackProgress() {
    return Container(
      height: 160.v,
      padding: EdgeInsets.only(left: 60.v, right: 60.v, top: 10.v),
      decoration: BoxDecoration(color: appTheme.redA200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              //
              GestureDetector(
                onTap: () {
                  // onTapBtnArrowLeft();
                },
                child: Container(
                  width: 40.v,
                  height: 40.v,
                  decoration: BoxDecoration(
                    color: appTheme.redA200,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Divider(
                  color: Colors.black38,
                ),
              ),

              //
              Container(
                width: 40.v,
                height: 40.v,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: appTheme.redA200,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Divider(
                  color: Colors.black38,
                ),
              ),

              //
              Container(
                width: 40.v,
                height: 40.v,
                decoration: BoxDecoration(
                  color: appTheme.redA200,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //
        ],
      ),
    );
  }

  Widget _buildFormPageAddress(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: theme.colorScheme.primary,
        ),
        // height: SizeUtils.height,
        width: SizeUtils.width,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            _buildFullName(),
            SizedBox(height: 8.v),
            //
            _buildPhoneNumber(),
            //
            SizedBox(height: 8.v),
            //
            _buildAddressCode(),
            SizedBox(height: 8.v),
            //
            _buildAddressView(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Province Dropdown
        DropdownButtonFormField<int>(
          menuMaxHeight: SizeUtils.height / 2,
          decoration: InputDecoration(
            labelText: 'Select Province',
            contentPadding:
                EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
            hintStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: isErrorCity ? "Please select Province" : "",
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isErrorCity ? Colors.red : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isErrorCity ? Colors.red : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            hintText: 'Province Name',
          ),
          focusColor: Colors.amberAccent,
          value: selectedProvinceId,
          items: dataProvince.map((province) {
            return DropdownMenuItem(
              value: province['ProvinceID'] as int,
              child: Text(
                province['ProvinceName'] as String,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1, // Limit the number of lines to 1
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              isErrorCity = false;
              selectedProvinceId = value;
              selectedDistrictId = null; // Reset district selection
              selectedWardId = null;
              getDataDistrict(selectedProvinceId);
              for (var province in dataProvince) {
                if (province["ProvinceID"] == selectedProvinceId) {
                  cityController.text = province["ProvinceName"];
                }
              }
            });
          },
        ),
        SizedBox(height: 8),

        // District Dropdown
        DropdownButtonFormField<int>(
          decoration: InputDecoration(
            labelText: 'Select District',
            contentPadding:
                EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
            hintStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: isErrorDistrict ? "Please select District" : "",
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isErrorDistrict ? Colors.red : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isErrorDistrict ? Colors.red : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            hintText: 'District Name',
          ),
          value: selectedDistrictId,
          items: dataDistrict
              .where((district) => district['ProvinceID'] == selectedProvinceId)
              .map((district) {
            return DropdownMenuItem(
              value: district['DistrictID'] as int,
              child: Text(
                district['DistrictName'] as String,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedDistrictId = value;
              selectedWardId = null;
              isErrorDistrict = false;
              getDataWard(selectedDistrictId!);
              for (var district in dataDistrict) {
                if (district["DistrictID"] == selectedDistrictId) {
                  districtController.text = district["DistrictName"];
                }
              }
            });
          },
        ),
        SizedBox(height: 8),

        // Ward Dropdown
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Select Ward',
            contentPadding:
                EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
            hintStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorText: isErrorWardCode ? "Please select Ward" : "",
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isErrorWardCode ? Colors.red : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: isErrorWardCode ? Colors.red : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(
              fontSize: 17,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            hintText: 'Ward Name',
          ),
          borderRadius: BorderRadius.circular(10),
          value: selectedWardId,
          items: dataWard
              .where((ward) => ward['DistrictID'] == selectedDistrictId)
              .map((ward) {
            return DropdownMenuItem(
              value: ward['WardCode'].toString(),
              child: Text(
                ward['WardName'] as String,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedWardId = value;
              isErrorWardCode = false;
              for (var ward in dataWard) {
                if (ward["WardCode"] == selectedWardId.toString()) {
                  wardCodeController.text = ward["WardName"];
                }
              }
            });
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return TextFormField(
      showCursor: true,
      cursorColor: Colors.black,
      controller: phoneNumberController,
      onChanged: (value) {
        setState(() {
          isErrorPhoneNumber = false;
        });
      },
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(
          fontSize: 17,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        hintText: 'Enter your phone number',
        contentPadding:
            EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorText:
            isErrorPhoneNumber ? "Please enter correct phone number" : "",
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isErrorPhoneNumber ? Colors.red : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isErrorPhoneNumber ? Colors.red : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  /// Section Widget
  Widget _buildFullName() {
    return TextFormField(
      showCursor: true,
      cursorColor: Colors.black,
      controller: fullNameController,
      onChanged: (value) {
        setState(() {
          isErrorFullname = false;
        });
      },
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: 'Full Name',
        labelStyle: TextStyle(
          fontSize: 17,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
        hintText: 'Enter your full name',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorText: isErrorFullname ? "Please enter your full name" : "",
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isErrorFullname ? Colors.red : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isErrorFullname ? Colors.red : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }

  /// Section Widget
  Widget _buildAddressView() {
    return TextFormField(
      showCursor: true,
      cursorColor: Colors.black,
      controller: addressController,
      onChanged: (value) {
        setState(() {
          isErrorAddress = false;
        });
      },
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: 'Address',
        labelStyle: TextStyle(
          fontSize: 17,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        contentPadding:
            EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
        hintText: 'Enter your address',
        hintStyle: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorText: isErrorAddress ? "Please enter address street, No,..." : "",
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isErrorAddress ? Colors.red : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isErrorAddress ? Colors.red : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }

  /// Section Widget
  Widget _buildArrowRightLeft(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 35.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowLeft(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
            ),
          ),
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowRight(context);
            },
            child: CustomImageView(imagePath: ImageConstant.imgArrowRight),
          ),
        ],
      ),
    );
  }

  bool validateData() {
    final phoneNumber = phoneNumberController.text;
    final fullName = fullNameController.text;
    final address = addressController.text;

    if (fullName.isEmpty) {
      setState(() {
        isErrorFullname = true;
      });
    }

    if (!(10 <= phoneNumber.toString().length &&
            phoneNumber.toString().length <= 11) ||
        phoneNumber.isEmpty) {
      setState(() {
        isErrorPhoneNumber = true;
      });
    }

    if (selectedWardId == null) {
      setState(() {
        isErrorWardCode = true;
      });
    }

    if (selectedDistrictId == null) {
      setState(() {
        isErrorDistrict = true;
      });
    }

    if (selectedProvinceId == null) {
      setState(() {
        isErrorCity = true;
      });
    }

    if (address.isEmpty) {
      setState(() {
        isErrorAddress = true;
      });
    }

    if (isErrorFullname ||
        isErrorPhoneNumber ||
        isErrorWardCode ||
        isErrorDistrict ||
        isErrorCity ||
        isErrorAddress) {
      return false;
    } else {
      AddressModel newAddress = AddressModel(
        name: fullNameController.text,
        phoneNumber: phoneNumberController.text,
        addressNumber: addressController.text,
        cityId: selectedProvinceId!,
        wardCodeId: selectedWardId!,
        districtId: selectedDistrictId!,
      );
      newAddress.addressFull = addressController.text +
          ", " +
          wardCodeController.text +
          ", " +
          districtController.text +
          ", " +
          cityController.text;
      setState(() {
        addressGetXController.userInformation.clear();
        addressGetXController.addNewAddress(newAddress);
        addressGetXController.dataDistrict = dataDistrict;
        addressGetXController.dataProvince = dataProvince;
        addressGetXController.dataWard = dataWard;
        addressGetXController.selectedDistrictId = selectedDistrictId;
        addressGetXController.selectedProvinceId = selectedProvinceId;
        addressGetXController.selectedWardId = selectedWardId;
      });
    }

    return true;
  }

  onClickBackToNewOrderPage() {
    Get.toNamed(
      AppRoutes.onbOrderboxScreen,
    );
  }

  onTapBtnArrowLeft(context) {
    Get.toNamed(
      AppRoutes.onbOrderboxScreen,
    );
  }

  onTapBtnArrowRight(context) {
    if (validateData())
      Navigator.pushNamed(
        context,
        AppRoutes.onbCheckingAndPaymentScreen,
      );
  }
}
