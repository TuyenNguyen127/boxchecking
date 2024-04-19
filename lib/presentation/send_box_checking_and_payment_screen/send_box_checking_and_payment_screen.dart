import 'dart:convert';

import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/model/addressModel.dart';
import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_checkbox_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import '../send_box_address_screen/controller/send_box_address_controller.dart';
import '../send_box_choose_box_screen/controller/send_box_choose_box_controller.dart';
import 'package:http/http.dart' as http;

class SendBoxCheckingAndPaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainCheckingAndPayment();
  }
}

class MainCheckingAndPayment extends State<SendBoxCheckingAndPaymentScreen> {
  SendBoxAddressController addressController =
      Get.put(SendBoxAddressController());
  SendBoxChooseBoxController chooseController =
      Get.put(SendBoxChooseBoxController());

  bool checkTerms = false;
  List<OrderGet> listOrders = <OrderGet>[];

  double heightItems = 0.v;

  @override
  void initState() {
    for (var element in chooseController.listOrders) {
      heightItems += element.boxs.length * 130.v;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          decoration: AppDecoration.fillGray,
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildSectionTrackProgress(),
                ),
              ),
              //

              Positioned(
                top: 100.v,
                child: _buildFakeBackground(),
              ),

              Positioned(
                top: 100.v,
                child: _buildContentPageCheckingAndPayment(),
              ),
              //
              _buildArrowRightLeft(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFakeBackground() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
        height: SizeUtils.height,
        width: SizeUtils.width,
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: appTheme.redA200,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 22.h, top: 0.v, right: 22.h),
        onTap: () => onTapVector(),
      ),
      title: Text(
        'Send box',
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
                  color: appTheme.redA200,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '1',
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
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: appTheme.redA200,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10),

          //
          Center(
            child: Text(
              'Checking and Payment',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentPageCheckingAndPayment() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.v, vertical: 10.v),
      decoration: AppDecoration.fillPrimary
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
      height: SizeUtils.height - 250.v,
      width: SizeUtils.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Text("Request Data", style: CustomTextStyles.titleLargeGray800),
            //
            SizedBox(height: 10.v),
            Divider(),
            SizedBox(height: 10.v),
            //
            Container(
              height: SizeUtils.height - 350.v,
              decoration: AppDecoration.fillPrimary
                  .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //
                    _buildPackageRequirementsSection(),
                    //
                    SizedBox(height: 10.v),
                    //Divider(),
                    SizedBox(height: 10.v),
                    //
                    _buildAddress(),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildAgreethetermsofuse(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageRequirementsSection() {
    return Column(
      children: [
        //
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Packaging requirements",
            style: CustomTextStyles.labelLargeBold,
          ),
        ),
        SizedBox(height: 10.v),
        //
        Container(
          height: heightItems > 150.v ? heightItems : 150.v,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chooseController.listOrders.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: chooseController.listOrders[index].boxs.length *
                          130.v,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0.h, right: 10.h, bottom: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Order ID - " +
                                      chooseController.listOrders[index].id
                                          .toString(),
                                  style: CustomTextStyles.labelLargeBold,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: chooseController
                                  .listOrders[index].boxs.length,
                              itemBuilder: (context, i) {
                                return _buildPackageRequirementsItem(
                                    chooseController.listOrders[index].boxs[i]);
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPackageRequirementsItem(boxOrder) {
    return Column(
      children: [
        //
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 15.h),
            child: Text(
              'Box ID - ' + boxOrder.id.toString(),
              style: CustomTextStyles.labelLargeGreen600,
            ),
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 15.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Dimension:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.black900),
                  text: boxOrder.dimension,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 15.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Items:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                boxOrder.items,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 15.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Services:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                boxOrder.services,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),
      ],
    );
  }

  Widget _buildAddress() {
    return Container(
      width: SizeUtils.width,
      height: 220.v,
      child: Column(
        children: [
          //
          SizedBox(height: 10.v),
          Divider(),
          SizedBox(height: 10.v),
          //
          Container(
            padding: EdgeInsets.only(left: 0.h),
            child: Column(
              children: [
                //
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Address",
                    style: CustomTextStyles.labelLargeBold,
                  ),
                ),
                SizedBox(height: 10.v),
                //
                _buildAddressItem(addressController.tuyenListAddress[0]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressItem(Address ar) {
    return Column(
      children: [
        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Full name:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                ar.name,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Phone:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                ar.phoneNumber,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),

        //
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "Address:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                ar.address,
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.v),
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "ToWard Code:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              // Text(
              //   '${ar.towardCode}',
              //   style: theme.textTheme.bodySmall!
              //       .copyWith(color: appTheme.black900),
              // ),
            ],
          ),
        ),
        SizedBox(height: 10.v),
        Padding(
          padding: EdgeInsets.only(left: 10.h, right: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                "District ID:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                '${ar.districtId}',
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAgreethetermsofuse() {
    return CustomCheckboxButton(
      text1: "Agree the",
      color1: 0xff000000,
      text2: "term of use",
      color2: 0xff309cff,
      text3: "*",
      color3: 0xffff0003,
      value: checkTerms,
      onChange: (value) {
        setState(() {
          checkTerms = value;
        });
      },
    );
  }

  /// Section Widget
  Widget _buildArrowRightLeft() {
    return Padding(
      padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 44.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowLeft();
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
            ),
          ),

          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowRight();
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
            ),
          ),
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

  /// Navigates to the sendBoxAddressScreen when the action is triggered.
  onTapBtnArrowLeft() {
    Get.toNamed(
      AppRoutes.sendBoxAddressScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBtnArrowRight() {
    if (checkTerms) createRequestSendBox();
    // Get.toNamed(
    //   AppRoutes.homeContainerScreen,
    // );
  }

  Future<void> createRequestSendBox() async {
    try {
      var uri = Uri.https(
          '529d-118-70-128-84.ngrok-free.app', '/api/Order/OrderToWareHouse');
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'ngrok-skip-browser-warning': '69420',
        },
        body: jsonEncode(<String, dynamic>{
          "name": "tuyen",
          "phoneNumber": "0365004062",
          "address": "Cau Giay",
          "date": "2024-04-07T05:04:47.315Z",
          "toWardCode": "12345",
          "toDistrictId": 1144,
          "orderId": [1]
        }),
      );

      if (response.statusCode == 200) {
        print('buuuu');
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (e) {
      print(e);
    }
  }
}
