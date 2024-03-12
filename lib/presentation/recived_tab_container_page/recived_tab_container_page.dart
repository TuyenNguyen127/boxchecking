import 'package:lastapp/presentation/send_page/send_page.dart';
import 'package:lastapp/presentation/recived_page/recived_page.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/recived_tab_container_controller.dart';
import 'models/recived_tab_container_model.dart';

class RecivedTabContainerPage extends StatelessWidget {
  RecivedTabContainerPage({Key? key})
      : super(
          key: key,
        );

  RecivedTabContainerController controller =
      Get.put(RecivedTabContainerController(RecivedTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: 391.h,
          child: SingleChildScrollView(
            child: SizedBox(
              height: 820.v,
              width: 391.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildFiftyThree(),
                  Container(
                    margin: EdgeInsets.only(top: 143.v),
                    height: 676.v,
                    child: TabBarView(
                      controller: controller.tabviewController,
                      children: [
                        SendPage(),
                        RecivedPage(),
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
  Widget _buildFiftyThree() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(left: 1.h),
        decoration: AppDecoration.fillGray,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 173.h,
                vertical: 7.v,
              ),
              decoration: AppDecoration.fillRedA,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 4.v),
                  Text(
                    "lbl_ship".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Container(
              height: 100.v,
              width: 390.h,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
              ),
              child: TabBar(
                controller: controller.tabviewController,
                isScrollable: true,
                labelColor: appTheme.redA200,
                labelStyle: TextStyle(
                  fontSize: 18.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: appTheme.blueGray300,
                unselectedLabelStyle: TextStyle(
                  fontSize: 18.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                indicatorColor: appTheme.redA200,
                tabs: [
                  Tab(
                    child: Text(
                      "lbl_send".tr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "lbl_received".tr,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
