import '../models/row1_item_model.dart';
import '../controller/operate_controller.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

// ignore: must_be_immutable
class Row1ItemWidget extends StatelessWidget {
  Row1ItemWidget(
    this.row1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Row1ItemModel row1ItemModelObj;

  var controller = Get.find<OperateController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 77.h,
      child: Column(
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
              row1ItemModelObj.createRequest!.value,
              style: CustomTextStyles.bodySmall11,
            ),
          ),
        ],
      ),
    );
  }
}
