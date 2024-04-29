import '../models/view_item_model.dart';
import '../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class ViewItemWidget extends StatelessWidget {
  ViewItemWidget(
    this.viewItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ViewItemModel viewItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 46.adaptSize,
          width: 46.adaptSize,
          decoration: BoxDecoration(
            color: appTheme.blueGray100,
            borderRadius: BorderRadius.circular(
              23.h,
            ),
          ),
        ),
        SizedBox(height: 5.v),
        Obx(
          () => Text(
            viewItemModelObj.createRequest!.value,
            style: CustomTextStyles.bodySmall11,
          ),
        ),
      ],
    );
  }
}
