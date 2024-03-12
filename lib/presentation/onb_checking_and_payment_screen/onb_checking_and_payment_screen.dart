import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:lastapp/widgets/custom_checkbox_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/onb_checking_and_payment_controller.dart';

class OnbCheckingAndPaymentScreen
    extends GetWidget<OnbCheckingAndPaymentController> {
  const OnbCheckingAndPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: 392.h,
                child: Container(
                    height: 806.v,
                    width: 392.h,
                    decoration: AppDecoration.fillGray,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      _buildTen(),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: EdgeInsets.only(top: 132.v),
                              padding: EdgeInsets.symmetric(vertical: 20.v),
                              decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.customBorderTL20),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("lbl_request_data".tr,
                                        style:
                                            CustomTextStyles.titleLargeGray800),
                                    SizedBox(height: 16.v),
                                    Divider(),
                                    SizedBox(height: 10.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 23.h),
                                            child: Text(
                                                "msg_packaging_requirements".tr,
                                                style: CustomTextStyles
                                                    .labelLargeBold))),
                                    SizedBox(height: 11.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 33.h),
                                            child: Text("lbl_1x_carton_box".tr,
                                                style: CustomTextStyles
                                                    .labelLargeGreen600))),
                                    SizedBox(height: 9.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 33.h, right: 40.h),
                                        child: _buildFullName(
                                            fullName: "lbl_size".tr,
                                            longDo: "lbl_50_x_50_x_50".tr)),
                                    SizedBox(height: 10.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 33.h, right: 39.h),
                                        child: _buildSize(
                                            size: "lbl_services2".tr,
                                            xXTwentyFive:
                                                "msg_washing_keeping".tr)),
                                    SizedBox(height: 11.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 33.h),
                                            child: Text("lbl_1x_carton_box".tr,
                                                style: CustomTextStyles
                                                    .labelLargeGreen600))),
                                    SizedBox(height: 6.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 33.h, right: 39.h),
                                        child: _buildSize(
                                            size: "lbl_size".tr,
                                            xXTwentyFive:
                                                "lbl_50_x_50_x_25".tr)),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 33.h, right: 38.h),
                                        child: _buildSize(
                                            size: "lbl_services2".tr,
                                            xXTwentyFive:
                                                "msg_washing_hang_on".tr)),
                                    SizedBox(height: 7.v),
                                    Divider(),
                                    SizedBox(height: 9.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 23.h),
                                            child: Text("lbl_address".tr,
                                                style: CustomTextStyles
                                                    .labelLargeBold))),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 33.h, right: 40.h),
                                        child: _buildFullName(
                                            fullName: "lbl_full_name2".tr,
                                            longDo: "lbl_long_do".tr)),
                                    SizedBox(height: 13.v),
                                    _buildPhone(),
                                    Spacer(),
                                    _buildAgreethetermsofuse(),
                                    SizedBox(height: 48.v),
                                    _buildArrowRight(),
                                    SizedBox(height: 20.v),
                                    SizedBox(
                                        width: 130.h,
                                        child:
                                            Divider(color: appTheme.gray80001))
                                  ])))
                    ])))));
  }

  /// Section Widget
  Widget _buildTen() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.h),
            padding: EdgeInsets.symmetric(vertical: 19.v),
            decoration: AppDecoration.fillRedA,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomAppBar(
                  leadingWidth: 38.h,
                  leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgVectorPrimary,
                      margin: EdgeInsets.only(left: 26.h, top: 4.v),
                      onTap: () {
                        onTapVector();
                      }),
                  centerTitle: true,
                  title: AppbarTitle(text: "lbl_order_new_box".tr)),
              SizedBox(height: 17.v),
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
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder15),
                                    child: Text("lbl_1".tr,
                                        style: theme.textTheme.titleMedium)),
                                Padding(
                                    padding: EdgeInsets.only(top: 5.v),
                                    child: Text("lbl_oder_box".tr,
                                        style:
                                            CustomTextStyles.bodySmallPrimary))
                              ])),
                              StepperData(
                                  iconWidget: Column(children: [
                                Container(
                                    width: 35.adaptSize,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.h, vertical: 7.v),
                                    decoration: AppDecoration.outlineGray8001
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder15),
                                    child: Text("lbl_2".tr,
                                        style: theme.textTheme.titleMedium)),
                                Padding(
                                    padding: EdgeInsets.only(top: 5.v),
                                    child: Text("lbl_address".tr,
                                        style:
                                            CustomTextStyles.labelLargePrimary))
                              ])),
                              StepperData()
                            ]),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Text("msg_checking_and_payment".tr,
                                style: CustomTextStyles.labelLargePrimary13))
                      ]))),
              SizedBox(height: 32.v)
            ])));
  }

  /// Section Widget
  Widget _buildPhone() {
    return Padding(
        padding: EdgeInsets.only(left: 33.h, right: 40.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_phone".tr, style: theme.textTheme.bodySmall),
                    SizedBox(height: 10.v),
                    Text("lbl_address".tr, style: theme.textTheme.bodySmall)
                  ])),
          Column(children: [
            Align(
                alignment: Alignment.centerRight,
                child: Text("lbl_0123456789".tr,
                    style: theme.textTheme.bodySmall)),
            SizedBox(height: 11.v),
            Text("msg_tay_mo_nam_tu_liem".tr, style: theme.textTheme.bodySmall)
          ])
        ]));
  }

  /// Section Widget
  Widget _buildAgreethetermsofuse() {
    return Obx(() => CustomCheckboxButton(
        text: "msg_agree_the_terms".tr,
        value: controller.agreethetermsofuse.value,
        onChange: (value) {
          controller.agreethetermsofuse.value = value;
        }));
  }

  /// Section Widget
  Widget _buildArrowRight() {
    return Padding(
        padding: EdgeInsets.only(left: 30.h, right: 34.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomIconButton(
              height: 60.adaptSize,
              width: 60.adaptSize,
              padding: EdgeInsets.all(15.h),
              onTap: () {
                onTapBtnArrowRight();
              },
              child: CustomImageView(
                  imagePath: ImageConstant.imgArrowRightOnerrorcontainer)),
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

  /// Common widget
  Widget _buildSize({
    required String size,
    required String xXTwentyFive,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(size,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900)),
      Text(xXTwentyFive,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900))
    ]);
  }

  /// Common widget
  Widget _buildFullName({
    required String fullName,
    required String longDo,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: Text(fullName,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.black900))),
      Text(longDo,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900))
    ]);
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Navigates to the onbAddressScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.onbAddressScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBtnArrowRight1() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
