import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/model/addressModel.dart';

import 'controller/send_box_address_controller.dart';

// ignore_for_file: must_be_immutable
class SendBoxAddressScreen extends StatefulWidget {
  SendBoxAddressScreen({Key? key}) : super(key: key);

  @override
  State<SendBoxAddressScreen> createState() => _SendboxAddressScreenState();
}

class _SendboxAddressScreenState extends State<SendBoxAddressScreen> {
  TextEditingController controller = TextEditingController();

  SendBoxAddressController addressGetXController =
      Get.put(SendBoxAddressController());

  late bool isPickedDate = false;

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
      "name": "Ha Noi",
      "idProvince": 201,
    },
    {
      "name": "Vinh Phuc",
      "idProvince": 202,
    },
    {
      "name": "Hai Duong",
      "idProvince": 203,
    },
    {
      "name": "Yen Bai",
      "idProvince": 204,
    }
  ];

  List<dynamic> dataDistrict = [
    {"idProvince": 201, "idDistrict": 101, "name": "Thanh Xuan"},
    {"idProvince": 201, "idDistrict": 102, "name": "Cau Giay"},
    {"idProvince": 202, "idDistrict": 103, "name": "Binh Xuyen"},
    {"idProvince": 202, "idDistrict": 104, "name": "Lap Thach"},
    {"idProvince": 203, "idDistrict": 105, "name": "Hai Duong City"},
    {"idProvince": 203, "idDistrict": 106, "name": "Bai Bien"},
    {"idProvince": 204, "idDistrict": 107, "name": "Muong Te"},
    {"idProvince": 204, "idDistrict": 108, "name": "Doc Lo"}
  ];

  List<dynamic> dataWard = [
    {"idProvince": 201, "idDistrict": 101, "idWard": 1, "name": "Quan Nhan"},
    {"idProvince": 201, "idDistrict": 102, "idWard": 2, "name": "Quan Nho"},
    {
      "idProvince": 202,
      "idDistrict": 103,
      "idWard": 3,
      "name": "Xa Binh Xuyen"
    },
    {"idProvince": 202, "idDistrict": 104, "idWard": 4, "name": "Xa Lap Thach"},
    {
      "idProvince": 203,
      "idDistrict": 105,
      "idWard": 5,
      "name": "Xa Hai Duong City"
    },
    {"idProvince": 203, "idDistrict": 106, "idWard": 6, "name": "Xa Bai Bien"},
    {"idProvince": 204, "idDistrict": 107, "idWard": 7, "name": "Xa Muong Te"},
    {"idProvince": 204, "idDistrict": 108, "idWard": 8, "name": "Xa Doc Lo"}
  ];

  int? selectedProvinceId;
  int? selectedDistrictId;
  int? selectedWardId;

  @override
  void initState() {
    if (addressGetXController.tuyenListAddress.isNotEmpty) {
      AddressModel addressModel = addressGetXController.tuyenListAddress[0];
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
        //
        appBar: _buildAppBarPageAddress(),
        //
        body: Container(
          // decoration: AppDecoration.fillGray,
          decoration: AppDecoration.fillPrimary,
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildSectionTrackProgress(),
                ),
              ),
              //
              Positioned(
                top: 100.v,
                child: _buildFormPageAddress(context),
              ),
              //
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
        onTap: () => onTapVector(),
      ),
      title: Text(
        'Send box to warehouse',
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

          SizedBox(height: 10),

          //
          Center(
            child: Text(
              'Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
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
              value: province['idProvince'] as int,
              child: Text(
                province['name'] as String,
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
              .where((district) => district['idProvince'] == selectedProvinceId)
              .map((district) {
            return DropdownMenuItem(
              value: district['idDistrict'] as int,
              child: Text(
                district['name'] as String,
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
            });
          },
        ),
        SizedBox(height: 8),

        // Ward Dropdown
        DropdownButtonFormField<int>(
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
              .where((ward) =>
                  ward['idProvince'] == selectedProvinceId &&
                  ward['idDistrict'] == selectedDistrictId)
              .map((ward) {
            return DropdownMenuItem(
              value: ward['idWard'] as int,
              child: Text(
                ward['name'] as String,
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

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
    // Navigator.pop(context);
  }

  onTapBtnArrowLeft(context) {
    //NavigationBar.pop();

    // saveDataForAddressPage();
    //
    // Navigator.pop(context);

    Get.toNamed(
      AppRoutes.sendBoxChooseBoxScreen,
    );

    //checkValidationData();
  }

  bool validateData() {
    final phoneNumber = phoneNumberController.text;
    final fullName = fullNameController.text;
    final wardCode = wardCodeController.text;
    final district = districtController.text;
    final city = cityController.text;
    final address = addressController.text;

    if (fullName.isEmpty) {
      print('loi fullName');
      print(fullName);

      setState(() {
        isErrorFullname = true;
      });
    }

    if (!(10 <= phoneNumber.toString().length &&
            phoneNumber.toString().length <= 11) ||
        phoneNumber.isEmpty) {
      print('loi phoneNumber');
      print(phoneNumber);

      setState(() {
        isErrorPhoneNumber = true;
      });
    }

    if (selectedWardId == null) {
      print('trong ward');
      print(wardCode);

      setState(() {
        isErrorWardCode = true;
      });
    }

    if (selectedDistrictId == null) {
      print('trong district');
      print(district);

      setState(() {
        isErrorDistrict = true;
      });
    }

    if (selectedProvinceId == null) {
      print('trong city');
      print(city);

      setState(() {
        isErrorCity = true;
      });
    }

    if (address.isEmpty) {
      print('trong address');
      print(address);

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
      addressGetXController.addNewAddress(newAddress);
    }

    return true;
  }

  void checkValidationData() {
    if (validateData()) {
      // cho sang trang tiep theo
      print('qua duoc trang moi dooii dit con di cha may');
    }
  }

  /// Navigates to the onbCheckingAndPaymentScreen when the action is triggered.
  onTapBtnArrowRight(context) {
    // Get.toNamed(
    //   AppRoutes.onbCheckingAndPaymentScreen,
    // );

    //
    // saveDataForAddressPage();
    //
    // Navigator.pop(context);
    //
    // Get.toNamed(
    //   AppRoutes.onbCheckingAndPaymentScreen,
    // );

    //
    if (validateData())
      Navigator.pushNamed(
        context,
        AppRoutes.sendBoxCheckingAndPaymentScreen,
      );
  }

  // saveDataForAddressPage() {
  //   if (onbAddressController.fullNameStringList.length > 0 &&
  //       onbAddressController.phoneNumberStringList.length > 0 &&
  //       onbAddressController.addressStringList.length > 0 &&
  //       onbAddressController.dateTimeList.length > 0 &&
  //       onbAddressController.districtIdStringList.length > 0 &&
  //       onbAddressController.towardCodeStringList.length > 0) {
  //     Address newAddress = Address(
  //       name: onbAddressController.fullNameStringList.last,
  //       phoneNumber: onbAddressController.phoneNumberStringList.last,
  //       date: onbAddressController.dateTimeList.last.toString(),
  //       address: onbAddressController.addressStringList.last,
  //       towardCode: onbAddressController.towardCodeStringList.toString(),
  //       districtId: onbAddressController.districtIdStringList.last,
  //     );

  //     onbAddressController.addNewAddress(newAddress);
  //   }
  // }
}
