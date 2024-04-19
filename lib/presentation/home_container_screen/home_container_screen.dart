import 'package:lastapp/presentation/home_page/home_page.dart';
import 'package:lastapp/presentation/ship/received/received_tab_container_page/received_tab_container_page.dart';
import 'package:lastapp/presentation/operate/operate_page/operate_page.dart';
import 'package:lastapp/presentation/setting/setting_page/setting_page.dart';
import 'package:lastapp/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/home_container_controller.dart';

class HomeContainerScreen extends GetWidget<HomeContainerController> {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onError,
        body: Navigator(
          key: Get.nestedKey(1),
          initialRoute: AppRoutes.homePage,
          // initialRoute: AppRoutes.orderDetailsScreen,
          onGenerateRoute: (routeSetting) => GetPageRoute(
            page: () => getCurrentPage(routeSetting.name!),
            transition: Transition.noTransition,
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.Ship:
        return AppRoutes.recivedTabContainerPage;
      case BottomBarEnum.Operate:
        return AppRoutes.operatePage;
      case BottomBarEnum.Setting:
        return AppRoutes.settingPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.recivedTabContainerPage:
        return RecivedTabContainerPage();
      case AppRoutes.operatePage:
        return OperatePage();
      case AppRoutes.settingPage:
        return SettingPage();
      default:
        return DefaultWidget();
    }
  }
}
