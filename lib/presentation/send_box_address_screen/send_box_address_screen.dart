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
import 'controller/send_box_address_controller.dart';

// ignore_for_file: must_be_immutable
class SendBoxAddressScreen extends GetWidget<SendBoxAddressController> {
  SendBoxAddressScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //
        appBar: _buildAppBar(),
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
                child: _buildFormPageAddress(),
              ),
              //
              _buildArrowRightLeft(),
            ],
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBar() {
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
        'Send box',
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
                    '1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
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

  Widget _buildFormPageAddress() {
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
            _buildPhoneNumber(),
            SizedBox(height: 18.v),
            //
            _buildFullName(),
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
            _buildImageTen(),
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
            Obx(() => Text(controller.sendBoxAddressModelObj.value.date.value,
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
                hintText: "lbl_city".tr)));
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
        children: [_buildCity(), _buildAddress1()]);
  }

  /// Section Widget
  Widget _buildAddress2() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(right: 5.h, bottom: 1.v),
            child: CustomTextFormField(
                controller: controller.addressController2,
                hintText: "lbl_address".tr)));
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
        children: [_buildAddress2(), _buildType()]);
  }

  /// Section Widget
  Widget _buildImageTen() {
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
  Widget _buildArrowRightLeft() {
    return Padding(
      padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 44.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowLeft();
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
              onTapBtnArrowRight();
            },
            child: CustomImageView(imagePath: ImageConstant.imgArrowRight),
          ),
        ],
      ),
    );
  }

  /// Displays a date picker dialog and updates the selected date in the
  /// [sendBoxAddressModelObj] object of the current [date] if the user
  /// selects a valid date.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTime() async {
    DateTime? dateTime = await showDatePicker(
      context: Get.context!,
      initialDate: controller.sendBoxAddressModelObj.value.selectedDate!.value,
      firstDate: DateTime(1970),
      lastDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );

    if (dateTime != null) {
      controller.sendBoxAddressModelObj.value.selectedDate!.value = dateTime;
      controller.sendBoxAddressModelObj.value.date.value =
          dateTime.format(pattern: dateTimeFormatPattern);
    }
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Navigates to the sendBoxChooseBoxScreen when the action is triggered.
  onTapBtnArrowLeft() {
    Get.toNamed(
      AppRoutes.sendBoxChooseBoxScreen,
    );
  }

  /// Navigates to the sendBoxCheckingAndPaymentScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.sendBoxCheckingAndPaymentScreen,
    );
  }
}
