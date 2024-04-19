import 'package:lastapp/presentation/ship/send/send_page/send_page.dart';
import 'package:lastapp/presentation/ship/received/received_page/received_page.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/received_tab_container_controller.dart';
import 'models/received_tab_container_model.dart';

// ignore: must_be_immutable
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
        appBar: _buildAppBarShipPage(),
        body: SizedBox(
          child: Column(
            children: [
              _buildFiftyThree(),
              SingleChildScrollView(
                child: SizedBox(
                  height: 650.v,
                  width: 391.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 0.v),
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
            ],
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarShipPage() {
    return AppBar(
      elevation: 0,
      backgroundColor: appTheme.redA200,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Ship',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftyThree() {
    return Align(
      alignment: Alignment.topCenter,
      child: DefaultTabController(
        length: 2,
        child: Container(
          decoration: AppDecoration.fillPrimary,
          child: Container(
            height: 50.v,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
            ),
            child: TabBar(
              controller: controller.tabviewController,
              isScrollable: false,
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
              labelPadding: EdgeInsets.symmetric(
                horizontal: 10.v,
              ),
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
        ),
      ),
    );
  }
}
