import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/app_navigation_controller.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Home - Container".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "ONB - Oderbox".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onbOrderboxScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "ONB - Address".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onbAddressScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "ONB - Checking and Payment".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.onbCheckingAndPaymentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Type Request".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.typeRequestScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Send box - Choose box".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.sendBoxChooseBoxScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Send box - Address".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.sendBoxAddressScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Send box - Checking and Payment".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.sendBoxCheckingAndPaymentScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Get back - Choose box".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.getBackChooseBoxScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Get back - Address".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.getBackAddressScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Get back - Checking and Payment".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.getBackCheckingAndPaymentScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
