import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'widgets/requesttype_item_widget.dart';
import 'models/requesttype_item_model.dart';
import 'widgets/view_item_widget.dart';
import 'models/view_item_model.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/home_controller.dart';
import 'models/home_model.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController(HomeModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onError,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 3.v),
                    child: Column(children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                          decoration: AppDecoration.fillPrimary,
                          child: Column(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgImage,
                                height: 307.v,
                                width: 295.h),
                            SizedBox(height: 17.v),
                            _buildRequestType()
                          ])),
                      SizedBox(height: 27.v),
                      _buildThirtyThree()
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 56.v,
        leadingWidth: 62.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgLock,
            margin: EdgeInsets.only(left: 16.h, top: 5.v, bottom: 4.v)),
        title: Container(
            width: 105.h,
            margin: EdgeInsets.only(left: 21.h),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "lbl_hello".tr,
                      style: CustomTextStyles.titleSmallff9c9c9c),
                  TextSpan(
                      text: "lbl_nguy_n_tuy_n".tr,
                      style: CustomTextStyles.titleSmallff000000)
                ]),
                textAlign: TextAlign.left)),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(16.h, 5.v, 3.h, 1.v)),
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgUserPrimary,
              margin: EdgeInsets.only(left: 11.h, top: 3.v, right: 19.h))
        ]);
  }

  /// Section Widget
  Widget _buildRequestType() {
    return Obx(() => GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 71.v,
            crossAxisCount: 2,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 14.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount:
            controller.homeModelObj.value.requesttypeItemList.value.length,
        itemBuilder: (context, index) {
          RequesttypeItemModel model =
              controller.homeModelObj.value.requesttypeItemList.value[index];
          return RequesttypeItemWidget(model, onTapCollection: () {
            onTapCollection();
          });
        }));
  }

  /// Section Widget
  Widget _buildThirtyThree() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 11.v),
        decoration: AppDecoration.fillPrimary,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_services".tr, style: CustomTextStyles.titleMediumGray80001),
          SizedBox(height: 15.v),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.h),
              child: Obx(() => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 66.v,
                      crossAxisCount: 4,
                      mainAxisSpacing: 11.h,
                      crossAxisSpacing: 11.h),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.homeModelObj.value.viewItemList.value.length,
                  itemBuilder: (context, index) {
                    ViewItemModel model =
                        controller.homeModelObj.value.viewItemList.value[index];
                    return ViewItemWidget(model);
                  }))),
          SizedBox(height: 18.v)
        ]));
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapCollection() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }
}
