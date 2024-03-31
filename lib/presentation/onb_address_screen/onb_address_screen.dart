import 'dart:convert';
import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:lastapp/core/utils/validation_functions.dart';
import 'package:lastapp/widgets/custom_text_form_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/onb_address_controller.dart';


class Address{
  late String name;
  late String phoneNumber;
  late String address;
  late String date;
  late String toWardCode;
  late int toDistrictId;
  Address({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.date,
    required this.toWardCode,
    required this.toDistrictId,
  });

  Map<String, dynamic> toJson() =>
  {
    'name': name,
    'phoneNumber': phoneNumber,
    'address': address,
    'date': date,
    'toWardCode': toWardCode,
    'toDistrictId': toDistrictId
  }; 
  factory Address.fromJson(Map<String, dynamic> json) => Address(
    name: json["name"] ?? '',
    phoneNumber: json["phoneNumber"] ?? '',
    address: json["address"] ?? '',
    date: json["date"] ?? '',
    toWardCode: json["toWardCode"] ?? '',
    toDistrictId: json["toDistrictId"] ?? 1,
  );
}

// ignore_for_file: must_be_immutable
class OnbAddressScreen extends GetWidget<OnbAddressController> {
  OnbAddressScreen({Key? key}) : super(key: key);
  
  Completer<GoogleMapController> googleMapController = Completer();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  late String name = "";
  late String phoneNumber = "";
  late String address = "";
  late String date = "";
  late String toWardCode = "";
  late int toDistrictId = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //
        // resizeToAvoidBottomInset: false,
        appBar: _buildAppBarPageAddress(),
        //
        body: Container(
          decoration: AppDecoration.fillGray,
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
        'Order new box',
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
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      Address _address = Address.fromJson(arguments);
      name = _address.name;
      phoneNumber = _address.phoneNumber;
      date = _address.date;
      address = _address.address;
      toWardCode = _address.toWardCode;
      toDistrictId = _address.toDistrictId;
    }
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(
                0.5,
                0.5,
              ),
              blurRadius: 1.0,
              spreadRadius: 0.5,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: theme.colorScheme.primary,
        ),
        height: SizeUtils.height,
        width: SizeUtils.width,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            _buildFullName(),
            SizedBox(height: 18.v),
            //
            _buildPhoneNumber(),
            SizedBox(height: 18.v),
            //
            _buildTime(),
            SizedBox(height: 18.v),
            //
            _buildAddress(),
            SizedBox(height: 21.v),
            //
            _buildCity1(),
            SizedBox(height: 18.v),
            //
            _buildNinetySix(),
            SizedBox(height: 20.v),
            //
            //_buildMaps(),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return CustomTextFormField(
        controller: controller.phoneNumberController,
        hintText: "lbl_phone_number".tr,
        textInputType: TextInputType.phone,
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildFullName() {
    return CustomTextFormField(
        controller: controller.fullNameController,
        hintText: "lbl_full_name".tr,
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildTime() {
    return GestureDetector(
      onTap: () {
        onTapTime();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.v),
        decoration: AppDecoration.outlineGray500
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(controller.onbAddressModelObj.value.date.value,
                style: theme.textTheme.bodyLarge)),
            CustomImageView(
              imagePath: ImageConstant.imgCalendarBlack900,
              height: 15.v,
              width: 13.h,
              margin: EdgeInsets.only(top: 3.v, right: 6.h, bottom: 2.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddress() {
    return CustomTextFormField(
        controller: controller.addressController,
        hintText: "lbl_address2".tr,
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 15.v, 24.h, 15.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLinkedinBlack900,
                height: 20.v,
                width: 14.h)),
        suffixConstraints: BoxConstraints(maxHeight: 50.v),
        contentPadding: EdgeInsets.only(left: 18.h, top: 15.v, bottom: 15.v));
  }

  /// Section Widget
  Widget _buildCity() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 5.h, bottom: 1.v),
            child: CustomTextFormField(
                controller: controller.cityController,
                hintText: 'Ward Code')));
  }

  /// Section Widget
  Widget _buildAddress1() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: CustomTextFormField(
                controller: controller.addressController1,
                hintText: "lbl_address".tr)));
  }

  /// Section Widget
  Widget _buildCity1() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildCity()
        //, _buildAddress1()
        ]);
  }

  /// Section Widget
  Widget _buildAddress2() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 5.h, bottom: 1.v),
            child: CustomTextFormField(
                controller: controller.addressController2,
                hintText: 'District Id')));
  }

  /// Section Widget
  Widget _buildType() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: CustomTextFormField(
                controller: controller.typeController,
                hintText: "lbl_street".tr,
                textInputAction: TextInputAction.done)));
  }

  /// Section Widget
  Widget _buildNinetySix() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildAddress2()]);
  }

  /// Section Widget
  Widget _buildMaps() {
    return SizedBox(
      height: 219.v,
      width: 350.h,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowRightLeft(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 45.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              final arguments = ModalRoute.of(context)!.settings.arguments as Map;
              final boxs = arguments['boxs'];

              Navigator.popAndPushNamed(
                context, 
                AppRoutes.onbOderboxScreen,
                arguments: {
                  'name': name,
                  'phoneNumber': phoneNumber,
                  'address': address,
                  'date': date,
                  'toWardCode': toWardCode,
                  'toDistrictId': toDistrictId,
                  'boxs': boxs,
                }
              );
              //onTapBtnArrowLeft();
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
              final arguments = ModalRoute.of(context)!.settings.arguments as Map;
              final boxs = arguments['boxs'];
              //final _new = Address(name: name, phoneNumber: phoneNumber, address: address, date: date, toWardCode: toWardCode, toDistrictId: toDistrictId);
              Navigator.pushNamed(
                context,
                AppRoutes.onbCheckingAndPaymentScreen,
                arguments: {
                  'name': name,
                  'phoneNumber': phoneNumber,
                  'address': address,
                  'date': date,
                  'toWardCode': toWardCode,
                  'toDistrictId': toDistrictId,
                  'boxs': boxs,
                },
              );
              onTapBtnArrowRight();
            },
            child: CustomImageView(imagePath: ImageConstant.imgArrowRight),
          ),
        ],
      ),
    );
  }

  /// Displays a date picker dialog and updates the selected date in the
  /// [onbAddressModelObj] object of the current [date] if the user
  /// selects a valid date.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTime() async {
    DateTime? dateTime = await showDatePicker(
      context: Get.context!,
      initialDate: controller.onbAddressModelObj.value.selectedDate!.value,
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(
        DateTime.now().year + 1,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );

    if (dateTime != null) {
      controller.onbAddressModelObj.value.selectedDate!.value = dateTime;
      controller.onbAddressModelObj.value.date.value =
          dateTime.format(pattern: dateTimeFormatPattern);
    }
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );

    // print('run here');

    // Navigator.pop(context);
  }

  /// Navigates to the onbOderboxScreen when the action is triggered.
  onTapBtnArrowLeft() {
    // print('left');

    Get.toNamed(
      AppRoutes.onbOderboxScreen,
    );
    //NavigationBar.pop();
  }

  /// Navigates to the onbCheckingAndPaymentScreen when the action is triggered.
  onTapBtnArrowRight() {
    // print('right');

    // Get.toNamed(
    //   AppRoutes.onbCheckingAndPaymentScreen,
    // );
  }
}
