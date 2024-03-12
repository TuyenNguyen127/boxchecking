import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/get_back_choose_box_controller.dart';

class GetBackChooseBoxScreen extends GetWidget<GetBackChooseBoxController> {
  const GetBackChooseBoxScreen({Key? key}) : super(key: key);

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
                      _buildTwentyNine(),
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
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 19.h, right: 21.h),
                                        child: CustomDropDown(
                                            icon: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 19.v, 21.h, 19.v),
                                                child: CustomImageView(
                                                    imagePath:
                                                        ImageConstant.imgSave,
                                                    height: 12.v,
                                                    width: 19.h)),
                                            hintText: "lbl_search_by_id".tr,
                                            items: controller
                                                .getBackChooseBoxModelObj
                                                .value
                                                .dropdownItemList!
                                                .value,
                                            contentPadding: EdgeInsets.only(
                                                left: 18.h,
                                                top: 15.v,
                                                bottom: 15.v),
                                            onChanged: (value) {
                                              controller.onSelected(value);
                                            })),
                                    SizedBox(height: 10.v),
                                    _buildListOrder(),
                                    SizedBox(height: 90.v),
                                    Padding(
                                        padding: EdgeInsets.only(right: 32.h),
                                        child: CustomIconButton(
                                            height: 60.adaptSize,
                                            width: 60.adaptSize,
                                            padding: EdgeInsets.all(15.h),
                                            alignment: Alignment.centerRight,
                                            onTap: () {
                                              onTapBtnArrowRight();
                                            },
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgArrowRight))),
                                    SizedBox(height: 20.v),
                                    SizedBox(
                                        width: 130.h,
                                        child:
                                            Divider(color: appTheme.gray80001))
                                  ])))
                    ])))));
  }

  /// Section Widget
  Widget _buildTwentyNine() {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.h),
            padding: EdgeInsets.symmetric(vertical: 21.v),
            decoration: AppDecoration.fillRedA,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              CustomAppBar(
                  leadingWidth: 38.h,
                  leading: AppbarLeadingImage(
                      imagePath: ImageConstant.imgVectorPrimary,
                      margin:
                          EdgeInsets.only(left: 26.h, top: 2.v, bottom: 2.v),
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
                                    decoration: AppDecoration.outlineGray800
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder15),
                                    child: Text("lbl_1".tr,
                                        style: CustomTextStyles
                                            .titleMediumRedA200)),
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
              SizedBox(height: 30.v)
            ])));
  }

  /// Section Widget
  Widget _buildListOrder() {
    return SizedBox(
        height: 400.v,
        width: 392.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(right: 1.h),
                  padding: EdgeInsets.symmetric(vertical: 38.v),
                  decoration: AppDecoration.fillPrimary,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 18.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          border: Border.all(
                                              color: appTheme.black900,
                                              width: 2.h))),
                                  Padding(
                                      padding: EdgeInsets.only(left: 12.h),
                                      child: Text("lbl_id".tr,
                                          style: CustomTextStyles
                                              .titleSmallBlack900Medium)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 5.h),
                                      child: Text("lbl_33589549623491".tr,
                                          style: CustomTextStyles
                                              .titleSmallBlack900Medium)),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgBookmark,
                                      height: 13.v,
                                      width: 11.h,
                                      margin: EdgeInsets.only(
                                          left: 6.h, top: 3.v, bottom: 3.v))
                                ])),
                        SizedBox(height: 12.v),
                        Container(
                            padding: EdgeInsets.fromLTRB(12.h, 1.v, 12.h, 2.v),
                            decoration: AppDecoration.outlineBluegray300,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 20.adaptSize,
                                      width: 20.adaptSize,
                                      margin: EdgeInsets.only(
                                          top: 40.v, bottom: 89.v),
                                      decoration: BoxDecoration(
                                          color: theme.colorScheme.primary,
                                          border: Border.all(
                                              color: appTheme.black900,
                                              width: 2.h))),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgImage11,
                                      height: 40.v,
                                      width: 47.h,
                                      margin: EdgeInsets.only(
                                          left: 6.h, top: 30.v, bottom: 79.v)),
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 9.h, top: 7.v),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                _buildId(
                                                    iD: "lbl_id".tr,
                                                    widget:
                                                        "msg_33589549623491_001"
                                                            .tr),
                                                SizedBox(height: 9.v),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 1.h),
                                                    child: _buildItemsInOrder(
                                                        xQuanJeanxAo:
                                                            "msg_10xquan_jean_10xao"
                                                                .tr)),
                                                SizedBox(height: 10.v),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 1.h),
                                                    child: _buildService(
                                                        hangOnWashing:
                                                            "msg_hang_on_washing"
                                                                .tr)),
                                                SizedBox(height: 8.v),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 1.h),
                                                    child: Row(children: [
                                                      CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgThumbsUpBlueGray300,
                                                          height: 12.v,
                                                          width: 11.h,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.v)),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 9.h),
                                                          child: Text(
                                                              "msg_box_50x50x100"
                                                                  .tr,
                                                              style: CustomTextStyles
                                                                  .labelLargeOrangeA700))
                                                    ])),
                                                SizedBox(height: 10.v),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 1.h),
                                                    child: Text(
                                                        "msg_start_at_20_12_2023"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .labelLargeBluegray300)),
                                                SizedBox(height: 9.v),
                                                Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 3.h),
                                                        child: RichText(
                                                            text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                      text: "lbl_total"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .titleSmall),
                                                                  TextSpan(
                                                                      text: "lbl_200000"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .titleSmall)
                                                                ]),
                                                            textAlign: TextAlign
                                                                .left)))
                                              ])))
                                ])),
                        SizedBox(height: 12.v)
                      ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(left: 2.h, top: 245.v),
                  padding: EdgeInsets.fromLTRB(12.h, 1.v, 12.h, 2.v),
                  decoration: AppDecoration.outlineBluegray300,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(top: 40.v, bottom: 89.v),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                border: Border.all(
                                    color: appTheme.black900, width: 2.h))),
                        CustomImageView(
                            imagePath: ImageConstant.imgImage11,
                            height: 40.v,
                            width: 47.h,
                            margin: EdgeInsets.only(
                                left: 6.h, top: 30.v, bottom: 79.v)),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 9.h, top: 7.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildId(
                                          iD: "lbl_id".tr,
                                          widget: "msg_33589549623491_002".tr),
                                      SizedBox(height: 9.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 1.h),
                                          child: _buildItemsInOrder(
                                              xQuanJeanxAo:
                                                  "msg_10xquan_jean_10xao".tr)),
                                      SizedBox(height: 10.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 1.h),
                                          child: _buildService(
                                              hangOnWashing:
                                                  "msg_hang_on_washing".tr)),
                                      SizedBox(height: 8.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 1.h),
                                          child: Row(children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgThumbsUpBlueGray300,
                                                height: 12.v,
                                                width: 11.h,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 1.v)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 9.h),
                                                child: Text(
                                                    "msg_box_50x100x1003".tr,
                                                    style: CustomTextStyles
                                                        .labelLargeOrangeA700))
                                          ])),
                                      SizedBox(height: 10.v),
                                      Padding(
                                          padding: EdgeInsets.only(left: 1.h),
                                          child: Text(
                                              "msg_start_at_20_12_2023".tr,
                                              style: CustomTextStyles
                                                  .labelLargeBluegray300)),
                                      SizedBox(height: 9.v),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 3.h),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "lbl_total".tr,
                                                        style: theme.textTheme
                                                            .titleSmall),
                                                    TextSpan(
                                                        text: "lbl_200000".tr,
                                                        style: theme.textTheme
                                                            .titleSmall)
                                                  ]),
                                                  textAlign: TextAlign.left)))
                                    ])))
                      ]))),
          Padding(
              padding: EdgeInsets.only(left: 17.h),
              child: CustomDropDown(
                  width: 95.h,
                  hintText: "lbl_14_days_ago".tr,
                  alignment: Alignment.topLeft,
                  items: controller
                      .getBackChooseBoxModelObj.value.dropdownItemList1!.value,
                  onChanged: (value) {
                    controller.onSelected1(value);
                  }))
        ]));
  }

  /// Common widget
  Widget _buildId({
    required String iD,
    required String widget,
  }) {
    return Row(children: [
      Text(iD,
          style: CustomTextStyles.labelLargeBluegray300
              .copyWith(color: appTheme.blueGray300)),
      Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text(widget,
              style: theme.textTheme.labelLarge!
                  .copyWith(color: appTheme.black900))),
      CustomImageView(
          imagePath: ImageConstant.imgComputer,
          height: 13.v,
          width: 11.h,
          margin: EdgeInsets.only(left: 4.h))
    ]);
  }

  /// Common widget
  Widget _buildItemsInOrder({required String xQuanJeanxAo}) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgGrid,
          height: 12.v,
          width: 11.h,
          margin: EdgeInsets.only(bottom: 4.v)),
      Padding(
          padding: EdgeInsets.only(left: 9.h),
          child: Text(xQuanJeanxAo,
              style: CustomTextStyles.labelLargeGray80002
                  .copyWith(color: appTheme.gray80002)))
    ]);
  }

  /// Common widget
  Widget _buildService({required String hangOnWashing}) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomImageView(
          imagePath: ImageConstant.imgThumbsUp,
          height: 9.v,
          width: 11.h,
          margin: EdgeInsets.only(top: 1.v, bottom: 3.v)),
      Padding(
          padding: EdgeInsets.only(left: 9.h),
          child: Text(hangOnWashing,
              style: CustomTextStyles.labelLargeLightblue800
                  .copyWith(color: appTheme.lightBlue800)))
    ]);
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Navigates to the getBackAddressScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.getBackAddressScreen,
    );
  }
}
