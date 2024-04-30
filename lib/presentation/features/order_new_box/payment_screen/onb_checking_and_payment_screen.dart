import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'package:lastapp/model/addressModel.dart';
import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/presentation/features/order_new_box/address_screen/controller/onb_address_controller.dart';
import 'package:lastapp/presentation/countdown_to_get_back_home/countdown_to_get_back_home_screen.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/widgets/custom_checkbox_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';

import '../order_box_screen/controller/onb_orderbox_controller.dart';

// ignore: must_be_immutable
class OnbCheckingAndPaymentScreen extends StatefulWidget {
  OnbCheckingAndPaymentScreen({Key? key}) : super(key: key);

  @override
  State<OnbCheckingAndPaymentScreen> createState() =>
      _OnbCheckingAndPaymentScreenState();
}

class _OnbCheckingAndPaymentScreenState
    extends State<OnbCheckingAndPaymentScreen> {
  OnbOrderboxController newOrderController = Get.put(OnbOrderboxController());
  OnbAddressController addressController = Get.put(OnbAddressController());

  bool checkTerms = false;

  AddressModel addressModel = AddressModel(
      name: "Do Ngoc Long",
      phoneNumber: "0123456789",
      addressNumber: "Toa song Da, Pham Hung",
      wardCodeId: 1,
      districtId: 1,
      cityId: 1);

  OrderModel fakeOrder = OrderModel(
    orderId: 1,
    status: "WaitingGetBack",
    shipStatusName: "Finished",
    boxes: [
      BoxOrderModel(
        boxId: 1,
        boxTypeId: 1,
        boxModelId: 1,
        listItem: "10 x Quan | 10 x Ao | 10 x Giay",
        boxServices: "Hang On, Washing",
        weight: 0.1,
        quantity: 1,
        dimension: "Plastic Box | Large",
        price: 50000,
      ),
      BoxOrderModel(
        boxId: 2,
        boxTypeId: 1,
        boxModelId: 1,
        listItem: "10 x Quan | 10 x Ao | 10 x Giay",
        boxServices: "Hang On, Washing",
        weight: 0.1,
        quantity: 1,
        dimension: "Plastic Box | Large",
        price: 80000,
      ),
    ],
    name: "Do Ngoc Long",
    phoneNumber: "0123456789",
    address: "Toa song Da, Pham Hung",
    date: "2024-04-10",
    toWardCode: "1",
    toDistrictId: 1,
  );

  List<OrderModel> listOrders = [
    OrderModel(
        orderId: 1,
        status: "WaitingGetBack",
        shipStatusName: "Finished",
        boxes: [
          BoxOrderModel(
              boxId: 1,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 50000),
          BoxOrderModel(
              boxId: 2,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 80000)
        ],
        name: "Do Ngoc Long",
        phoneNumber: "0123456789",
        address: "Toa song Da, Pham Hung",
        date: "2024-04-10",
        toWardCode: "1",
        toDistrictId: 1),
    OrderModel(
        orderId: 2,
        status: "WaitingGetBack",
        shipStatusName: "Processing",
        boxes: [
          BoxOrderModel(
              boxId: 1,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 50000),
          BoxOrderModel(
              boxId: 2,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 80000),
          BoxOrderModel(
              boxId: 2,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 80000)
        ],
        name: "Do Ngoc Long",
        phoneNumber: "0123456789",
        address: "Toa song Da, Pham Hung",
        date: "2024-04-10",
        toWardCode: "1",
        toDistrictId: 1),
    OrderModel(
        orderId: 3,
        status: "WaitingGetBack",
        shipStatusName: "Delivered",
        boxes: [
          BoxOrderModel(
              boxId: 1,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 50000),
          BoxOrderModel(
              boxId: 2,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 80000),
          BoxOrderModel(
              boxId: 2,
              boxTypeId: 1,
              boxModelId: 1,
              listItem: "10 x Quan | 10 x Ao | 10 x Giay",
              boxServices: "Hang On, Washing",
              weight: 0.1,
              quantity: 1,
              dimension: "Plastic Box | Large",
              price: 80000)
        ],
        name: "Do Ngoc Long",
        phoneNumber: "0123456789",
        address: "Toa song Da, Pham Hung",
        date: "2024-04-10",
        toWardCode: "1",
        toDistrictId: 1)
  ];

  List<int> idList = [];

  double heightItems = 0.v;
  int total = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //
        appBar: _buildAppBar(),
        //
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
                  child: _buildTrackProgressSection(),
                ),
              ),
              //
              Positioned(
                top: 70.v,
                child: _buildPageContent(),
              ),
              //
              _buildArrowRightLeft(),
              //
            ],
          ),
        ),
        //
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
        'Checking and Payment',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.fSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTrackProgressSection() {
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
                      fontSize: 18.fSize,
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
                      fontSize: 18.fSize,
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
                      fontSize: 18.fSize,
                      fontWeight: FontWeight.w600,
                      color: appTheme.redA200,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPageContent() {
    return Container(
      decoration: AppDecoration.fillPrimary
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
      height: SizeUtils.height,
      width: SizeUtils.width,
      child: Column(
        children: [
          SizedBox(height: 20.v),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Order details",
                style: TextStyle(
                  fontSize: 22.fSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          //
          SizedBox(height: 20.v),
          //
          Container(
            height: SizeUtils.height - 320.v,
            decoration: AppDecoration.fillPrimary
                .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    //
                    _buildOrderDetailsSection(),
                    //
                    SizedBox(height: 20.v),
                    _buildPaymentMethodSection(),
                    //
                    SizedBox(height: 30.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildAgreeTheTermsOfUseSection(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildOrderDetailsSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.h),
      child: Column(
        children: [
          //
          addressOrderDetailContent(),
          SizedBox(height: 20.v),
          //
          packageRequirementsOrderDetailContent(),
          SizedBox(height: 20.v),
          //
          transportOrderDetailContent(),
          SizedBox(height: 20.v),
          //
          totalPriceOrderDetailContent(),
        ],
      ),
    );
  }

  Widget packageRequirementsOrderDetailContent() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Packaging requirements",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.fSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        //
        SizedBox(height: 15.v),
        //
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Column(
              children: newOrderController.listBoxes.map((box) {
                //
                bool isLastChild = false;
                if (box.boxId == newOrderController.listBoxes.last.boxId) {
                  setState(() {
                    isLastChild = true;
                  });
                }

                // children: fakeOrder.boxes.map((box) {
                //   //
                //   bool isLastChild = false;
                //   if (box.boxId == fakeOrder.boxes.last.boxId) {
                //     setState(() {
                //       isLastChild = true;
                //     });
                //   }

                //
                int priceOrder = 0;
                for (var boxItem in newOrderController.listBoxes) {
                  priceOrder += boxItem.price;
                }
                // for (var box in fakeOrder.boxes) {
                //   priceOrder += box.price;
                // }

                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
                  //
                  margin: isLastChild
                      ? EdgeInsets.only(bottom: 0)
                      : EdgeInsets.only(bottom: 10.v),
                  //
                  width: SizeUtils.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        width: 1, color: Colors.black26), // Đường viền
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      Flexible(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${box.dimension} | ${box.boxServices}',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Color(0xff309cff),
                                fontSize: 15.fSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '${box.listItem}',
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.fSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Flexible(
                        flex: 1,
                        child: Text(
                          'x ${box.quantity}',
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.fSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            //
          ],
        ),
        //
      ],
    );
  }

  Widget totalPriceOrderDetailContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Divider(),
        SizedBox(height: 20.v),
        //
        Text(
          "Total: ${20000} VND",
          style: TextStyle(
            color: appTheme.greenA700,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget transportOrderDetailContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Transport",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "${20000} VND",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.fSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget addressOrderDetailContent() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Address",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.fSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.v),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fullname:",
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                    ),
                  ),
                  Text(
                    addressController.userInformation[0].name,
                    // addressModel.name,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                    ),
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
                  Text(
                    "Phone number:",
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                    ),
                  ),
                  Text(
                    addressController.userInformation[0].phoneNumber,
                    // addressModel.phoneNumber,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.v),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Address:",
                    style: TextStyle(
                      color: appTheme.black900,
                      fontSize: 16.fSize,
                    ),
                  ),
                  Container(
                    width: SizeUtils.width / 2,
                    child: Text(
                      addressController.userInformation[0].addressFull!,
                      // addressModel.addressNumber,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: appTheme.black900,
                        fontSize: 16.fSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.v),
      ],
    );
  }

  /// Section Widget
  Widget _buildPaymentMethodSection() {
    return Column(
      children: [
        Divider(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment methods",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.fSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Tooltip(
                  message: 'Open cash payment',
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.fromLTRB(10.h, 10.v, 10.h, 10.v),
                    child: Row(
                      children: [
                        //
                        Text(
                          "Cash",
                          style: TextStyle(
                            color: Color(0xff309cff),
                            fontSize: 18.fSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        //
                        Icon(Icons.arrow_forward_ios, size: 20.v),
                        //
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildAgreeTheTermsOfUseSection() {
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
      AppRoutes.onbAddressScreen,
    );
  }

  /// Navigates to the onbAddressScreen when the action is triggered.
  onTapBtnArrowLeft() {
    Get.toNamed(
      AppRoutes.onbAddressScreen,
    );
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapBtnArrowRight() {
    // Get.toNamed(
    //   AppRoutes.homeContainerScreen,
    // );
    createRequestOrder();
  }

  // Map<String, dynamic> toJson() => {
  //       'name': onbAddressController.tuyenListAddress[0].name.toString(),
  //       'phoneNumber': onbAddressController.tuyenListAddress[0].phoneNumber.toString(),
  //       'address': onbAddressController.tuyenListAddress[0].address.toString(),
  //       'date': onbAddressController.tuyenListAddress[0].date.toString(),
  //       'towardCode': onbAddressController.tuyenListAddress[0].towardCode.toString(),
  //       'districtId': onbAddressController.tuyenListAddress[0].districtId.toString(),
  //       'box': onb_controller.khueListOrders.value;
  //     };

  Future<void> createRequestOrder() async {
    try {
      var uri = Uri.https(dotenv.get('HOST'), '/api/Order/CreateNewOrderBox');
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'ngrok-skip-browser-warning': 'true',
        },
        body: {
          "name": "Long Do",
          "phoneNumber": "0388508956",
          "address": "Tòa nhà Sông Đà, Phạm Hùng, Mỹ Đình, Nam Từ Liêm, Hà Nội",
          "date": "2024-03-29T06:45:15.053Z",
          "toWardCode": "510102",
          "toDistrictId": 1442,
          "boxs": [
            {
              "typeId": 1,
              "modelId": 1,
              "listItem": "10 cái quần, 20 cái áo",
              "services": [1, 2],
              "weight": 200,
              "quantity": 1
            }
          ]
        },
      );

      if (response.statusCode == 200) {
        //
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PendingToGetBackHomeScreen()),
        );
      } else {
        throw Exception('Failed to create album.');
      }
    } catch (e) {
      print(e);
    }
  }
}
