import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/presentation/order_detail/order_detail.dart';

class OperatePage extends StatefulWidget {
  OperatePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<OperatePage> createState() => _OperatePageState();
}

class _OperatePageState extends State<OperatePage> {
  // =========================================================================================================
  int? selectedDate = 9999;

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
      "id": 9999,
    }
  ];

  final List<String> tabs = [
    'WaitingProcessing',
    'Processing',
    'NotYetWarehouse',
    'Shipped',
    'WaitingGetBack',
    'GetBackDelivery',
    'Done',
    'Cancelled',
  ];

  final List<Color> colors = [
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blue.shade100,
    Colors.grey.shade300,
    Colors.grey.shade300,
  ];

  List<OrderModel> listOrders = [];

  List<OrderModel> filteredByDate(List<OrderModel> listOrders) {
    List<OrderModel> filteredItems = listOrders.where((item) {
      String itemDate = item.date;
      DateTime parsedItemDate = DateFormat("yyyy-MM-dd").parse(itemDate);
      DateTime now = DateTime.now();
      DateTime startDate = now.subtract(Duration(days: selectedDate!));
      return parsedItemDate.isAfter(startDate) && parsedItemDate.isBefore(now);
    }).toList();
    return filteredItems;
  }

  List<OrderModel> waitingProcessingList = [];
  List<OrderModel> processingList = [];
  List<OrderModel> notYetWarehouseList = [];
  List<OrderModel> shippedList = [];
  List<OrderModel> waitingGetBackList = [];
  List<OrderModel> getBackDeliveryList = [];
  List<OrderModel> doneList = [];
  List<OrderModel> cancelledList = [];

  // =========================================================================================================

  final APPBAR_HEIGHT = 60.v;
  final TAB_HEIGHT = 60.v;
  final INFO_AND_DROPDOWN_HEIGHT = 60.v;

  // =========================================================================================================

  Future<void> requestOrder() async {
    try {
      var uri = Uri.https(
        dotenv.get('HOST'),
        '/api/Order/AllOrders',
        {'userId': '3'},
      );

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
          List<dynamic> boxes = json['boxOrderss'];
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
              shipStatusName: json['shippingStatus'] ?? '',
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

        setState(() {
          listOrders.clear();

          for (var element in orders) {
            listOrders.add(element);
          }
        });

        getDataOperatePage();

        // print(dataController.listOrderByUser.length);
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make API request.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  void getDataOperatePage() {
    waitingProcessingList.clear();
    processingList.clear();
    notYetWarehouseList.clear();
    shippedList.clear();
    waitingGetBackList.clear();
    getBackDeliveryList.clear();
    doneList.clear();
    cancelledList.clear();

    for (var order in listOrders) {
      OrderModel orderNeedToFilter = OrderModel(
        orderId: order.orderId,
        status: order.status,
        shipStatusName: order.shipStatusName,
        boxes: order.boxes,
        name: order.name,
        phoneNumber: order.phoneNumber,
        address: order.address,
        date: order.date,
        toWardCode: order.toWardCode,
        toDistrictId: order.toDistrictId,
      );

      switch (order.status) {
        case 'WaitingProcessing':
          waitingProcessingList.add(orderNeedToFilter);
          break;
        case 'Processing':
          processingList.add(orderNeedToFilter);
          break;
        case 'NotYetWarehouse':
          notYetWarehouseList.add(orderNeedToFilter);
          break;
        case 'Shipped':
          shippedList.add(orderNeedToFilter);
          break;
        case 'WaitingGetBack':
          waitingGetBackList.add(orderNeedToFilter);
          break;
        case 'GetBackDelivery':
          getBackDeliveryList.add(orderNeedToFilter);
          break;
        case 'Done':
          doneList.add(orderNeedToFilter);
          break;
        case 'Cancelled':
          cancelledList.add(orderNeedToFilter);
          break;
      }
    }
  }

  // =========================================================================================================

  @override
  void initState() {
    super.initState();

    requestOrder();
  }

  // =========================================================================================================

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        body: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              titleSpacing: 0,
              bottom: TabBar(
                tabAlignment: TabAlignment.start,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: appTheme.redA200,
                labelPadding: EdgeInsets.symmetric(horizontal: 10.v),
                labelColor: appTheme.redA200,
                labelStyle: TextStyle(
                  fontSize: 17.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: appTheme.blueGray300,
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.fSize,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
                isScrollable: true,
                tabs: tabs.map((String tab) {
                  String convertedString = tab
                      .replaceAllMapped(
                        RegExp(r'([a-z])([A-Z])'),
                        (Match m) => '${m[1]} ${m[2]}',
                      )
                      .replaceAllMapped(
                        RegExp(r'([A-Z])([A-Z][a-z])'),
                        (Match m) => '${m[1]} ${m[2]}',
                      );
                  return Container(
                    child: Tab(
                      text: convertedString,
                    ),
                  );
                }).toList(),
              ),
            ),
            body: TabBarView(
              children: [
                // _orderShip('WaitingProcessing'),
                // _orderShip('Processing'),
                // _orderShip('NotYetWarehouse'),
                // _orderShip('Shipped'),
                // _orderShip('WaitingGetBack'),
                // _orderShip('GetBackDelivery'),
                // _orderShip('Done'),
                // _orderShip('Cancelled'),

                _filteredListView(waitingProcessingList),
                _filteredListView(processingList),
                _filteredListView(notYetWarehouseList),
                _filteredListView(shippedList),
                _filteredListView(waitingGetBackList),
                _filteredListView(getBackDeliveryList),
                _filteredListView(doneList),
                _filteredListView(cancelledList),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: appTheme.redA200,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Operator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterListDropdown(int count) {
    return Container(
      height: INFO_AND_DROPDOWN_HEIGHT,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          Text(
            'Total orders: ${count}',
            style: TextStyle(
              color: appTheme.blue500,
              fontWeight: FontWeight.w500,
            ),
          ),
          //
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
                hintText: 'Province Name',
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
                        fontSize: 13),
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

  Widget _filteredListView(List<OrderModel> ordersList) {
    List<OrderModel> listFilteredByDate = filteredByDate(ordersList);

    return
        // SingleChildScrollView(
        //   child:
        Column(
      children: [
        //
        _buildFilterListDropdown(listFilteredByDate.length),
        //
        listFilteredByDate.length == 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: SizeUtils.width,
                    height: SizeUtils.height - APPBAR_HEIGHT * 4 - 10.v,
                    // height: SizeUtils.height - 250,
                    child: Center(
                      //
                      // child: CircularProgressIndicator(
                      //   color: Colors.red[400],
                      // ),
                      //
                      child: Text(
                        "Empty here",
                        style: TextStyle(
                          fontSize: 20.fSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(
                height: SizeUtils.height - APPBAR_HEIGHT * 4 - 10.v,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(height: 5.v);
                        },
                        itemCount: listFilteredByDate.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              operateItem(listFilteredByDate[index]),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ],
      // ),
    );
  }

  Widget operateItem(OrderModel orderItem) {
    int priceTotal = 0;
    for (var box in orderItem.boxes) {
      priceTotal += box.price;
    }
    Color thisColorState = Colors.white;
    for (int j = 0; j < tabs.length; j++) {
      if (orderItem.status.toLowerCase() == tabs[j].toLowerCase()) {
        thisColorState = colors[j];
        break;
      }
    }

    return Container(
      width: SizeUtils.width,
      decoration: AppDecoration.fillPrimary,
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Flexible(
                flex: 2,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 15.h,
                        child: Text(
                          "ID",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    //
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.h),
                        child: Text(
                          (orderItem.orderId).toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    //
                    Flexible(
                      flex: 3,
                      child: Container(
                        margin: EdgeInsets.only(left: 10.h),
                        padding: EdgeInsets.symmetric(vertical: 5.v),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(20, 20)),
                            color: thisColorState),
                        child: Container(
                          width: SizeUtils.width - 30.h * 2,
                          child: Center(
                            child: Text(
                              orderItem.status
                                  .replaceAllMapped(
                                    RegExp(r'([a-z])([A-Z])'),
                                    (Match m) => '${m[1]} ${m[2]}',
                                  )
                                  .replaceAllMapped(
                                    RegExp(r'([A-Z])([A-Z][a-z])'),
                                    (Match m) => '${m[1]} ${m[2]}',
                                  ),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontSize: 13.v,
                                color: appTheme.black900,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.h, 5.v, 10.h, 5.v),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: appTheme.blue500,
                      width: 0.75,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OrderDetailsScreen(order: orderItem)),
                      );
                    },
                    child: Text(
                      "More details",
                      style: TextStyle(
                        color: appTheme.blue500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // boxes
          SizedBox(height: 10.v),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //
              Container(
                width: 15.h,
                child: CustomImageView(
                  imagePath: ImageConstant.imgGrid,
                  color: Colors.black54,
                  height: 12.v,
                  width: 11.h,
                  margin: EdgeInsets.only(top: 4),
                ),
              ),
              //
              Container(
                padding: EdgeInsets.only(left: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    Text(
                      'Total boxes: ${orderItem.boxes.length}',
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        color: appTheme.orangeA70001,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    //
                    SizedBox(height: 5.v),
                    //
                    Container(
                      width: SizeUtils.width - 25.h * 2,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (
                          context,
                          index,
                        ) {
                          return SizedBox(height: 5.v);
                        },
                        itemCount: orderItem.boxes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1.15,
                                color: appTheme.gray300,
                              ), // Đường viền
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.h, 5.v, 10.h, 5.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ID - ${orderItem.boxes[index].boxId}',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.fSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${orderItem.boxes[index].dimension} | ${orderItem.boxes[index].weight}g | ${orderItem.boxes[index].boxServices}',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.fSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '${orderItem.boxes[index].listItem}',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.fSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // date
          SizedBox(height: 10.v),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                Flexible(
                  child: Text(
                    'Start at: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(orderItem.date))}',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: appTheme.gray800,
                      fontSize: 13.fSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                //
                SizedBox(width: 5.h),
                //
                Flexible(
                  child: Text(
                    'Price: ${priceTotal} VND',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: appTheme.green600,
                      fontSize: 15.fSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
