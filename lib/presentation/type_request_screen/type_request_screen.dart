import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:lastapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/type_request_controller.dart';

class TypeRequestScreen extends GetWidget<TypeRequestController> {
  const TypeRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBarRequestPage(context),
            // appBar: _buildAppBar(context),
            body: Container(
                width: 392.h,
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
                child: Column(children: [
                  CustomOutlinedButton(
                    text: "lbl_oder_new_box".tr,
                    buttonStyle: CustomButtonStyles.outlineBlack,
                    onPressed: () => onTapOderNewBox(),
                  ),
                  SizedBox(height: 6.v),
                  // _buildButton2(),
                  CustomOutlinedButton(
                    text: "Send box to warehouse",
                    buttonStyle: CustomButtonStyles.outlineBlack,
                    onPressed: () => onTapSendBoxToWarehouse(),
                  ),
                  SizedBox(height: 6.v),
                  CustomOutlinedButton(
                    text: "lbl_get_back_box".tr,
                    buttonStyle: CustomButtonStyles.outlineBlack,
                    onPressed: () => onTapGetBackBox(),
                  ),
                  SizedBox(height: 6.v),
                  CustomOutlinedButton(
                      text: "lbl_help".tr,
                      buttonStyle: CustomButtonStyles.outlineBlack),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 66.v,
        leadingWidth: 38.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVectorPrimary,
            margin: EdgeInsets.only(left: 26.h, top: 24.v, bottom: 21.v),
            onTap: () {
              onTapVector(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_request".tr),
        styleType: Style.bgFill);
  }

  // app bar
  PreferredSizeWidget _buildAppBarRequestPage(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: appTheme.redA200,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 22.h, top: 4.v, right: 22.h),
        onTap: () {
          onTapVector(context);
        },
      ),
      title: Text(
        'Request',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildButton2() {
    return GestureDetector(
        onTap: () {
          onTapSendBoxToWarehouse();
        },
        child: Container(
            width: 371.h,
            padding: EdgeInsets.symmetric(horizontal: 82.h, vertical: 21.v),
            decoration: AppDecoration.outlineBlack
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 4.v),
                  Text("msg_send_box_to_warehouse".tr,
                      style: CustomTextStyles.titleMediumBlack900_1)
                ])));
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapVector(context) {
    // Get.toNamed(
    //   AppRoutes.homeContainerScreen,
    // );

    // Get.offNamed(AppRoutes.typeRequestScreen);

    Navigator.pop(context);
  }

  /// Navigates to the onbOderboxScreen when the action is triggered.
  onTapOderNewBox() {
    Get.toNamed(
      AppRoutes.onbOderboxScreen,
    );
  }

  /// Navigates to the sendBoxChooseBoxScreen when the action is triggered.
  onTapSendBoxToWarehouse() {
    Get.toNamed(
      AppRoutes.sendBoxChooseBoxScreen,
    );
  }

  /// Navigates to the getBackChooseBoxScreen when the action is triggered.
  onTapGetBackBox() {
    Get.toNamed(
      AppRoutes.getBackChooseBoxScreen,
    );
  }
}
