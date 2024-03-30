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
  static late bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        //
        appBar: _buildAppBarPageCheckingPayment(),
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
                child: _buildFakeBackground(),
              ),
              //
              Positioned(
                top: 100.v,
                child: _buildContentPageCheckingAndPayment(),
              ),
              //
              // Positioned(
              //   bottom: 120.v,
              //   child: _buildAgreethetermsofuse(),
              // ),
              //
              _buildArrowRightLeft(context),
            ],
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarPageCheckingPayment() {
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

  Widget _buildFakeBackground() {
    
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
        height: SizeUtils.height,
        width: SizeUtils.width,
      ),
    );
  }
  

  Widget _buildContentPageCheckingAndPayment() {
    return 
    // SingleChildScrollView(
    //   child: 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20.v, vertical: 10.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
        height: SizeUtils.height - 250.v,
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              Text("Request Data", style: CustomTextStyles.titleLargeGray800),
              //
              SizedBox(height: 10.v),
              Divider(),
              SizedBox(height: 10.v),
              //
              Container(
                height: SizeUtils.height - 350.v,
                decoration: AppDecoration.fillPrimary
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //
                      _buildPackageRequirementsSection(),
                      //
                      SizedBox(height: 10.v),
                      Divider(),
                      SizedBox(height: 10.v),
                      //
                      _buildAddress(),
                      // 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildAgreethetermsofuse(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      // ),
    );
  }

  Widget _buildPackageRequirementsItem(int amount, String nameItem, int size1,
      int size2, int size3, String services) {
    return Column(
      children: [
        //
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: RichText(
              text: TextSpan(
                text: amount.toString(),
                style: CustomTextStyles.labelLargeGreen600,
                children: <TextSpan>[
                  TextSpan(
                    text: 'x ${nameItem}',
                    style: CustomTextStyles.labelLargeGreen600,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          // padding: EdgeInsets.only(left: 10.h, right: 40.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Size:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.black900),
                  text: '${size1} x ',
                  children: <TextSpan>[
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
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          // padding: EdgeInsets.only(left: 10.h, right: 40.h),
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

  Widget _buildPackageRequirementsSection() {
    return Container(
      //height: 320.v,
      // height: 200.v,
      // padding: EdgeInsets.only(left: 25.h),
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
                1, "Carton box", 50, 50, 50, "Washing, Keeping the hotels"),
            SizedBox(height: 13.v),
            //
            _buildPackageRequirementsItem(
                1, "Carton box", 50, 50, 25, "Washing, Hang on"),
            SizedBox(height: 30.v),

            //
            _buildPackageRequirementsItem(
                1, "Carton box", 50, 50, 25, "Washing, Hang on"),
            SizedBox(height: 30.v),

            //
            _buildPackageRequirementsItem(
                1, "Carton box", 50, 50, 25, "Washing, Hang on"),
            SizedBox(height: 30.v),

            //
            _buildPackageRequirementsItem(
                1, "Carton box", 50, 50, 25, "Washing, Hang on"),
            SizedBox(height: 30.v),

            //
            _buildPackageRequirementsItem(
                1, "Carton box", 50, 50, 25, "Washing, Hang on"),
            SizedBox(height: 10.v),
            //
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 10.h),
            //     child: Text("lbl_1x_carton_box".tr,
            //         style: CustomTextStyles.labelLargeGreen600),
            //   ),
            // ),
            // SizedBox(height: 6.v),
            // //
            // Padding(
            //   padding: EdgeInsets.only(left: 10.h, right: 39.h),
            //   child: _buildSize(
            //       size: "lbl_size".tr, xXTwentyFive: "lbl_50_x_50_x_25".tr),
            // ),
            // SizedBox(height: 12.v),
            // //
            // Padding(
            //   padding: EdgeInsets.only(left: 10.h, right: 38.h),
            //   child: _buildSize(
            //       size: "lbl_services2".tr,
            //       xXTwentyFive: "msg_washing_hang_on".tr),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressItem(
      String fullName, String phoneNumber, String address) {
    return Column(
      children: [
        //
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          // padding: EdgeInsets.only(left: 10.h, right: 40.h),
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
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          // padding: EdgeInsets.only(left: 10.h, right: 40.h),
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
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          // padding: EdgeInsets.only(left: 10.h, right: 40.h),
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

  Widget _buildAddress() {
    return Container(
      //height: 100.v,
      // height: 200.v,
      // padding: EdgeInsets.only(left: 25.h),
      child: SingleChildScrollView(
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
            //
          ],
        ),
      ),
    );
  }

  // /// Section Widget
  // Widget _buildPhone() {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 33.h, right: 40.h),
  //       child:
  //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //         Padding(
  //             padding: EdgeInsets.only(bottom: 1.v),
  //             child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text("lbl_phone".tr, style: theme.textTheme.bodySmall),
  //                   SizedBox(height: 10.v),
  //                   Text("lbl_address".tr, style: theme.textTheme.bodySmall)
  //                 ])),
  //         Column(children: [
  //           Align(
  //               alignment: Alignment.centerRight,
  //               child: Text("lbl_0123456789".tr,
  //                   style: theme.textTheme.bodySmall)),
  //           SizedBox(height: 11.v),
  //           Text("msg_tay_mo_nam_tu_liem".tr, style: theme.textTheme.bodySmall)
  //         ])
  //       ]));
  // }

  // /// Common widget
  // Widget _buildSize({
  //   required String size,
  //   required String xXTwentyFive,
  // }) {
  //   return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //     Text(size,
  //         style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900)),
  //     Text(xXTwentyFive,
  //         style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900))
  //   ]);
  // }

  // /// Common widget
  // Widget _buildFullName({
  //   required String fullName,
  //   required String longDo,
  // }) {
  //   return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //     Padding(
  //         padding: EdgeInsets.only(bottom: 1.v),
  //         child: Text(fullName,
  //             style: theme.textTheme.bodySmall!
  //                 .copyWith(color: appTheme.black900))),
  //     Text(longDo,
  //         style: theme.textTheme.bodySmall!.copyWith(color: appTheme.black900))
  //   ]);
  // }

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
          isChecked = controller.agreethetermsofuse.value;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowRightLeft(BuildContext context) {
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
              //onTapBtnArrowLeft();
              Navigator.pop(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
            ),
          ),
          // 
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              if (isChecked) {
                onTapBtnArrowRight();
              }
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

  /// Navigates to the onbAddressScreen when the action is triggered.
  onTapBtnArrowLeft() {
    Get.toNamed(
      AppRoutes.onbAddressScreen,
    );
    
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }
}
