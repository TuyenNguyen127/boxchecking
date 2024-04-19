import 'dart:convert';

import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/model/addressModel.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_checkbox_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import '../get_back_address_screen/controller/get_back_address_controller.dart';
import '../get_back_choose_box_screen/controller/get_back_choose_box_controller.dart';
import 'package:http/http.dart' as http;

class GetBackCheckingAndPaymentScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainCheckingAndPayment();
  }
}

class MainCheckingAndPayment extends State<GetBackCheckingAndPaymentScreen> {
  GetBackAddressController addressController =
      Get.put(GetBackAddressController());
  GetBackChooseBoxController chooseController =
      Get.put(GetBackChooseBoxController());

  bool checkTerms = false;
  List<OrderModel> listOrders = <OrderModel>[];
  List<int> idList = [];

  double heightItems = 0.v;
  int total = 0;

  @override
  void initState() {
    for (var element in chooseController.listOrders) {
      heightItems += element.boxes.length * 160.v;
      for (var e in element.boxes) {
        total += e.price;
      }
      idList.add(element.id);
    }
    print(idList);
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
                child: _buildContentPageCheckingAndPayment(),
              ),
              //
              // Positioned(
              //   bottom: 60.v,
              //   child: _buildAddress(),
              // ),
              // //
              // Positioned(
              //   bottom: 120.v,
              //   child: _buildAgreethetermsofuse(),
              // ),
              //
              _buildArrowRightLeft(),
            ],
          ),
        ),
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
        'Get back',
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.v),
                      child: Column(
                        children: [
                          //
                          Divider(),
                          SizedBox(height: 20.v),
                          //
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(right: 3.h),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Total: ",
                                      style: theme.textTheme.titleSmall,
                                    ),
                                    TextSpan(
                                      text: '${total} VND',
                                      style: theme.textTheme.titleSmall,
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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
                      height: chooseController.listOrders[index].boxes.length *
                          155.v,
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
                                  .listOrders[index].boxes.length,
                              itemBuilder: (context, i) {
                                return _buildPackageRequirementsItem(
                                    chooseController.listOrders[index].boxes[i]);
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
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              'ID - ${boxOrder.id}',
              style: CustomTextStyles.labelLargeGreen600,
            ),
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
                "Dimension:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              RichText(
                text: TextSpan(
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: appTheme.amber900),
                  text: '${boxOrder.dimension} | ${boxOrder.weight / 1000}kg',
                ),
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
          padding: EdgeInsets.only(left: 10.h, right: 10.h),
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
                    .copyWith(color: appTheme.blue500),
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
                "Price:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                '${boxOrder.price} VND',
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.redA200),
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
            padding: EdgeInsets.only(left: 10.h),
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

  Widget _buildAddressItem(AddressModel address) {
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
                "Fullname:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                address.name,
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
                "Phone number:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                address.phoneNumber,
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
                "Address Number:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                address.addressNumber,
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
                "Ward:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              // Text(
              //   '${address.towardCode}',
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
                "District:",
                style: theme.textTheme.bodySmall!
                    .copyWith(color: appTheme.black900),
              ),
              //
              Text(
                '${address.districtId}',
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

  /// Navigates to the getBackAddressScreen when the action is triggered.
  onTapBtnArrowLeft() {
    Get.toNamed(
      AppRoutes.getBackAddressScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBtnArrowRight() async {
    if (checkTerms)
      await createRequestSendBox().then((value) {
        // Get.toNamed(
        //   AppRoutes.homeContainerScreen,
        // );
      });
  }

  Future<void> createRequestSendBox() async {
    try {
      var uri =
          Uri.https('529d-118-70-128-84.ngrok-free.app', '/api/Order/GetBack');
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'ngrok-skip-browser-warning': '69420',
        },
        body: jsonEncode(<String, dynamic>{
          "name": addressController.tuyenListAddress[0].name,
          "phoneNumber":
              addressController.tuyenListAddress[0].phoneNumber,
          "address": addressController.tuyenListAddress[0].addressNumber,
          "date": "2024-04-07T05:04:47.315Z",
          "toWardCode": '510102', //addressController.tuyenListAddress[0].towardCode,
          "toDistrictId": addressController.tuyenListAddress[0].districtId,
          "orderId": idList
        }),
      );

      if (response.statusCode == 200) {
        print('Push thành công');
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (e) {
      print(e);
    }
  }
}
