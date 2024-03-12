import 'package:lastapp/widgets/custom_drop_down.dart';
import 'widgets/send_item_widget.dart';
import 'models/send_item_model.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/send_controller.dart';
import 'models/send_model.dart';

class SendPage extends StatelessWidget {
  SendPage({Key? key})
      : super(
          key: key,
        );

  SendController controller = Get.put(SendController(SendModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 143.v),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Column(
                      children: [
                        _buildStatus(),
                        SizedBox(height: 15.v),
                        _buildTotal(),
                        SizedBox(height: 5.v),
                        _buildSend(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: CustomDropDown(
            width: 95.h,
            hintText: "lbl_14_days_ago".tr,
            items: controller.sendModelObj.value.dropdownItemList!.value,
            onChanged: (value) {
              controller.onSelected(value);
            },
          ),
        ),
        Container(
          width: 57.h,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 1.v,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 21.h,
            vertical: 7.v,
          ),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder15,
          ),
          child: Text(
            "lbl_all".tr,
            style: CustomTextStyles.bodySmallPrimary,
          ),
        ),
        Container(
          width: 61.h,
          margin: EdgeInsets.only(
            left: 10.h,
            top: 1.v,
          ),
          padding: EdgeInsets.all(6.h),
          decoration: AppDecoration.outlineBluegray50.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder15,
          ),
          child: Text(
            "lbl_pending".tr,
            style: theme.textTheme.bodySmall,
          ),
        ),
        Container(
          width: 67.h,
          margin: EdgeInsets.only(left: 10.h),
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 6.v,
          ),
          decoration: AppDecoration.outlineBluegray50.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder15,
          ),
          child: Text(
            "lbl_waiting".tr,
            style: theme.textTheme.bodySmall,
          ),
        ),
        Container(
          width: 69.h,
          margin: EdgeInsets.only(left: 10.h),
          padding: EdgeInsets.symmetric(
            horizontal: 2.h,
            vertical: 6.v,
          ),
          decoration: AppDecoration.outlineBluegray50.copyWith(
            borderRadius: BorderRadiusStyle.circleBorder15,
          ),
          child: Text(
            "lbl_delivering".tr,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTotal() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.h,
        right: 11.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_20_orders".tr,
            style: CustomTextStyles.labelLargeBluegray300,
          ),
          Text(
            "lbl_choose_order".tr,
            style: CustomTextStyles.labelLargeLightblueA700,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSend() {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 9.v,
          );
        },
        itemCount: controller.sendModelObj.value.sendItemList.value.length,
        itemBuilder: (context, index) {
          SendItemModel model =
              controller.sendModelObj.value.sendItemList.value[index];
          return SendItemWidget(
            model,
          );
        },
      ),
    );
  }
}
