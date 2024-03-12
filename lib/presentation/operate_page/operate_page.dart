import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'widgets/row1_item_widget.dart';
import 'models/row1_item_model.dart';
import 'widgets/seventytwo_item_widget.dart';
import 'models/seventytwo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/operate_controller.dart';
import 'models/operate_model.dart';

class OperatePage extends StatelessWidget {
  OperatePage({Key? key})
      : super(
          key: key,
        );

  OperateController controller = Get.put(OperateController(OperateModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 3.v),
            child: Container(
              height: 1014.v,
              width: 392.h,
              margin: EdgeInsets.only(bottom: 7.v),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildTop(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 599.v,
                      width: 392.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          _buildSeventyTwo(),
                          _buildStatus(),
                        ],
                      ),
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
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      height: 40.v,
      centerTitle: true,
      title: AppbarTitle(
        text: "lbl_operate".tr,
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildTop() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 11.v,
        ),
        decoration: AppDecoration.fillPrimary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.v),
                  child: Text(
                    "lbl_orders".tr,
                    style: CustomTextStyles.titleLargeBlack900,
                  ),
                ),
                CustomDropDown(
                  width: 94.h,
                  hintText: "lbl_14_days_ago".tr,
                  items:
                      controller.operateModelObj.value.dropdownItemList!.value,
                  onChanged: (value) {
                    controller.onSelected(value);
                  },
                ),
              ],
            ),
            SizedBox(height: 7.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 182.h,
                  padding: EdgeInsets.symmetric(vertical: 23.v),
                  decoration: AppDecoration.fillBlue.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 46.v,
                        width: 45.h,
                        margin: EdgeInsets.only(
                          top: 11.v,
                          bottom: 48.v,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgPlay,
                              height: 46.v,
                              width: 45.h,
                              alignment: Alignment.center,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgTelevision,
                              height: 27.v,
                              width: 24.h,
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 40.v),
                        child: Column(
                          children: [
                            Text(
                              "lbl_total_orders".tr,
                              style: CustomTextStyles.titleMediumGray80001_1,
                            ),
                            SizedBox(height: 16.v),
                            Text(
                              "lbl_100".tr,
                              style: theme.textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: 156.h,
                      padding: EdgeInsets.symmetric(vertical: 6.v),
                      decoration: AppDecoration.fillBlue10002.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.v),
                            child: _buildSeventyThree(
                              image: ImageConstant.imgCloseLightBlueA70001,
                              thumbsUp: ImageConstant.imgReply,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 9.v),
                            child: Column(
                              children: [
                                Text(
                                  "lbl_saving".tr,
                                  style:
                                      CustomTextStyles.titleMediumGray80001_1,
                                ),
                                SizedBox(height: 1.v),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 9.h),
                                    child: Text(
                                      "lbl_60".tr,
                                      style: CustomTextStyles
                                          .titleLargeBlack900SemiBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 13.v),
                    Container(
                      width: 156.h,
                      padding: EdgeInsets.symmetric(vertical: 7.v),
                      decoration: AppDecoration.fillGreenB.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.v),
                            child: _buildSeventyFour(
                              play: ImageConstant.imgPlayGreenA700,
                              airplane: ImageConstant.imgCheckmark,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.v),
                            child: Column(
                              children: [
                                Text(
                                  "lbl_received2".tr,
                                  style:
                                      CustomTextStyles.titleMediumGray80001_1,
                                ),
                                SizedBox(height: 6.v),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 22.h),
                                    child: Text(
                                      "lbl_30".tr,
                                      style: CustomTextStyles
                                          .titleLargeBlack900SemiBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 13.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 178.h,
                  padding: EdgeInsets.symmetric(vertical: 6.v),
                  decoration: AppDecoration.fillDeepOrangeB.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        child: _buildSeventyFour(
                          play: ImageConstant.imgPlayOrangeA70001,
                          airplane: ImageConstant.imgAirplane,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.v),
                        child: Column(
                          children: [
                            Text(
                              "lbl_transporting".tr,
                              style: CustomTextStyles.titleMediumGray80001_1,
                            ),
                            SizedBox(height: 5.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 42.h),
                                child: Text(
                                  "lbl_3".tr,
                                  style: CustomTextStyles
                                      .titleLargeBlack900SemiBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 9.h,
                    vertical: 6.v,
                  ),
                  decoration: AppDecoration.fillDeeporange50.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        child: _buildSeventyThree(
                          image: ImageConstant.imgEllipse15,
                          thumbsUp: ImageConstant.imgThumbsUpPrimary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 11.h,
                          top: 2.v,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "lbl_rejected".tr,
                              style: CustomTextStyles.titleMediumGray80001_1,
                            ),
                            SizedBox(height: 8.v),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 28.h),
                                child: Text(
                                  "lbl_7".tr,
                                  style: CustomTextStyles
                                      .titleLargeBlack900SemiBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.v),
            SizedBox(
              height: 65.v,
              child: Obx(
                () => ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 5.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (
                    context,
                    index,
                  ) {
                    return SizedBox(
                      width: 11.h,
                    );
                  },
                  itemCount: controller
                      .operateModelObj.value.row1ItemList.value.length,
                  itemBuilder: (context, index) {
                    Row1ItemModel model = controller
                        .operateModelObj.value.row1ItemList.value[index];
                    return Row1ItemWidget(
                      model,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 15.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyTwo() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        decoration: AppDecoration.fillPrimary,
        child: Obx(
          () => ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 12.v,
              );
            },
            itemCount: controller
                .operateModelObj.value.seventytwoItemList.value.length,
            itemBuilder: (context, index) {
              SeventytwoItemModel model = controller
                  .operateModelObj.value.seventytwoItemList.value[index];
              return SeventytwoItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStatus() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.h,
          top: 10.v,
          bottom: 558.v,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 6.h,
                top: 9.v,
                bottom: 6.v,
              ),
              child: Text(
                "lbl_14_days_ago".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
            Container(
              width: 86.h,
              margin: EdgeInsets.only(top: 1.v),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowDown,
                    height: 6.v,
                    width: 10.h,
                    margin: EdgeInsets.only(
                      top: 11.v,
                      bottom: 13.v,
                    ),
                  ),
                  Container(
                    width: 57.h,
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 21.h,
                top: 9.v,
                bottom: 6.v,
              ),
              child: Text(
                "lbl_saving2".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 29.h,
                top: 7.v,
                bottom: 8.v,
              ),
              child: Text(
                "lbl_received".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 8.v,
                bottom: 7.v,
              ),
              child: Text(
                "lbl_transporting2".tr,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildSeventyFour({
    required String play,
    required String airplane,
  }) {
    return SizedBox(
      height: 46.v,
      width: 45.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: play,
            height: 46.v,
            width: 45.h,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: airplane,
            height: 19.v,
            width: 22.h,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSeventyThree({
    required String image,
    required String thumbsUp,
  }) {
    return SizedBox(
      height: 46.v,
      width: 45.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: image,
            height: 46.v,
            width: 45.h,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: thumbsUp,
            height: 28.v,
            width: 19.h,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
