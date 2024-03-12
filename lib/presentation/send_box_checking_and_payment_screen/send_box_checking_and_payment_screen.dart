import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:lastapp/widgets/custom_checkbox_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/send_box_checking_and_payment_controller.dart';

class SendBoxCheckingAndPaymentScreen
    extends GetWidget<SendBoxCheckingAndPaymentController> {
  const SendBoxCheckingAndPaymentScreen({Key? key}) : super(key: key);

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
                      _buildFour(),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
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
                                    SizedBox(height: 13.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 31.h),
                                            child: Text(
                                                "msg_packaging_requirements".tr,
                                                style: CustomTextStyles
                                                    .labelLargeBold))),
                                    SizedBox(height: 11.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 41.h),
                                            child: Text(
                                                "msg_id_33589549623491_001".tr,
                                                style: CustomTextStyles
                                                    .labelLargeGreen600))),
                                    SizedBox(height: 9.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 41.h, right: 32.h),
                                        child: _buildItems(
                                            items: "lbl_model".tr,
                                            xQuanJeanxAo:
                                                "msg_box_50x100x100".tr)),
                                    SizedBox(height: 11.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 41.h, right: 32.h),
                                        child: _buildItems(
                                            items: "lbl_items".tr,
                                            xQuanJeanxAo:
                                                "msg_10xquan_jean_10xao".tr)),
                                    SizedBox(height: 11.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 41.h, right: 35.h),
                                        child: _buildServices(
                                            services: "lbl_services2".tr,
                                            washingKeeping:
                                                "msg_washing_keeping".tr)),
                                    SizedBox(height: 10.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 41.h),
                                            child: Text(
                                                "msg_id_33589549623491_002".tr,
                                                style: CustomTextStyles
                                                    .labelLargeGreen600))),
                                    SizedBox(height: 9.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 41.h, right: 32.h),
                                        child: _buildItems(
                                            items: "lbl_model".tr,
                                            xQuanJeanxAo:
                                                "msg_box_50x100x1002".tr)),
                                    SizedBox(height: 11.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 41.h, right: 32.h),
                                        child: _buildItems(
                                            items: "lbl_items".tr,
                                            xQuanJeanxAo:
                                                "msg_10xquan_jean_10xao".tr)),
                                    SizedBox(height: 11.v),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 41.h, right: 35.h),
                                        child: _buildServices(
                                            services: "lbl_services2".tr,
                                            washingKeeping:
                                                "msg_washing_keeping".tr)),
                                    SizedBox(height: 16.v),
                                    Divider(),
                                    SizedBox(height: 13.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 26.h),
                                            child: Text("lbl_address".tr,
                                                style: CustomTextStyles
                                                    .labelLargeBold))),
                                    SizedBox(height: 12.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 36.h),
                                        child: _buildItems(
                                            items: "lbl_full_name2".tr,
                                            xQuanJeanxAo: "lbl_long_do".tr)),
                                    SizedBox(height: 13.v),
                                    _buildPhone(),
                                    SizedBox(height: 10.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 36.h),
                                        child: _buildItems(
                                            items: "lbl_address".tr,
                                            xQuanJeanxAo:
                                                "msg_tay_mo_nam_tu_liem".tr)),
                                    SizedBox(height: 62.v),
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
  Widget _buildFour() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.h),
            padding: EdgeInsets.symmetric(vertical: 20.v),
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
                  title: AppbarTitle(text: "lbl_send_box".tr)),
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
        padding: EdgeInsets.symmetric(horizontal: 36.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("lbl_phone".tr, style: theme.textTheme.bodySmall),
          Text("lbl_0123456789".tr, style: theme.textTheme.bodySmall)
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
        padding: EdgeInsets.symmetric(horizontal: 31.h),
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
  Widget _buildItems({
    required String items,
    required String xQuanJeanxAo,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(items,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900)),
      Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(xQuanJeanxAo,
              style: CustomTextStyles.bodySmall10
                  .copyWith(color: appTheme.black900)))
    ]);
  }

  /// Common widget
  Widget _buildServices({
    required String services,
    required String washingKeeping,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(services,
          style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900)),
      Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(washingKeeping,
              style: CustomTextStyles.bodySmallErrorContainer
                  .copyWith(color: theme.colorScheme.errorContainer)))
    ]);
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Navigates to the sendBoxAddressScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.sendBoxAddressScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBtnArrowRight1() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
