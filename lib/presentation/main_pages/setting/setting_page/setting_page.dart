import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/setting_controller.dart';
import 'models/setting_model.dart';

// ignore: must_be_immutable
class SettingPage extends StatelessWidget {
  SettingPage({Key? key})
      : super(
          key: key,
        );

  SettingController controller = Get.put(SettingController(SettingModel().obs));

  final FIRST_HEIGHT = 200.v;
  final SECOND_HEIGHT = 200.v;
  final THIRD_HEIGHT = SizeUtils.height - 200.v - 200.v;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBarSettingPage(),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: AppDecoration.fillGray,
          //
          // child: SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 8.v),
          //     child: Column(
          //       children: [
          //         _buildView(),
          //         SizedBox(height: 10.v),
          //         _buildManagement(),
          //         SizedBox(height: 10.v),
          //         _buildSetting(),
          //       ],
          //     ),
          //   ),
          // ),
          //
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildRedBackgrBelowAppbar(),
                ),
              ),
              Positioned(
                top: 0.v,
                child: _buildContentPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentPage() {
    return Column(
      children: [
        _buildView(),
        SizedBox(height: 10.v),
        _buildManagement(),
        SizedBox(height: 10.v),
        _buildSetting(),
      ],
    );
  }

  /// appbar
  PreferredSizeWidget _buildAppBarSettingPage() {
    return AppBar(
      elevation: 0,
      backgroundColor: appTheme.redA200,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Setting',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildRedBackgrBelowAppbar() {
    return Container(
      color: appTheme.redA200,
      height: 100.v,
      width: SizeUtils.width,
    );
  }

  /// Section Widget
  Widget _buildView() {
    return SizedBox(
      width: SizeUtils.width,
      height: FIRST_HEIGHT,
      // height: 230.v,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(top: 30.v),
              padding: EdgeInsets.symmetric(
                horizontal: 105.h,
                vertical: 61.v,
              ),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 46.v),
                    child: Text(
                      "lbl_nguy_n_tuy_n2".tr,
                      style: CustomTextStyles.titleLargeBlack900_1,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgEditBlack900,
                    height: 14.adaptSize,
                    width: 14.adaptSize,
                    margin: EdgeInsets.only(
                      left: 13.h,
                      top: 4.v,
                      bottom: 52.v,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 80.adaptSize,
              width: 80.adaptSize,
              padding: EdgeInsets.all(17.h),
              decoration: AppDecoration.outlineBluegray100.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder40,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgLockPrimary,
                height: 42.adaptSize,
                width: 42.adaptSize,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildManagement() {
    return Container(
      width: SizeUtils.width,
      height: SECOND_HEIGHT,
      // width: 391.h,
      // height: 160.h,
      padding: EdgeInsets.all(11.h),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_qu_n_l_chung".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 20.v),
          Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: Row(
              children: [
                CustomIconButton(
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  padding: EdgeInsets.all(5.h),
                  decoration: IconButtonStyleHelper.fillBlueGray,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgSave,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 7.v,
                    bottom: 7.v,
                  ),
                  child: Text(
                    "lbl_a_ch".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSetting() {
    return Container(
      width: SizeUtils.width,
      height: THIRD_HEIGHT,
      // width: 391.h,
      // height: 250.h,
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_c_i_t".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 29.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30.adaptSize,
                width: 30.adaptSize,
                decoration: AppDecoration.fillRedA700.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder15,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 19.h,
                  top: 3.v,
                  bottom: 11.v,
                ),
                child: Text(
                  "lbl_th_ng_b_o".tr,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.v),
          Row(
            children: [
              CustomIconButton(
                height: 30.adaptSize,
                width: 30.adaptSize,
                padding: EdgeInsets.all(5.h),
                decoration: IconButtonStyleHelper.fillBlueGray,
                child: CustomImageView(
                  imagePath: ImageConstant.imgCheckmarkBlack900,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18.h,
                  top: 7.v,
                  bottom: 7.v,
                ),
                child: Text(
                  "lbl_b_o_m_t".tr,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }
}
