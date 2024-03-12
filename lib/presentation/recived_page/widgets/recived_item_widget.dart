import '../models/recived_item_model.dart';
import '../controller/recived_controller.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class RecivedItemWidget extends StatelessWidget {
  RecivedItemWidget(
    this.recivedItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RecivedItemModel recivedItemModelObj;

  var controller = Get.find<RecivedController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Obx(
                    () => Text(
                      recivedItemModelObj.id!.value,
                      style: CustomTextStyles.labelLargeBluegray300,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    top: 3.v,
                  ),
                  child: Obx(
                    () => Text(
                      recivedItemModelObj.widget!.value,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgComputer,
                  height: 13.v,
                  width: 11.h,
                  margin: EdgeInsets.only(
                    left: 8.h,
                    top: 3.v,
                  ),
                ),
                Container(
                  width: 66.h,
                  margin: EdgeInsets.only(left: 11.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.h,
                    vertical: 1.v,
                  ),
                  decoration: AppDecoration.fillAmber1001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Obx(
                    () => Text(
                      recivedItemModelObj.status!.value,
                      style: CustomTextStyles.labelMediumBlack900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 26.v),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLinkedin,
                  height: 14.v,
                  width: 9.h,
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Obx(
                    () => Text(
                      recivedItemModelObj.xuanThuyCau!.value,
                      style: CustomTextStyles.labelLargeTeal900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(
              left: 14.h,
              right: 99.h,
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
                      recivedItemModelObj.xQuanJeanxAo!.value,
                      style: CustomTextStyles.labelLargeGray80002,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6.v),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgLockBlueGray300,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Obx(
                    () => Text(
                      recivedItemModelObj.nguyNVNTuyN!.value,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7.v),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgCall,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Obx(
                    () => Text(
                      recivedItemModelObj.mobileNo!.value,
                      style: CustomTextStyles.labelLargeBlueA700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(left: 14.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEdit,
                  height: 12.v,
                  width: 11.h,
                  margin: EdgeInsets.only(bottom: 3.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Obx(
                    () => Text(
                      recivedItemModelObj.nothing!.value,
                      style: CustomTextStyles.labelLargeBluegray400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.v),
          Row(
            children: [
              Container(
                width: 143.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 8.v,
                ),
                decoration: AppDecoration.outlineGray,
                child: Obx(
                  () => Text(
                    recivedItemModelObj.callshipper!.value,
                    style: CustomTextStyles.labelLargePrimaryContainer,
                  ),
                ),
              ),
              Container(
                width: 104.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 22.h,
                  vertical: 9.v,
                ),
                decoration: AppDecoration.outlineGray,
                child: Obx(
                  () => Text(
                    recivedItemModelObj.editorder!.value,
                    style: CustomTextStyles.labelLargePrimaryContainer,
                  ),
                ),
              ),
              Container(
                width: 104.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 9.v,
                ),
                decoration: AppDecoration.outlineGray,
                child: Obx(
                  () => Text(
                    recivedItemModelObj.revoke!.value,
                    style: CustomTextStyles.labelLargePrimaryContainer,
                  ),
                ),
              ),
              Container(
                width: 43.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 15.h,
                  vertical: 9.v,
                ),
                decoration: AppDecoration.outlineGray,
                child: Obx(
                  () => Text(
                    recivedItemModelObj.sixtySix!.value,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
