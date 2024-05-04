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
          //
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: SizeUtils.width,
              height: FIRST_HEIGHT,
              margin: EdgeInsets.only(top: 40.v),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL15,
                // border: Border.all(color: Colors.black),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //
                  Container(
                    child: Text(
                      // "lbl_nguy_n_tuy_n2".tr,
                      // style: CustomTextStyles.titleLargeBlack900_1,
                      "Nguyễn Tuyển",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.fSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  //
                  SizedBox(width: 10.h),
                  //
                  GestureDetector(
                    onTap: () {
                      onClickEditInfo();
                    },
                    child: Icon(Icons.edit),
                  ),
                  //
                ],
              ),
            ),
          ),
          //
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 80.adaptSize,
              width: 80.adaptSize,
              decoration: AppDecoration.outlineBluegray100.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder40,
              ),
              //
              // child: CustomImageView(
              //   imagePath: ImageConstant.imgLockPrimary,
              //   height: 60.adaptSize,
              //   width: 60.adaptSize,
              //   alignment: Alignment.center,
              // ),
              //
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 50.fSize,
                ),
              ),
            ),
          ),
          //
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
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            // "lbl_qu_n_l_chung".tr,
            // style: theme.textTheme.labelLarge,
            "Quản lý chung",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.fSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.v),
          //
          GestureDetector(
            onTap: () {
              onClickAddress();
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.h),
              child: Row(
                children: [
                  CustomIconButton(
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    decoration: IconButtonStyleHelper.fillBlueGray,
                    // child: CustomImageView(
                    //   imagePath: ImageConstant.imgSave,
                    // ),
                    child: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.h,
                    ),
                    child: Text(
                      // "lbl_a_ch".tr,
                      // style: theme.textTheme.labelLarge,
                      "Địa chỉ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.fSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(height: 20.v),
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
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
      decoration: AppDecoration.fillPrimary,
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       // "lbl_c_i_t".tr,
      //       // style: theme.textTheme.labelLarge,
      //       "Cài đặt",
      //       style: TextStyle(
      //         color: Colors.black,
      //         fontSize: 16.fSize,
      //         fontWeight: FontWeight.w600,
      //       ),
      //     ),
      //     SizedBox(height: 29.v),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           height: 30.adaptSize,
      //           width: 30.adaptSize,
      //           // decoration: AppDecoration.fillRedA700.copyWith(
      //           //   borderRadius: BorderRadius.circular(100),
      //           // ),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(100),
      //           ),
      //           child: CustomImageView(
      //             // color: appTheme.redA700,
      //             imagePath: ImageConstant.imgVector,
      //             height: 30.adaptSize,
      //             width: 30.adaptSize,
      //             alignment: Alignment.center,
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(
      //             left: 19.h,
      //             top: 3.v,
      //             bottom: 11.v,
      //           ),
      //           child: Text(
      //             // "lbl_th_ng_b_o".tr,
      //             "Thông báo",
      //             style: theme.textTheme.labelLarge,
      //           ),
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: 10.v),
      //     Row(
      //       children: [
      //         CustomIconButton(
      //           height: 30.adaptSize,
      //           width: 30.adaptSize,
      //           padding: EdgeInsets.all(5.h),
      //           decoration: IconButtonStyleHelper.fillBlueGray,
      //           child: CustomImageView(
      //             imagePath: ImageConstant.imgCheckmarkBlack900,
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(
      //             left: 18.h,
      //             top: 7.v,
      //             bottom: 7.v,
      //           ),
      //           child: Text(
      //             // "lbl_b_o_m_t".tr,
      //             "Bảo mật",
      //             style: theme.textTheme.labelLarge,
      //           ),
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: 10.v),
      //   ],
      // ),
      //
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cài đặt",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.fSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.v),
          //
          GestureDetector(
            onTap: () {
              onClickNotification();
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.h),
              child: Row(
                children: [
                  CustomIconButton(
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    decoration: IconButtonStyleHelper.fillBlueGray,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.h,
                    ),
                    child: Text(
                      "Thông báo",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.fSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.v),
          //
          GestureDetector(
            onTap: () {
              onClickSecurity();
            },
            child: Container(
              margin: EdgeInsets.only(left: 10.h),
              child: Row(
                children: [
                  CustomIconButton(
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    decoration: IconButtonStyleHelper.fillBlueGray,
                    child: Icon(
                      Icons.security,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10.h,
                    ),
                    child: Text(
                      "Bảo mật",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.fSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
        ],
      ),
    );
  }

  void onClickEditInfo() {
    print('edit info');
  }

  void onClickAddress() {
    print('Address');
  }

  void onClickSecurity() {
    print('Security');
  }

  void onClickNotification() {
    print('Notification');
  }
}
