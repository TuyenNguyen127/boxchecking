import 'package:flutter/material.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'package:lastapp/widgets/custom_elevated_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'models/new_box.dart';
import 'controller/onb_orderbox_controller.dart';
import 'models/subject_model.dart';

import 'dart:convert'; // for JSON decoding
import 'package:flutter/services.dart' show rootBundle;

import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';

// ignore: must_be_immutable
class OnbOrderboxScreen extends flutter.StatefulWidget {
  OnbOrderboxScreen({Key? key}) : super(key: key);

  @override
  flutter.State<OnbOrderboxScreen> createState() => _OnbOrderboxScreenState();
}

class _OnbOrderboxScreenState extends flutter.State<OnbOrderboxScreen> {
  late int typeBox = 1;
  late int modelBox = 1;
  late String service = "";

  final List<Map<String, dynamic>> data = [];
  Map<String, dynamic> boxOrder_jsonData = {};

  @override
  void initState() {
    super.initState();

    String pathJsonData = 'assets/data/order_details_data.json';
    fetchData(pathJsonData).then((data) {
      OrderModel orderData = OrderModel.fromJson(data);
      orderData.boxes.forEach((box) => print(box.dimension));
    });
  }

  Future<Map<String, dynamic>> fetchData(pathJsonData) async {
    try {
      // Load JSON file
      String jsonString = await rootBundle.loadString(pathJsonData);

      // Decode JSON string
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // Return decoded JSON jsonData
      return jsonData;
    } catch (error) {
      // Handle errors
      throw Exception('Failed to load data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBarPageOrderbox(),
            body: Consumer(
              builder: (context, newBoxOrder, _) {
                return Container(
                  width: SizeUtils.width,
                  height: SizeUtils.height,
                  decoration: AppDecoration.fillGray,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: _buildSectionTrackProgress(),
                        ),
                      ),
                      Positioned(
                        top: 70.v,
                        child: Container(
                          // decoration: AppDecoration.fillGray,
                          height: SizeUtils.height - 160.v,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                _buildFormSection(context),

                                SizedBox(height: 10.v),
                                // _buildListOrder(),
                                // _buildListOrderBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 35.h, right: 35.h, bottom: 25.v),
                        child: CustomIconButton(
                          height: 60.adaptSize,
                          width: 60.adaptSize,
                          padding: EdgeInsets.all(15.h),
                          alignment: Alignment.bottomRight,
                          onTap: () {
                            onTapBtnArrowRight(context);
                          },
                          child: CustomImageView(
                            imagePath: ImageConstant.imgArrowRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarPageOrderbox() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: appTheme.redA200,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 22.h, top: 0.v, right: 22.h),
        onTap: () {
          onTapVector();
        },
      ),
      title: Text(
        'Order box',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSectionTrackProgress() {
    return Container(
      height: 160.v,
      padding: EdgeInsets.only(left: 60.v, right: 60.v, top: 10.v),
      decoration: BoxDecoration(color: appTheme.redA200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              //
              Container(
                width: 40.v,
                height: 40.v,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '1',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: appTheme.redA200,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Divider(
                  color: Colors.black38,
                ),
              ),

              //
              Container(
                width: 40.v,
                height: 40.v,
                decoration: BoxDecoration(
                  color: appTheme.redA200,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Divider(
                  color: Colors.black38,
                ),
              ),

              //
              Container(
                width: 40.v,
                height: 40.v,
                decoration: BoxDecoration(
                  color: appTheme.redA200,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // SizedBox(height: 10),

          // //
          // Center(
          //   child: Text(
          //     'Order box',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //       color: theme.colorScheme.primary,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFormSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: const Offset(
              0.5,
              0.5,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      width: SizeUtils.width,
      padding:
          EdgeInsets.only(left: 20.h, right: 20.h, bottom: 10.v, top: 10.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          // SizedBox(height: 20.v),
          //
          Container(
            // height: 10.v,
            width: SizeUtils.width,
            child: Center(
              child: Text(
                'Information about box',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          //
          // SizedBox(height: 20.v),
          // //
          // Padding(
          //   padding: EdgeInsets.only(right: 2.h),
          //   child: CustomDropDown(
          //     hintText: "lbl_type_box".tr,
          //     hintStyle: CustomTextStyles.bodyLargeBlack900,
          //     items: orderBoxController
          //         .onbOrderboxModelObj.value.dropdownItemList.value,
          //     onChanged: (value) {
          //       orderBoxController.onSelected(value);
          //       typeBox = value.id!;
          //     },
          //   ),
          // ),

          // //
          // SizedBox(height: 10.v),
          // Padding(
          //   padding: EdgeInsets.only(right: 2.h),
          //   child: CustomDropDown(
          //     hintText: "lbl_model_box".tr,
          //     hintStyle: CustomTextStyles.bodyLargeBlack900,
          //     items: orderBoxController
          //         .onbOrderboxModelObj.value.dropdownItemList1.value,
          //     onChanged: (value) {
          //       orderBoxController.onSelected1(value);
          //       modelBox = value.id!;
          //     },
          //   ),
          // ),

          // //
          // SizedBox(height: 10.v),
          // Padding(
          //   padding: EdgeInsets.only(right: 2.h),
          //   child: _buildMultiService(),
          // ),
          // SizedBox(height: 10.v),

          // CustomElevatedButton(
          //     width: 90.h,
          //     text: "lbl_add".tr,
          //     buttonStyle: CustomButtonStyles.fillRedA,
          //     onPressed: () async {
          //       final _new = NewOrderBox(
          //           typeBox: typeBox,
          //           modelBox: modelBox,
          //           services: service.length > 0 ? service : "Nothing",
          //           amount: 1);

          //       data.add(_new.toJson());
          //       print(data);
          //       orderBoxController.init();
          //       //_currentList.add(_new);
          //       orderBoxController.addNewOrderBox(typeBox, modelBox, service);
          //     }),
        ],
      ),
    );
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Navigates to the onbAddressScreen when the action is triggered.
  onTapBtnArrowRight(context) {
    // Get.toNamed(
    // AppRoutes.onbAddressScreen,
    // );

    Navigator.pushNamed(context, AppRoutes.onbAddressScreen);

    // if (ModalRoute.of(context)!.settings.arguments != null) {
    //   final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    //   final name = arguments['name'] ?? '';
    //   final phoneNumber = arguments['phoneNumber'] ?? '';
    //   final address = arguments['address'] ?? '';
    //   final date = arguments['date'] ?? '';
    //   final toWardCode = arguments['toWardCode'] ?? '';
    //   final toDistrictId = arguments['toDistrictId'] ?? 1;

    //   // print(ModalRoute.of(context)!.settings.arguments as Map);

    //   Navigator.pushNamed(
    //     context,
    //     AppRoutes.onbAddressScreen,
    //     arguments: {
    //       'name': name,
    //       'phoneNumber': phoneNumber,
    //       'address': address,
    //       'date': date,
    //       'toWardCode': toWardCode,
    //       'toDistrictId': toDistrictId,
    //       'boxs': data,
    //     },
    //   );
    // } else {
    //   Navigator.pushNamed(
    //     context,
    //     AppRoutes.onbAddressScreen,
    //     arguments: {
    //       'boxs': data,
    //     },
    //   );
    // }
  }
}
