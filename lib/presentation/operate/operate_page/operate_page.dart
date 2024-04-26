import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  int? selectedDate = 1000;

  final List<String> tabs = [
    'Processing',
    'Awaiting shipping',
    'Delivered',
    'Cancelled'
  ];

  final List<String> dateSort = [
    '7 days ago',
    '1 months ago',
    'All time',
  ];

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

  final List<Color> colors = [
    Colors.red.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
  ];

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

  Map<String, List<OrderModel>> orderStatusList = {
    'Processing': [],
    'Awaiting shipping': [],
    'Delivered': [],
    'Cancelled': [],
  };

  @override
  void initState() {
    print(listOrders.length);
    orderStatusList['Processing'] = listOrders
        .where((order) => order.shipStatusName == 'Processing')
        .toList();
    orderStatusList['Awaiting shipping'] = listOrders
        .where((order) => order.shipStatusName == 'Awaiting shipping')
        .toList();
    orderStatusList['Delivered'] = listOrders
        .where((order) => order.shipStatusName == 'Delivered')
        .toList();
    orderStatusList['Cancelled'] = listOrders
        .where((order) => order.shipStatusName == 'Cancelled')
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBarShipPage(),
        body: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              titleSpacing: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  width: double.infinity, // Đặt chiều rộng tối đa cho TabBar
                  child: TabBar(
                    labelColor: appTheme.redA200,
                    labelStyle: TextStyle(
                      fontSize: 18.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelColor: appTheme.blueGray300,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 18.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorColor: appTheme.redA200,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 10.v,
                    ),

                    isScrollable: true, // Cho phép cuộn nếu có quá nhiều tab
                    tabs: tabs.map((String tab) {
                      return Container(
                        //color: Colors.black5438,
                        //width: 150, // Đặt độ rộng tối đa cho mỗi tab
                        child: Tab(
                          text: tab,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                _orderShip('Processing'),
                _orderShip('Awaiting shipping'),
                _orderShip('Delivered'),
                _orderShip('Cancelled'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarShipPage() {
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

  Widget _topfillter(int count) {
    return Column(children: [
      SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${count} orders'),
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
      ),
      SizedBox(height: 10),
    ]);
  }

  Widget _orderShip(String status) {
    List<OrderModel> listOrderWidget =
        fillDataWithDate(orderStatusList[status]!);
    return Column(
      children: [
        _topfillter(listOrderWidget.length),
        listOrderWidget.length == 0
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: 
                    Text("No order"))
                  
            : Container(
                width: SizeUtils.width,
                height: SizeUtils.height - 250,
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
                        itemCount: listOrderWidget.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              orderItemWidget(listOrderWidget[index]),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  Widget orderItemWidget(OrderModel orderModel) {
    int priceTotal = 0;
    for (var box in orderModel.boxes) {
      priceTotal += box.price;
    }
    return Container(
      width: SizeUtils.width,
      decoration: AppDecoration.fillPrimary,
      child: Container(
        width: SizeUtils.width - 15.h * 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 15.h,
                              child: Text(
                                "ID",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: Text((orderModel.orderId).toString(),
                                  style: TextStyle(color: Colors.black)),
                            ),
                            Container(
                              width: orderModel.status.length * 7.h,
                              margin: EdgeInsets.only(left: 11.h),
                              padding: EdgeInsets.symmetric(vertical: 6.v),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(20, 20)),
                                  color: orderModel.shipStatusName == tabs[0]
                                      ? colors[0]
                                      : orderModel.shipStatusName == tabs[1]
                                          ? colors[1]
                                          : orderModel.shipStatusName == tabs[2]
                                              ? colors[2]
                                              : colors[3]),
                              child: Container(
                                width: SizeUtils.width - 30.h * 2,
                                child: Center(
                                  child: Text(
                                    orderModel.shipStatusName,
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
                          ],
                        ),
                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDetailPage(order: orderModel),
                                    ),
                                  )
                                },
                            child: Text("More details"))
                      ],
                    ),
                  ),
                  //

                  SizedBox(height: 10.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGrid,
                        color: Colors.black54,
                        height: 12.v,
                        width: 11.h,
                        margin: EdgeInsets.only(top: 4),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Container(
                          width: SizeUtils.width - 30.h * 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${orderModel.boxes.length} boxes:',
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(color: Colors.black)
                                  //style: CustomTextStyles.labelLargeGray80002,
                                  ),
                              SizedBox(height: 3.v),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return SizedBox(height: 10.v);
                                  },
                                  itemCount: orderModel.boxes.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(10, 10)),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey), // Đường viền
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ID - ${orderModel.boxes[index].boxId}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              '${orderModel.boxes[index].dimension} | ${orderModel.boxes[index].weight}kg | ${orderModel.boxes[index].boxServices}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
                                            ),
                                            Text(
                                              '${orderModel.boxes[index].listItem}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13),
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
                      ),
                    ],
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Start at: ${orderModel.date}',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          'Price: ${priceTotal} VND',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  //
                  SizedBox(height: 10.v),
                ],
              ),
            ),
            // SizedBox(height: 14.v),
          ],
        ),
      ),
    );
  }
}
