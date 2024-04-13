import '../models/seventytwo_item_model.dart';
import '../controller/operate_controller.dart';
import 'package:lastapp/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class SeventytwoItemWidget extends StatelessWidget {
  SeventytwoItemWidget(
    this.seventytwoItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SeventytwoItemModel seventytwoItemModelObj;

  var controller = Get.find<OperateController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.fromLTRB(14.h, 6.v, 14.h, 7.v),
        decoration: AppDecoration.outlineBluegray300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.v),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.id!.value,
                        style: CustomTextStyles.labelLargeBluegray300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.h,
                      top: 4.v,
                      bottom: 4.v,
                    ),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.widget!.value,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgComputer,
                    height: 13.v,
                    width: 11.h,
                    margin: EdgeInsets.only(
                      left: 7.h,
                      top: 4.v,
                      bottom: 4.v,
                    ),
                  ),
                  Container(
                    width: 66.h,
                    margin: EdgeInsets.only(
                      left: 9.h,
                      top: 3.v,
                      bottom: 3.v,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 1.v,
                    ),
                    decoration: AppDecoration.fillBlue100.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.status!.value,
                        style: CustomTextStyles.labelMediumBlack900,
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomOutlinedButton(
                    height: 24.v,
                    width: 42.h,
                    text: "lbl_get".tr,
                    buttonStyle: CustomButtonStyles.outlineBlueGray,
                    buttonTextStyle: CustomTextStyles.titleSmallLightblueA70001,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.v),
            Padding(
              padding: EdgeInsets.only(
                left: 1.h,
                right: 85.h,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGrid,
                    height: 12.v,
                    width: 11.h,
                    margin: EdgeInsets.only(bottom: 4.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.commodity!.value,
                        style: CustomTextStyles.labelLargeGray80002,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgThumbsUp,
                    height: 9.v,
                    width: 11.h,
                    margin: EdgeInsets.only(
                      top: 1.v,
                      bottom: 3.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.service!.value,
                        style: CustomTextStyles.labelLargeLightblue800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpBlueGray300,
                    height: 12.v,
                    width: 11.h,
                    margin: EdgeInsets.symmetric(vertical: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.h),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.model!.value,
                        style: CustomTextStyles.labelLargeOrangeA700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgTelevisionBlueGray300,
                    height: 9.v,
                    width: 12.h,
                    margin: EdgeInsets.only(
                      top: 1.v,
                      bottom: 3.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.price!.value,
                        style: CustomTextStyles.labelLargeGreen80001,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.v),
            Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.v),
                    child: Obx(
                      () => Text(
                        seventytwoItemModelObj.startat!.value,
                        style: CustomTextStyles.labelLargeBluegray300,
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "lbl_total".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                        TextSpan(
                          text: "lbl_200000".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.v),
          ],
        ),
      ),
    );
  }
}
