import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        backgroundColor: theme.colorScheme.primary,
        // backgroundColor: Colors.transparent,
        appBar: _buildAppBarOperatePage(),
        body: SizedBox(
          width: SizeUtils.width,

          child: Column(
            children: [
              //
              SizedBox(height: 5.v),
              Container(
                color: theme.colorScheme.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.h,
                  vertical: 11.v,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.v),
                      child: Text(
                        "lbl_orders".tr,
                        style: CustomTextStyles.titleLargeBlack900,
                      ),
                    ),
                    CustomDropDown(
                      width: 100.h,
                      hintText: "lbl_14_days_ago".tr,
                      items: controller
                          .operateModelObj.value.dropdownItemList!.value,
                      onChanged: (value) {
                        controller.onSelected(value);
                      },
                    ),
                  ],
                  // ),
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child:
              // _buildTop(),
              _buildSectionInfo(),
              //   ),
              // ),
              //
              _buildStatus(),
              //
              Expanded(
                child: SingleChildScrollView(
                  child: _buildSeventyTwo(),
                ),
              ),
            ],
          ),

          // child: NestedScrollView(
          //   floatHeaderSlivers: true,
          //   headerSliverBuilder:
          //       (BuildContext context1, bool innerBoxIsScrolled) {
          //     return <Widget>[
          //       // SliverAppBar(
          //       SliverOverlapAbsorber(
          //         handle:
          //             NestedScrollView.sliverOverlapAbsorberHandleFor(context1),
          //         sliver: SliverAppBar(
          //           automaticallyImplyLeading: false,
          //           title: Column(
          //             children: [
          //               //
          //               // SizedBox(height: 00.v),
          //               Container(
          //                 color: theme.colorScheme.primary,
          //                 padding: EdgeInsets.symmetric(
          //                   horizontal: 16.h,
          //                   vertical: 11.v,
          //                 ),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Padding(
          //                       padding: EdgeInsets.symmetric(vertical: 4.v),
          //                       child: Text(
          //                         "lbl_orders".tr,
          //                         style: CustomTextStyles.titleLargeBlack900,
          //                       ),
          //                     ),
          //                     CustomDropDown(
          //                       width: 100.h,
          //                       hintText: "lbl_14_days_ago".tr,
          //                       items: controller.operateModelObj.value
          //                           .dropdownItemList!.value,
          //                       onChanged: (value) {
          //                         controller.onSelected(value);
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               //
          //               _buildSectionInfo(),
          //             ],
          //           ),
          //           pinned: true,
          //           toolbarHeight: 0,
          //           // collapsedHeight: 200,
          //           // expandedHeight: 300,
          //           forceElevated: innerBoxIsScrolled,
          //           bottom: PreferredSize(
          //             preferredSize: Size.fromHeight(300),
          //             child: _buildStatus(),
          //           ),
          //         ),
          //       ),
          //     ];
          //   },
          //   body: Column(
          //     children: [
          //       Expanded(
          //         child: SingleChildScrollView(
          //           child: _buildSeventyTwo(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          //
        ),
      ),
    );
  }

  /// appbar
  PreferredSizeWidget _buildAppBarOperatePage() {
    return AppBar(
      elevation: 0,
      backgroundColor: appTheme.redA200,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Operate',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.v),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 20.v,
        crossAxisSpacing: 20.v,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: AppDecoration.fillBlue10002.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Container(
              decoration: AppDecoration.fillBlue10002.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Container(
              decoration: AppDecoration.fillGreenB.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Container(
              decoration: AppDecoration.fillDeepOrangeB.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Container(
              decoration: AppDecoration.fillDeeporange50.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTop() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 185.h,
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
                    width: 160.h,
                    padding: EdgeInsets.symmetric(vertical: 7.v),
                    decoration: AppDecoration.fillBlue10002.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.v),
                          child: _buildSeventyThree(
                            image: ImageConstant.imgCloseLightBlueA70001,
                            thumbsUp: ImageConstant.imgReply,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3.v),
                          child: Column(
                            children: [
                              Text(
                                "lbl_saving".tr,
                                style: CustomTextStyles.titleMediumGray80001_1,
                              ),
                              SizedBox(height: 6.v),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 22.h),
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
                    width: 160.h,
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
                                style: CustomTextStyles.titleMediumGray80001_1,
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
          SizedBox(height: 15.v),

          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 185.h,
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
                                style:
                                    CustomTextStyles.titleLargeBlack900SemiBold,
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
                width: 160.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.h,
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
                                style:
                                    CustomTextStyles.titleLargeBlack900SemiBold,
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
          SizedBox(height: 10.v),

          // group request buttons
          // SizedBox(
          //   height: 65.v,
          //   child: Obx(
          //     () => ListView.separated(
          //       padding: EdgeInsets.symmetric(horizontal: 5.h),
          //       scrollDirection: Axis.horizontal,
          //       separatorBuilder: (
          //         context,
          //         index,
          //       ) {
          //         return SizedBox(
          //           width: 11.h,
          //         );
          //       },
          //       itemCount: controller
          //           .operateModelObj.value.row1ItemList.value.length,
          //       itemBuilder: (context, index) {
          //         Row1ItemModel model = controller
          //             .operateModelObj.value.row1ItemList.value[index];
          //         return Row1ItemWidget(
          //           model,
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // SizedBox(height: 15.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSeventyTwo() {
    return Container(
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
            return SizedBox(height: 5.v);
          },
          itemCount:
              controller.operateModelObj.value.seventytwoItemList.value.length,
          itemBuilder: (context, index) {
            SeventytwoItemModel model = controller
                .operateModelObj.value.seventytwoItemList.value[index];
            return SeventytwoItemWidget(
              model,
            );
          },
        ),
      ),
      // ),
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
              items: controller.operateModelObj.value.dropdownItemList.value,
              onChanged: (value) {
                controller.onSelected(value);
              },
            ),
          ),
          Container(
            width: 40.h,
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
            width: 56.h,
            margin: EdgeInsets.only(left: 5.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlineBluegray50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Center(
              child: Text(
                "lbl_saving2".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          Container(
            width: 70.h,
            margin: EdgeInsets.only(left: 5.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlineBluegray50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Center(
              child: Text(
                "lbl_received".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          Container(
            width: 86.h,
            margin: EdgeInsets.only(left: 5.h),
            padding: EdgeInsets.symmetric(vertical: 8.v),
            decoration: AppDecoration.outlineBluegray50.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder15,
            ),
            child: Center(
              child: Text(
                "lbl_transporting2".tr,
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
        ],
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
