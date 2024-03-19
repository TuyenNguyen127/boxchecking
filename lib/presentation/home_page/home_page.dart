import 'package:flutter_svg/flutter_svg.dart';
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
        backgroundColor: Color(0xfff0efef),
        appBar: _buildAppBar(),
        body: Container(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  decoration: AppDecoration.fillPrimary,
                  child: Column(
                    children: [
                      SizedBox(height: 17.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgImage,
                        height: 370.v,
                        width: 295.h,
                      ),
                      SizedBox(height: 17.v),
                      _buildRequestTypeSectionOne(),
                      SizedBox(height: 17.v),
                      _buildRequestTypeSectionTwo(),
                      SizedBox(height: 17.v),
                    ],
                  ),
                ),
                SizedBox(height: 10.v),
                _buildServiceSection(),
                SizedBox(height: 10.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leadingWidth: 62.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLock,
        margin: EdgeInsets.only(left: 0.h, top: 8.v, bottom: 5.v),
      ),
      title: Container(
        width: 105.h,
        margin: EdgeInsets.only(left: 0.h, bottom: 0.v),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "lbl_hello".tr + "\n",
                style: CustomTextStyles.titleSmallff9c9c9c,
              ),
              TextSpan(
                text: "Nguyễn Tuyển",
                style: CustomTextStyles.titleSmallff000000,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgUser,
          margin: EdgeInsets.fromLTRB(16.h, 5.v, 3.h, 1.v),
        ),
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgUserPrimary,
          margin: EdgeInsets.only(left: 11.h, top: 3.v, right: 19.h),
        ),
      ],
    );
  }

  /// Section button 1
  Widget _buildRequestTypeSectionOne() {
    return
        // Obx(() =>
        GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 71.v,
                crossAxisCount: 2,
                mainAxisSpacing: 14.h,
                crossAxisSpacing: 14.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            // controller.homeModelObj.value.requesttypeItemList.value.length,
            itemBuilder: (context, index) {
              // RequesttypeItemModel model = controller
              //     .homeModelObj.value.requesttypeItemList.value[index];
              // return RequesttypeItemWidget(model, onTapCollection: () {
              //   onTapCollection();
              // });

              //
              return GestureDetector(
                onTap: () => {
                  Get.toNamed(
                    AppRoutes.typeRequestScreen,
                  )
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                  height: 50,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Color(0xffffc0c0),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Color(0xffff4c4c),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: SvgPicture.asset(
                          ImageConstant.imgTelevision,
                          width: 16,
                          height: 16,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(width: 10),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                          'Checking box',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            // fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
    // );
  }

  /// Section button 1
  Widget _buildRequestTypeSectionTwo() {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 71.v,
            crossAxisCount: 2,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 14.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
            // onTap: onTapCollection(),
            // onTap: () => onTapCollection,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              height: 50,
              width: 150,
              decoration: const BoxDecoration(
                color: Color(0xffffc0c0),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child:
                  // Row(
                  //   children: [
                  // Container(
                  //   height: 48,
                  //   width: 48,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xffff4c4c),
                  //     borderRadius: const BorderRadius.all(Radius.circular(50)),
                  //   ),
                  //   child: SvgPicture.asset(
                  //     ImageConstant.imgTelevision,
                  //     width: 16,
                  //     height: 16,
                  //     fit: BoxFit.scaleDown,
                  //   ),
                  // ),
                  // SizedBox(width: 10),
                  Center(
                child: Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              //   ],
              // ),
            ),
          );
        });
    // );
  }

  /// Section Widget
  Widget _buildServiceSection() {
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
          SizedBox(height: 15.v)
        ]));
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  // onTapCollection() {
  //   Get.toNamed(
  //     AppRoutes.typeRequestScreen,
  //   );
  // }
}
