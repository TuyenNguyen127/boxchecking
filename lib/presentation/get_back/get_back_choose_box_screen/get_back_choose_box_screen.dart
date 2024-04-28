import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/get_back_choose_box_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetBackChooseBoxScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GetBackChooseBoxState();
}

class _GetBackChooseBoxState extends State<GetBackChooseBoxScreen>
    with TickerProviderStateMixin {
  GetBackChooseBoxController getBackChooseBoxController =
      Get.put(GetBackChooseBoxController());

  List<OrderModel> listOrders = <OrderModel>[];
  bool checkAll = false;

  int? selectedDate = 1000;

  List<dynamic> dataProdateSortince = [
    {
      "time": "7 days ago",
      "id": 7,
    },
    {
      "time": "1 months ago",
      "id": 30,
    },
    {
      "time": "3 months ago",
      "id": 90,
    },
    {
      "time": "All time",
      "id": 1000,
    }
  ];

  List<OrderModel> fillDataWithDate(List<OrderModel> listOrders) {
    List<OrderModel> filteredItems = listOrders.where((item) {
      String itemDate = item.date;
      DateTime parsedItemDate = DateFormat("yyyy-MM-dd").parse(itemDate);
      DateTime now = DateTime.now();
      DateTime startDate = now.subtract(Duration(days: selectedDate!));
      return parsedItemDate.isAfter(startDate) && parsedItemDate.isBefore(now);
    }).toList();
    return filteredItems;
  }

  Future<void> requestOrder() async {
    try {
      var uri = Uri.https(dotenv.get('HOST'), '/api/Order/GetListOrderByUserId',
          {'userId': '1', 'statusId': '7'});
      final response = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "ngrok-skip-browser-warning": "69420",
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        List<OrderModel> orders = [];
        for (var json in jsonResponse) {
          List<dynamic> boxes = json['boxs'];
          List<BoxOrderModel> listBoxes = [];

          for (var box in boxes) {
            String services = '';
            for (var service in box['boxServices']) {
              services += service.toString() + ", ";
            }

            if (services.length > 0) {
              services = services.substring(0, services.length - 2);
            }

            listBoxes.add(
              BoxOrderModel(
                boxId: box['boxId'],
                boxTypeId: box['boxTypeId'],
                boxModelId: box['boxModelId'],
                listItem: box['listItem'],
                boxServices: services,
                weight: box['weight'],
                quantity: box['quantity'],
                dimension: box['dimension'],
                price: box['price'],
              ),
            );
          }

          orders.add(
            OrderModel(
              orderId: json['orderId'],
              status: json['status'],
              shipStatusName: json['shipStatusName'] ?? '',
              boxes: listBoxes,
              name: json['name'],
              phoneNumber: json['phoneNumber'],
              address: json['address'],
              date: json['date'],
              toWardCode: json['toWardCode'],
              toDistrictId: json['toDistrictId'],
            ),
          );
        }

        for (var element in orders) {
          setState(() {
            listOrders.add(element);
          });

          getBackChooseBoxController.listOrders.add(element);
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make API request.');
      }
    } catch (err) {
      print('Error occurred: ${err}');
    }
  }

  @override
  void initState() {
    if (getBackChooseBoxController.listOrders.length == 0) {
      requestOrder();
    } else {
      listOrders = getBackChooseBoxController.listOrders;
    }

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
          height: SizeUtils.height,
          width: SizeUtils.width,
          decoration: AppDecoration.fillGray,
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
                top: 70.v,
                child: _buildBodySection(),
              ),
              //
              Positioned(
                bottom: 35.v,
                right: 35.v,
                child: CustomIconButton(
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  padding: EdgeInsets.all(15.h),
                  alignment: Alignment.centerRight,
                  onTap: () {
                    onTapBtnArrowRight();
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
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
  PreferredSizeWidget _buildAppBar() {
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
        'Take back box',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.fSize,
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
                    '3',
                    style: TextStyle(
                      fontSize: 18.fSize,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
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

  Widget _topfillter(int count) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          count > 0
              ? Text(
                  'Total orders: ${count}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Text(
                  'Orders',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          SizedBox(
            height: 40,
            width: 140,
            child: DropdownButtonFormField<int>(
              decoration: InputDecoration(
                //labelText: 'Select Province',
                contentPadding:
                    EdgeInsets.only(top: 5, left: 15, right: 10, bottom: 5),
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                labelStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              focusColor: Colors.white,
              value: selectedDate,
              items: dataProdateSortince.map((date) {
                return DropdownMenuItem(
                  value: date['id'] as int,
                  child: Text(
                    date['time'] as String,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.fSize,
                    ),
                    maxLines: 1, // Limit the number of lines to 1
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDate = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBodySection() {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      height: SizeUtils.height,
      width: SizeUtils.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.v),
          _buildListOrder(context),
        ],
      ),
    );
  }

  Widget _buildListOrder(context) {
    List<OrderModel> listOrderWidget = fillDataWithDate(listOrders);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: _topfillter(listOrderWidget.length),
            value: checkAll,
            onChanged: (value) => setState(() {
              checkAll = value!;
              for (var order in listOrderWidget) {
                order.checked = value;
              }
            }),
          ),
        ),
        Container(
          //padding: EdgeInsets.symmetric(horizontal: 20.h),
          height: 600.v,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listOrderWidget.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Divider(),
                          _buildOrderBox(context, index),
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

  Widget _buildOrderBox(context, index) {
    return Container(
      child: Column(
        children: [
          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.h),
                  child: Text(
                    'Order ID:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.fSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: Text(
                    listOrders[index].orderId.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.fSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            value: listOrders[index].checked,
            onChanged: (value) => setState(() {
              if (value == false) checkAll = false;
              listOrders[index].checked = value!;
            }),
          ),
          Container(
            height: listOrders[index].boxes.length * 125.v + 23,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Boxes in order:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.fSize,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: listOrders[index].boxes.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 40, right: 20, top: 8, bottom: 8),
                        child: _buildItem(listOrders[index].boxes[i]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                    'Created at: ${listOrders[index].date.substring(0, 10)}',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.fSize,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildItem(BoxOrderModel boxOrder) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: EdgeInsets.only(left: 9.h, bottom: 5.v, top: 5.v, right: 9.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildId(
              iD: 'ID',
              widget: boxOrder.boxId.toString(),
            ),
            SizedBox(height: 10.v),
            //
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: _buildContentItem(
                imageService: ImageConstant.imgGrid,
                text: boxOrder.listItem,
                textStyleService: CustomTextStyles.labelLargeGray80002
                    .copyWith(color: appTheme.gray80002),
              ),
            ),
            SizedBox(height: 10.v),
            //
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: _buildContentItem(
                imageService: ImageConstant.imgThumbsUp,
                text: boxOrder.boxServices,
                textStyleService: CustomTextStyles.labelLargeLightblue800
                    .copyWith(color: appTheme.lightBlue800),
              ),
            ),
            SizedBox(height: 10.v),
            //
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: _buildContentItem(
                imageService: ImageConstant.imgThumbsUpBlueGray300,
                text: boxOrder.listItem,
                textStyleService: CustomTextStyles.labelLargeOrangeA700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildId({
    required String iD,
    required String widget,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          iD,
          style: CustomTextStyles.labelLargeBluegray300
              .copyWith(color: appTheme.blueGray300),
        ),
        Padding(
          padding: EdgeInsets.only(left: 9),
          child: Text(
            widget,
            style:
                theme.textTheme.labelLarge!.copyWith(color: appTheme.black900),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildContentItem({
    required String imageService,
    required String text,
    required TextStyle textStyleService,
  }) {
    return Container(
      width: 400.adaptSize,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: imageService,
            height: 10.v,
            width: 10.h,
            margin: EdgeInsets.only(top: 2.v, bottom: 2.v),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                text,
                overflow: TextOverflow.clip,
                style: textStyleService,
              ),
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
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.getBackAddressScreen,
    );
  }
}
