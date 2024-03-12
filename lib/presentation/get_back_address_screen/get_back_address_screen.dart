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
import 'controller/get_back_address_controller.dart';

// ignore_for_file: must_be_immutable
class GetBackAddressScreen extends GetWidget<GetBackAddressController> {
  GetBackAddressScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: 392.h,
                    child: Column(children: [
                      _buildSeven(),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                                  height: 812.v,
                                  width: 392.h,
                                  margin: EdgeInsets.only(bottom: 5.v),
                                  child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                                height: 806.v, width: 392.h)),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 20.h),
                                                decoration: AppDecoration
                                                    .fillPrimary
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .customBorderTL20),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      _buildPhoneNumber(),
                                                      SizedBox(height: 18.v),
                                                      _buildFullName(),
                                                      SizedBox(height: 18.v),
                                                      _buildTime(),
                                                      SizedBox(height: 18.v),
                                                      _buildAddress(),
                                                      SizedBox(height: 21.v),
                                                      _buildCity1(),
                                                      SizedBox(height: 18.v),
                                                      _buildNinetyFive(),
                                                      SizedBox(height: 20.v),
                                                      _buildImageTen()
                                                    ])))
                                      ]))))
                    ]))),
            bottomNavigationBar: _buildArrowRight()));
  }

  /// Section Widget
  Widget _buildSeven() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1.h),
        padding: EdgeInsets.symmetric(vertical: 21.v),
        decoration: AppDecoration.fillRedA,
        child: Column(children: [
          CustomAppBar(
              leadingWidth: 38.h,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgVectorPrimary,
                  margin: EdgeInsets.only(left: 26.h, top: 2.v, bottom: 2.v),
                  onTap: () {
                    onTapVector();
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "lbl_get_back".tr)),
          SizedBox(height: 15.v),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: 57.v,
                  width: 333.h,
                  margin: EdgeInsets.only(right: 7.h),
                  child: Stack(alignment: Alignment.bottomRight, children: [
                    AnotherStepper(
                        iconHeight: 55,
                        iconWidth: 53,
                        stepperDirection: Axis.horizontal,
                        activeIndex: 0,
                        barThickness: 1,
                        inverted: true,
                        stepperList: [
                          StepperData(
                              iconWidget: Column(children: [
                            Container(
                                width: 35.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13.h, vertical: 7.v),
                                decoration: AppDecoration.outlineGray8001
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder15),
                                child: Text("lbl_1".tr,
                                    style: theme.textTheme.titleMedium)),
                            Padding(
                                padding: EdgeInsets.only(top: 5.v),
                                child: Text("lbl_oder_box".tr,
                                    style: CustomTextStyles.bodySmallPrimary))
                          ])),
                          StepperData(
                              iconWidget: Column(children: [
                            Container(
                                width: 35.adaptSize,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.h, vertical: 7.v),
                                decoration: AppDecoration.outlineGray800
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.circleBorder15),
                                child: Text("lbl_2".tr,
                                    style:
                                        CustomTextStyles.titleMediumRedA200)),
                            Padding(
                                padding: EdgeInsets.only(top: 5.v),
                                child: Text("lbl_address".tr,
                                    style: CustomTextStyles.labelLargePrimary))
                          ])),
                          StepperData()
                        ]),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Text("msg_checking_and_payment".tr,
                            style: CustomTextStyles.labelLargePrimary13))
                  ]))),
          SizedBox(height: 30.v)
        ]));
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
            padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 13.v),
            decoration: AppDecoration.outlineGray200
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                      controller.getBackAddressModelObj.value.date.value,
                      style: theme.textTheme.bodyLarge)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCalendarBlack900,
                      height: 15.v,
                      width: 13.h,
                      margin:
                          EdgeInsets.only(top: 3.v, right: 6.h, bottom: 2.v))
                ])));
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
  Widget _buildNinetyFive() {
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
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }

  /// Section Widget
  Widget _buildArrowRight() {
    return Padding(
        padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 44.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: CustomIconButton(
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  padding: EdgeInsets.all(15.h),
                  onTap: () {
                    onTapBtnArrowRight();
                  },
                  child: CustomImageView(
                      imagePath: ImageConstant.imgArrowRightOnerrorcontainer))),
          CustomIconButton(
              height: 60.adaptSize,
              width: 60.adaptSize,
              padding: EdgeInsets.all(15.h),
              onTap: () {
                onTapBtnArrowRight1();
              },
              child: CustomImageView(imagePath: ImageConstant.imgArrowRight))
        ]));
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Displays a date picker dialog and updates the selected date in the
  /// [getBackAddressModelObj] object of the current [date] if the user
  /// selects a valid date.
  ///
  /// This function returns a `Future` that completes with `void`.
  Future<void> onTapTime() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate:
            controller.getBackAddressModelObj.value.selectedDate!.value,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      controller.getBackAddressModelObj.value.selectedDate!.value = dateTime;
      controller.getBackAddressModelObj.value.date.value =
          dateTime.format(pattern: dateTimeFormatPattern);
    }
  }

  /// Navigates to the getBackChooseBoxScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.getBackChooseBoxScreen,
    );
  }

  /// Navigates to the getBackCheckingAndPaymentScreen when the action is triggered.
  onTapBtnArrowRight1() {
    Get.toNamed(
      AppRoutes.getBackCheckingAndPaymentScreen,
    );
  }
}
