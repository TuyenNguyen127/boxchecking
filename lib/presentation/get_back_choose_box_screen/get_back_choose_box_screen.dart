import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/get_back_choose_box_controller.dart';

class GetBackChooseBoxScreen extends GetWidget<GetBackChooseBoxController> {
  const GetBackChooseBoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBarPageSendChooseBox(),
        body: Container(
          height: SizeUtils.height,
          width: SizeUtils.width,
          decoration: AppDecoration.fillGray,
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
                child: _buildBodySection(),
              ),
              //
              Positioned(
                bottom: 45.v,
                right: 35.v,
                child: CustomIconButton(
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  padding: EdgeInsets.all(15.h),
                  alignment: Alignment.centerRight,
                  onTap: () {
                    onTapBtnArrowRight();
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarPageSendChooseBox() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: appTheme.redA200,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 22.h, top: 0.v, right: 22.h),
        onTap: () {
          onTapVector();
        },
      ),
      title: Text(
        'Get back',
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
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: appTheme.redA200,
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
                  color: appTheme.redA200,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
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
              'Order box',
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

  /// Section Widget
  Widget _buildBodySection() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(
              0.5,
              0.5,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      height: SizeUtils.height,
      width: SizeUtils.width,
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          _buildBoxSearch(),
          SizedBox(height: 15.v),
          //
          Padding(
            padding: EdgeInsets.only(left: 0.h),
            child: CustomDropDown(
              width: 95.h,
              hintText: "lbl_14_days_ago".tr,
              items: controller
                  .getBackChooseBoxModelObj.value.dropdownItemList1!.value,
              onChanged: (value) {
                controller.onSelected1(value);
              },
            ),
          ),
          SizedBox(height: 25.v),
          //
          _buildItemByID(),
        ],
      ),
    );
  }

  Widget _buildBoxSearch() {
    return Padding(
      padding: EdgeInsets.only(left: 0.h, right: 0.h, top: 20.h),
      child: CustomDropDown(
        icon: Container(
          margin: EdgeInsets.fromLTRB(30.h, 19.v, 21.h, 19.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgSave,
            height: 12.v,
            width: 19.h,
          ),
        ),
        hintStyle: TextStyle(),
        hintText: "lbl_search_by_id".tr,
        alignment: Alignment.center,
        items:
            controller.getBackChooseBoxModelObj.value.dropdownItemList!.value,
        contentPadding: EdgeInsets.only(left: 20.h, top: 15.v, bottom: 15.v),
        onChanged: (value) {
          controller.onSelected(value);
        },
      ),
    );
  }

  Widget _buildItemByID() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20.adaptSize,
              width: 20.adaptSize,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                border: Border.all(color: appTheme.black900, width: 2.h),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Text("lbl_id".tr,
                  style: CustomTextStyles.titleSmallBlack900Medium),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.h),
              child: Text("lbl_33589549623491".tr,
                  style: CustomTextStyles.titleSmallBlack900Medium),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgBookmark,
              height: 13.v,
              width: 11.h,
              margin: EdgeInsets.only(left: 6.h, top: 3.v, bottom: 3.v),
            ),
          ],
        ),
        SizedBox(height: 12.v),

        //
        Container(
          height: 500.v,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                _buildItem(
                    "msg_33589549623491_001".tr,
                    "10x Quan jeans; 10x Ao so mi; 10x That lung da",
                    "msg_hang_on_washing".tr,
                    "lbl_box_50x50x100".tr,
                    "20/12/2023",
                    200000),
                _buildItem(
                    "msg_33589549623491_002".tr,
                    "10x Quan jeans; 10x Ao so mi; 10x That lung da",
                    "msg_hang_on_washing".tr,
                    "msg_box_50x100x100".tr,
                    "20/12/2023",
                    200000),
                _buildItem(
                    "msg_33589549623491_002".tr,
                    "10x Quan jeans; 10x Ao so mi; 10x That lung da",
                    "msg_hang_on_washing".tr,
                    "msg_box_50x100x100".tr,
                    "20/12/2023",
                    200000),
                _buildItem(
                    "msg_33589549623491_002".tr,
                    "10x Quan jeans; 10x Ao so mi; 10x That lung da",
                    "msg_hang_on_washing".tr,
                    "msg_box_50x100x100".tr,
                    "20/12/2023",
                    200000),
                _buildItem(
                    "msg_33589549623491_002".tr,
                    "10x Quan jeans; 10x Ao so mi; 10x That lung da",
                    "msg_hang_on_washing".tr,
                    "msg_box_50x100x100".tr,
                    "20/12/2023",
                    200000),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildItem(
    id_item,
    textItem,
    textService,
    amountItem,
    startDate,
    total,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(5.h, 10.v, 10.h, 10.v),
      decoration: AppDecoration.outlineBluegray300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(top: 30.v, bottom: 40.v),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              border: Border.all(color: appTheme.black900, width: 2.h),
            ),
          ),
          //
          Expanded(
            child: Container(
              width: SizeUtils.width - 20.h - 50.adaptSize - 20.adaptSize,
              child: Padding(
                padding: EdgeInsets.only(left: 9.h, bottom: 1.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildId(
                      iD: "lbl_id".tr,
                      widget: id_item,
                    ),
                    SizedBox(height: 10.v),
                    //
                    Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: _buildContentItem(
                        imageService: ImageConstant.imgThumbsUp,
                        text: textItem,
                        textStyleService: CustomTextStyles.labelLargeGray80002
                            .copyWith(color: appTheme.gray80002),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    //
                    Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: _buildContentItem(
                        imageService: ImageConstant.imgThumbsUp,
                        text: textService,
                        textStyleService: CustomTextStyles
                            .labelLargeLightblue800
                            .copyWith(color: appTheme.lightBlue800),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    //
                    Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: _buildContentItem(
                        imageService: ImageConstant.imgThumbsUpBlueGray300,
                        text: amountItem,
                        textStyleService: CustomTextStyles.labelLargeOrangeA700,
                      ),
                    ),
                    SizedBox(height: 10.v),
                    //
                    Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Row(
                        children: [
                          Text(
                            "Start at: ",
                            style: CustomTextStyles.labelLargeBluegray300,
                          ),
                          Text(
                            startDate,
                            style: CustomTextStyles.labelLargeBluegray300,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.v),
                    //
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 3.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Total: ",
                                style: theme.textTheme.titleSmall,
                              ),
                              TextSpan(
                                text: total.toString(),
                                style: theme.textTheme.titleSmall,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildId({
    required String iD,
    required String widget,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          iD,
          style: CustomTextStyles.labelLargeBluegray300
              .copyWith(color: appTheme.blueGray300),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text(
            widget,
            style:
                theme.textTheme.labelLarge!.copyWith(color: appTheme.black900),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgComputer,
          height: 13.v,
          width: 11.h,
          margin: EdgeInsets.only(left: 4.h),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildContentItem({
    required String imageService,
    required String text,
    required TextStyle textStyleService,
  }) {
    return Container(
      width: 400.adaptSize,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: imageService,
            height: 10.v,
            width: 10.h,
            margin: EdgeInsets.only(top: 2.v, bottom: 2.v),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                text,
                overflow: TextOverflow.clip,
                style: textStyleService,
              ),
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

  /// Navigates to the getBackAddressScreen when the action is triggered.
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.getBackAddressScreen,
    );
  }
}
