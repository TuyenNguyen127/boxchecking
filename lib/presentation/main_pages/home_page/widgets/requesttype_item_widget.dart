import '../models/requesttype_item_model.dart';
import '../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class RequesttypeItemWidget extends StatelessWidget {
  RequesttypeItemWidget(
    this.requesttypeItemModelObj, {
    Key? key,
    this.onTapCollection,
  }) : super(
          key: key,
        );

  RequesttypeItemModel requesttypeItemModelObj;

  var controller = Get.find<HomeController>();

  VoidCallback? onTapCollection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCollection!.call();
      },
      child: Container(
        padding: EdgeInsets.all(12.h),
        decoration: AppDecoration.fillDeepOrange.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0,
              margin: EdgeInsets.all(0),
              color: appTheme.redA200,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.circleBorder23,
              ),
              child: Container(
                height: 46.adaptSize,
                width: 46.adaptSize,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 9.v,
                ),
                decoration: AppDecoration.fillRedA.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder23,
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Obx(
                      () => CustomImageView(
                        imagePath: requesttypeItemModelObj.newrequest!.value,
                        height: 27.v,
                        width: 25.h,
                        alignment: Alignment.center,
                      ),
                    ),
                    Obx(
                      () => CustomImageView(
                        imagePath: requesttypeItemModelObj.newrequest1!.value,
                        height: 10.adaptSize,
                        width: 10.adaptSize,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(
                          right: 1.h,
                          bottom: 2.v,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 60.h,
              margin: EdgeInsets.only(
                left: 15.h,
                top: 3.v,
              ),
              child: Obx(
                () => Text(
                  requesttypeItemModelObj.newRequest2!.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleMediumGray80001_1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
