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
        appBar: _buildAppBar(),
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
                child: _buildContent(),
              ),
              //
              Positioned(
                bottom: 100.v,
                child: _buildAddress(),
              ),
              //
              Positioned(
                bottom: 120.v,
                child: _buildAgreethetermsofuse(),
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
                  color: appTheme.redA200,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '2',
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
                    '3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: appTheme.redA200,
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
              'Checking and Payment',
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

  Widget _buildContent() {
    return Container(
      width: SizeUtils.width,
      height: SizeUtils.height,
      padding: EdgeInsets.symmetric(vertical: 20.v),
      decoration: AppDecoration.fillPrimary
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          //
          Text("Request Data", style: CustomTextStyles.titleLargeGray800),
          //
          SizedBox(height: 10.v),
          Divider(),
          SizedBox(height: 10.v),
          //
          _buildPackageRequirementsSection(),
        ],
      ),
    );
  }

  Widget _buildPackageRequirementsSection() {
    return Container(
      height: 280.v,
      padding: EdgeInsets.only(left: 25.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Packaging requirements",
                style: CustomTextStyles.labelLargeBold,
              ),
            ),
            SizedBox(height: 10.v),
            //
            _buildPackageRequirementsItem(
              "msg_id_33589549623491_001".tr,
              "box",
              "msg_10xquan_jean_10xao".tr,
              50,
              100,
              100,
              "msg_washing_keeping".tr,
            ),
            SizedBox(height: 30.v),
            //
            _buildPackageRequirementsItem(
              "msg_id_33589549623491_002".tr,
              "box",
              "msg_10xquan_jean_10xao".tr,
              50,
              100,
              100,
              "msg_washing_keeping".tr,
            ),
            SizedBox(height: 30.v),
            //
            _buildPackageRequirementsItem(
              "msg_id_33589549623491_001".tr,
              "box",
              "msg_10xquan_jean_10xao".tr,
              50,
              100,
              100,
              "msg_washing_keeping".tr,
            ),
            SizedBox(height: 30.v),
            //
            _buildPackageRequirementsItem(
              "msg_id_33589549623491_001".tr,
              "box",
              "msg_10xquan_jean_10xao".tr,
              50,
              100,
              100,
              "msg_washing_keeping".tr,
            ),
            //
            //
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 41.h),
            //     child: Text(
            //       "msg_id_33589549623491_002".tr,
            //       style: CustomTextStyles.labelLargeGreen600,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10.v),
            // Padding(
            //   padding: EdgeInsets.only(left: 41.h, right: 32.h),
            //   child: _buildItems(
            //     items: "lbl_model".tr,
            //     xQuanJeanxAo: "msg_box_50x100x1002".tr,
            //   ),
            // ),
            // SizedBox(height: 10.v),
            // Padding(
            //   padding: EdgeInsets.only(left: 41.h, right: 32.h),
            //   child: _buildItems(
            //     items: "lbl_items".tr,
            //     xQuanJeanxAo: "msg_10xquan_jean_10xao".tr,
            //   ),
            // ),
            // SizedBox(height: 10.v),
            // Padding(
            //   padding: EdgeInsets.only(left: 41.h, right: 35.h),
            //   child: _buildServices(
            //     services: "lbl_services2".tr,
            //     washingKeeping: "msg_washing_keeping".tr,
            //   ),
            // ),
            // SizedBox(height: 10.v),
            // Divider(),
            // SizedBox(height: 10.v),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 26.h),
            //     child: Text("lbl_address".tr,
            //         style: CustomTextStyles.labelLargeBold),
            //   ),
            // ),
            // SizedBox(height: 10.v),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 36.h),
            //   child: _buildItems(
            //     items: "lbl_full_name2".tr,
            //     xQuanJeanxAo: "lbl_long_do".tr,
            //   ),
            // ),
            // SizedBox(height: 10.v),
            // _buildPhone(),
            // SizedBox(height: 10.v),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 36.h),
            //   child: _buildItems(
            //     items: "lbl_address".tr,
            //     xQuanJeanxAo: "msg_tay_mo_nam_tu_liem".tr,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageRequirementsItem(String id_item, String model,
      String nameItem, int size1, int size2, int size3, String services) {
    return Column(
      children: [
        //
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              id_item.toString(),
              style: CustomTextStyles.labelLargeGreen600,
            ),
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Model:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.black900),
                  text: '${model} | ',
                  children: <TextSpan>[
                    TextSpan(
                      text: '${size1} x ',
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: appTheme.black900),
                    ),
                    TextSpan(
                      text: '${size2} x ',
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: appTheme.black900),
                    ),
                    TextSpan(
                      text: '${size3}',
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: appTheme.black900),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Items:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                nameItem,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              // RichText(
              //   text: TextSpan(
              //     style: theme.textTheme.bodySmall!
              //         .copyWith(color: appTheme.black900),
              //     text: '${object} | ',
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: '${size1} x ',
              //         style: theme.textTheme.bodySmall!
              //             .copyWith(color: appTheme.black900),
              //       ),
              //       TextSpan(
              //         text: '${size2} x ',
              //         style: theme.textTheme.bodySmall!
              //             .copyWith(color: appTheme.black900),
              //       ),
              //       TextSpan(
              //         text: '${size3}',
              //         style: theme.textTheme.bodySmall!
              //             .copyWith(color: appTheme.black900),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Services:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                services,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddress() {
    return Container(
      width: SizeUtils.width,
      height: 200.v,
      child: Column(
        children: [
          //
          SizedBox(height: 10.v),
          Divider(),
          SizedBox(height: 10.v),
          //
          Container(
            padding: EdgeInsets.only(left: 25.h),
            child: Column(
              children: [
                //
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Address",
                    style: CustomTextStyles.labelLargeBold,
                  ),
                ),
                SizedBox(height: 10.v),
                //
                _buildAddressItem("Long Do", "0123456789",
                    "Tay Mo, Nam Tu Liem, Ha Noi, Vietnam"),
                // //
                // _buildAddressItem("Long Do", "0123456789",
                //     "Tay Mo, Nam Tu Liem, Ha Noi, Vietnam"),
                // //
                // _buildAddressItem("Long Do", "0123456789",
                //     "Tay Mo, Nam Tu Liem, Ha Noi, Vietnam"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressItem(
      String fullName, String phoneNumber, String address) {
    return Column(
      children: [
        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Full name:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                fullName,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Phone:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                phoneNumber,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Address:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                address,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.v),
      ],
    );
  }

  /// Section Widget
  Widget _buildAgreethetermsofuse() {
    return Obx(
      () => CustomCheckboxButton(
        text1: "Agree the",
        color1: 0xff000000,
        text2: "term of use",
        color2: 0xff309cff,
        text3: "*",
        color3: 0xffff0003,
        value: controller.agreethetermsofuse.value,
        onChange: (value) {
          controller.agreethetermsofuse.value = value;
        },
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
          // 
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
          // 
          // Obx( () =>
          //     CustomIconButton(
          //     height: 60.adaptSize,
          //     width: 60.adaptSize,
          //     onTap: () {
          //       print(controller.agreethetermsofuse.value);
                
          //       // if (controller.agreethetermsofuse.value) {
          //       //   onTapBtnArrowRight();
          //       // }
          //       // else {
          //       //   print('dit ba');
          //       // }
          //     },
          //     padding: EdgeInsets.all(15.h),
          //     child: CustomImageView(
          //       imagePath: ImageConstant.imgArrowRight,
          //     ),
          //   ),
          // ),
          // 
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowRight();
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
            ),
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
  }

  /// Navigates to the sendBoxAddressScreen when the action is triggered.
  onTapBtnArrowLeft() {
    Get.toNamed(
      AppRoutes.sendBoxAddressScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
