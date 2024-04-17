import 'package:flutter/widgets.dart';

import '../models/recived_item_model.dart';
import '../controller/recived_controller.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class RecivedItemWidget {
  RecivedItemWidget(this.recivedItemModelObj);

  RecivedItemModel recivedItemModelObj;

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
                  child: Text(
                    'ID',
                    style: CustomTextStyles.labelLargeBluegray300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.h,
                    top: 3.v,
                  ),
                  child: Text(
                    '${recivedItemModelObj.id}',
                    style: theme.textTheme.labelLarge,
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
                  child: Text(
                    '${recivedItemModelObj.status}',
                    style: CustomTextStyles.labelMediumBlack900,
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
                  child: Text(
                    '${recivedItemModelObj.address}',
                    style: CustomTextStyles.labelLargeTeal900,
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
                  child: Text(
                    '${recivedItemModelObj.dimension}',
                    style: CustomTextStyles.labelLargeGray80002,
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
                  child: Text(
                    '${recivedItemModelObj.name}',
                    style: theme.textTheme.labelLarge,
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
                  imagePath: ImageConstant.imgCall,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 1.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    '${recivedItemModelObj.phoneNumber}',
                    style: CustomTextStyles.labelLargeBlueA700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v),
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
                  child: Text(
                    '${recivedItemModelObj.note}',
                    style: CustomTextStyles.labelLargeBluegray400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.v),
          Row(
            children: [
              GestureDetector(
                onTap: () => {print('da an')},
                child: Container(
                  width: 143.h,
                  padding: EdgeInsets.symmetric(vertical: 9.v),
                  decoration: AppDecoration.outlineGray,
                  child: Center(
                    child: Text(
                      'Call shipper',
                      style: CustomTextStyles.labelLargePrimaryContainer,
                    ),
                  ),
                ),
              ),
              Container(
                width: 104.h,
                padding: EdgeInsets.symmetric(vertical: 9.v),
                decoration: AppDecoration.outlineGray,
                child: Center(
                  child: Text(
                    'Edit order',
                    style: CustomTextStyles.labelLargePrimaryContainer,
                  ),
                ),
              ),
              Container(
                width: 94.h,
                padding: EdgeInsets.symmetric(vertical: 9.v),
                decoration: AppDecoration.outlineGray,
                child: Center(
                  child: Text(
                    'Revoke',
                    style: CustomTextStyles.labelLargePrimaryContainer,
                  ),
                ),
              ),
              Container(
                width: 43.h,
                padding: EdgeInsets.symmetric(vertical: 9.v),
                decoration: AppDecoration.outlineGray,
                child: Center(
                  child: Text(
                    '...',
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
