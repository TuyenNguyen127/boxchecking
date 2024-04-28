import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';

import 'controller/send_box_choose_box_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SendBoxChooseBoxScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainSendBox();
  }
}

class MainSendBox extends State<SendBoxChooseBoxScreen>
    with TickerProviderStateMixin {
  SendBoxChooseBoxController sendBoxChooseBoxController =
      Get.put(SendBoxChooseBoxController());

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
            if (services.length > 0)
              services = services.substring(0, services.length - 2);
            listBoxes.add(BoxOrderModel(
                boxId: box['boxId'],
                boxTypeId: box['boxTypeId'],
                boxModelId: box['boxModelId'],
                listItem: box['listItem'],
                boxServices: services,
                weight: box['weight'],
                quantity: box['quantity'],
                dimension: box['dimension'],
                price: box['price']));
          }
          orders.add(OrderModel(
              orderId: json['orderId'],
              status: json['status'],
              shipStatusName: json['shipStatusName'] ?? '',
              boxes: listBoxes,
              name: json['name'],
              phoneNumber: json['phoneNumber'],
              address: json['address'],
              date: json['date'],
              toWardCode: json['toWardCode'],
              toDistrictId: json['toDistrictId']));
        }
        for (var element in orders) {
          setState(() {
            listOrders.add(element);
          });

          sendBoxChooseBoxController.listOrders.add(element);
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make API request.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  void initState() {
    if (sendBoxChooseBoxController.listOrders.length == 0)
      requestOrder();
    else
      listOrders = sendBoxChooseBoxController.listOrders;
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
        'Send box to warehouse',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.fSize,
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
                      fontSize: 18.fSize,
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
          _buildListOrder(context),
        ],
      ),
    );
  }

  Widget _buildListOrder(context) {
    List<OrderModel> listOrderWidget = fillDataWithDate(listOrders);
    return Column(
      children: [
        //
        _buildFilterList(listOrderWidget),
        //
        Container(
          height: SizeUtils.height - 60.v - 80.v,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: listOrderWidget.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Divider(),
                        _buildOrderBoxItem(context, index),
                      ],
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

  Widget _buildFilterList(List<OrderModel> listOrders) {
    int countChecked = 0;
    for (var order in listOrders) {
      if (order.checked!) countChecked++;
      if (countChecked == listOrders.length) {
        setState(() {
          checkAll = true;
        });
      }
    }

    return Container(
      height: 80.v,
      width: SizeUtils.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => setState(() {
                        checkAll = !checkAll;
                        for (var order in listOrders) {
                          order.checked = checkAll;
                        }
                      }),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      checkAll ? Icons.check : null,
                      size: 20,
                      color: Colors.black,
                    ),
                  )),
              SizedBox(
                width: 10,
              ),
              listOrders.length > 0
                  ? Text(
                      'Total orders: ${listOrders.length} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.fSize,
                      ),
                    )
                  : Text(
                      'Orders',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.fSize,
                      ),
                    ),
            ],
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
                  fontSize: 12.fSize,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
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
                  fontSize: 12.fSize,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
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
                      fontWeight: FontWeight.w500,
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
                  for (var order in listOrders) {
                    order.checked = false;
                    checkAll = false;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget checkBoxCustom(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        listOrders[index].checked = !listOrders[index].checked!;
        sendBoxChooseBoxController.listOrders[index].checked =
            listOrders[index].checked;
        if (listOrders[index].checked == false) checkAll = false;
      }),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          listOrders[index].checked! ? Icons.check : null,
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildOrderBoxItem(context, index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    checkBoxCustom(index),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Order ID: ${listOrders[index].orderId}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //
          Container(
            // height: listOrders[index].boxes.length * 125.v + 60.v,
            height: listOrders[index].boxes.length * 160.v,
            child: Column(
              children: [
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        'Boxes in order:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.fSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                //
                Expanded(
                  child: ListView.builder(
                    itemCount: listOrders[index].boxes.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 50, right: 20, top: 5, bottom: 5),
                        child: _buildBoxItem(
                          listOrders[index].boxes[i],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, bottom: 10),
                child: Text(
                  'Created at: ${listOrders[index].date.substring(0, 10)}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.fSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBoxItem(BoxOrderModel boxOrder) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.grey),
      ),
      child: Container(
        padding:
            EdgeInsets.only(left: 10.h, bottom: 10.v, top: 10.v, right: 10.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.v,
                  width: 20.h,
                  child: Text(
                    'ID',
                    style: TextStyle(
                      color: appTheme.blueGray300,
                      fontSize: 15.fSize,
                    ),
                  ),
                ),
                Text(
                  boxOrder.boxId.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.fSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            //
            SizedBox(height: 10.v),
            _buildContentItemWithPicture(
              imageService: ImageConstant.imgGrid,
              text: boxOrder.listItem,
              textStyleService: TextStyle(
                color: appTheme.gray80002,
                fontSize: 15.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            //
            SizedBox(height: 10.v),
            _buildContentItemWithPicture(
              imageService: ImageConstant.imgThumbsUp,
              text: boxOrder.boxServices,
              textStyleService: TextStyle(
                color: appTheme.lightBlue800,
                fontSize: 15.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            //
            SizedBox(height: 10.v),
            _buildContentItemWithPicture(
              imageService: ImageConstant.imgThumbsUpBlueGray300,
              text: boxOrder.listItem,
              textStyleService: TextStyle(
                color: appTheme.orangeA700,
                fontSize: 15.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
            //
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildContentItemWithPicture({
    required String imageService,
    required String text,
    required TextStyle textStyleService,
  }) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20.h,
            height: 20.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: imageService,
                  height: 10.v,
                  width: 10.h,
                  margin: EdgeInsets.only(top: 2.v, bottom: 2.v),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.clip,
              style: textStyleService,
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
  onTapBtnArrowRight() {
    Get.toNamed(
      AppRoutes.sendBoxAddressScreen,
    );
  }
}
