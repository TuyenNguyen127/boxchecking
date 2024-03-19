import 'package:lastapp/widgets/custom_drop_down.dart';
import 'widgets/recived_item_widget.dart';
import 'models/recived_item_model.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/recived_controller.dart';
import 'models/recived_model.dart';

class RecivedPage extends StatelessWidget {
  RecivedPage({Key? key})
      : super(
          key: key,
        );

  RecivedController controller = Get.put(RecivedController(RecivedModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: SizeUtils.width,
          child: Column(
            children: [
              _buildStatus(),
              SizedBox(height: 8.v),
              _buildTotal(),
              SizedBox(height: 8.v),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildRecived(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStatus() {
    return Container(
      decoration: BoxDecoration(color: theme.colorScheme.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 8.v, bottom: 8.v),
            child: CustomDropDown(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 4.v,
              ),
              width: 95.h,
              hintText: "lbl_14_days_ago".tr,
              items: controller.recivedModelObj.value.dropdownItemList.value,
              onChanged: (value) {
                controller.onSelected(value);
              },
            ),
          ),
          Container(
            width: 57.h,
            margin: EdgeInsets.only(left: 5.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlineBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Center(
              child: Text(
                "lbl_all".tr,
                style: CustomTextStyles.bodySmallPrimary,
              ),
            ),
          ),
          Container(
            width: 61.h,
            margin: EdgeInsets.only(left: 5.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlineBluegray50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Center(
              child: Text(
                "lbl_pending".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          Container(
            width: 67.h,
            margin: EdgeInsets.only(left: 5.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlineBluegray50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Center(
              child: Text(
                "lbl_waiting".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          Container(
            width: 69.h,
            margin: EdgeInsets.only(left: 5.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlineBluegray50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Center(
              child: Text(
                "lbl_delivering".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
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
            style: CustomTextStyles.labelLargeGray80002,
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
  Widget _buildRecived() {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(height: 5.v);
        },
        itemCount:
            controller.recivedModelObj.value.recivedItemList.value.length,
        itemBuilder: (context, index) {
          RecivedItemModel model =
              controller.recivedModelObj.value.recivedItemList.value[index];
          return RecivedItemWidget(
            model,
          );
        },
      ),
    );
  }
}
