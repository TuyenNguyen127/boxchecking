import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';

import '../../home_container/controller/home_container_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeContainerController dataController = Get.put(HomeContainerController());

  int totalOrder = 0;
  int totalPrice = 0;
  int saving = 0;
  int recived = 0;
  int processing = 0;
  int shipping = 0;

  List<OrderModel> listOrders = [];

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

        getDataShipPage(orders);
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to make API request.');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  String convertValue(int value) {
    if (value > 1000000) {
      double roundedValue = (value / 10000).roundToDouble();
      return '${(roundedValue / 100).toStringAsFixed(2)}m';
    } else if (value >= 1000) {
      double roundedValue = (value / 1000).roundToDouble();
      return '${(roundedValue / 100).toStringAsFixed(2)}k';
    } else
      return value.toString();
  }

  void getDataShipPage(List<OrderModel> orders) {
    setState(() {
      totalPrice = 0;

      for (var order in orders) {
        listOrders.add(order);

        if (order.status == "WaitingProcessing") {
          processing++;
        }

        if (order.status == "Shipped") {
          saving++;
        }

        if (order.status == "GetBackDelivery") {
          recived++;
        }

        for (var boxItem in order.boxes) {
          totalPrice += boxItem.price;
        }

        totalOrder = listOrders.length;
        shipping = totalOrder - saving - recived - processing;
      }
    });
  }

  // =========================================================================================================

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
    requestOrder();
  }

  // =========================================================================================================

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0efef),
        appBar: _buildAppBar(),
        body: Container(
          width: SizeUtils.width,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    //
                    _buildBannerView(),
                    //
                    SizedBox(height: 10.v),
                    //
                    _buildSectionInfoAboutOrders(),
                    //
                    SizedBox(height: 10.v),
                    _buildServiceView(),
                    //
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leadingWidth: 60.h,
      toolbarHeight: 60.v,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(left: 10.h),
          child: Center(
            child: SvgPicture.asset(
              ImageConstant.imgLock,
              height: 50.v,
              width: 50.h,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                Colors.transparent,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          margin: EdgeInsets.only(left: 15.h),
          child: Text(
            "Nguyễn Tuyển",
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: Color(0XFF000000),
              fontSize: 18.fSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // ),
      ),
      actions: [
        //
        GestureDetector(
          onTap: () {},
          child: Container(
            child: Center(
              child: SvgPicture.asset(
                ImageConstant.imgUser,
                height: 50.v,
                width: 50.h,
                fit: BoxFit.contain,
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        //
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(left: 10.h, right: 20.h),
            child: Center(
              child: SvgPicture.asset(
                ImageConstant.imgUserPrimary,
                height: 50.v,
                width: 50.h,
                fit: BoxFit.contain,
                colorFilter:
                    ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
              ),
            ),
          ),
        ),
        //
      ],
    );
  }

  Widget _buildBannerView() {
    // Get current time
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.yMMMMd('en_US').format(now);

    // Format the current time in English
    String formattedDay = DateFormat('EEEE').format(now);
    formattedDay = formattedDay[0].toUpperCase() + formattedDay.substring(1);

    final currentHourMinSec = DateFormat.jm().format(now);

    int currentHour =
        int.parse(currentHourMinSec.toString().split(' ')[0].split(':')[0]);

    var currentHourStringAmOrPm = currentHourMinSec
        .toString()
        .substring(currentHourMinSec.toString().length - 2,
            currentHourMinSec.toString().length)
        .toLowerCase();

    return Container(
      width: SizeUtils.width,
      padding:
          EdgeInsets.only(left: 20.h, right: 20.h, bottom: 10.h, top: 25.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Text(
                'Good',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35.fSize,
                ),
              ),
              //
              Text(
                ((6 <= currentHour && currentHour <= 12) &&
                        currentHourStringAmOrPm == 'pm')
                    ? 'Evening,'
                    : (1 <= currentHour && currentHour < 6) &&
                            currentHourStringAmOrPm == 'pm'
                        ? 'Afternoon'
                        : 'Morning,',
                // 'Morning,',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 35.fSize,
                ),
              ),
            ],
          ),
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //
              Text(
                "Today's $formattedDay",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.fSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //
              Text(
                '$formattedTime',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.fSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          //
        ],
      ),
    );
  }

  Widget _buildOrderTitleView(String title) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.v),
      child: Row(
        children: [
          Text(
            title[0].toUpperCase() + title.substring(1),
            style: CustomTextStyles.titleLargeBlack900,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget iconInsideFrame({
    required String colorBackgr,
    required double sizeBackgr,
    required String icon,
    required double sizeIconBackgr,
  }) {
    return SizedBox(
      // height: 60.v,
      // width: 60.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: colorBackgr,
            height: sizeBackgr,
            width: sizeBackgr,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: icon,
            height: sizeIconBackgr,
            width: sizeIconBackgr,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget gridItem(
    crossAxisCellCount,
    mainAxisCellCount,
    colorBackgr,
    colorIconBackgr,
    sizeBackgr,
    icon,
    sizeIconBackgr,
    text,
    textColor,
    String data,
    dataColor,
  ) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: Container(
        decoration: BoxDecoration(
          color: colorBackgr,
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        //
        child: Row(
          children: [
            //
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.h, right: 0.h),
                    child: iconInsideFrame(
                      colorBackgr: colorIconBackgr,
                      sizeBackgr: 50.v,
                      icon: icon,
                      sizeIconBackgr: 50.v / 2,
                    ),
                  ),
                ],
              ),
            ),
            //
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //
                  Container(
                    child: Center(
                      child: Text(
                        text.toString()[0].toUpperCase() +
                            text.toString().substring(1) +
                            ":",
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.fSize,
                        ),
                      ),
                    ),
                  ),
                  //
                  SizedBox(height: 5.v),
                  //
                  Container(
                    child: Center(
                      child: Text(
                        data.toString(),
                        style: TextStyle(
                          color: dataColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.fSize,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionInfoAboutOrders() {
    return Container(
      width: SizeUtils.width,
      color: theme.colorScheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      child: Column(
        children: [
          //
          _buildOrderTitleView('orders'),
          //
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 20.v,
            crossAxisSpacing: 20.v,
            children: [
              gridItem(
                2,
                0.75,
                appTheme.lavender,
                ImageConstant.imgPlay,
                60.h,
                ImageConstant.imgTelevision,
                20.h,
                'Total orders',
                appTheme.gray80001,
                totalOrder.toString(),
                appTheme.black900,
              ),
              gridItem(
                2,
                0.75,
                appTheme.lavender,
                ImageConstant.imgPlay,
                60.h,
                ImageConstant.imgTelevision,
                20.h,
                'Total price',
                appTheme.gray80001,
                "${convertValue(totalPrice)} VND",
                appTheme.black900,
              ),
              gridItem(
                2,
                0.75,
                appTheme.blue10002,
                ImageConstant.imgCloseLightBlueA70001,
                50.h,
                ImageConstant.imgReply,
                16.h,
                'Saving',
                appTheme.gray80001,
                saving.toString(),
                appTheme.black900,
              ),
              gridItem(
                2,
                0.75,
                appTheme.green100B2,
                ImageConstant.imgPlayGreenA700,
                50.h,
                ImageConstant.imgCheckmark,
                20.h,
                'Received',
                appTheme.gray80001,
                recived.toString(),
                appTheme.black900,
              ),
              gridItem(
                2,
                0.75,
                appTheme.deepOrange100B2,
                ImageConstant.imgPlayOrangeA70001,
                50.h,
                ImageConstant.imgAirplane,
                18.h,
                'Shipping',
                appTheme.gray80001,
                shipping.toString(),
                appTheme.black900,
              ),
              gridItem(
                2,
                0.75,
                appTheme.deepOrange50,
                ImageConstant.imgEllipse15,
                50.h,
                ImageConstant.imgThumbsUpPrimary,
                20.h,
                'Processing',
                appTheme.gray80001,
                processing.toString(),
                appTheme.black900,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceView() {
    return Container(
      width: SizeUtils.width,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      child: Column(
        children: [
          //
          _buildOrderTitleView('services'),
          //
          Row(
            children: [
              //
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => onTapOrderNewBox(),
                  child: Container(
                    height: 140.v,
                    margin: EdgeInsets.only(right: 10.h),
                    decoration: BoxDecoration(
                      color: appTheme.deepOrange50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Container(
                        width: 70.h,
                        child: Center(
                          child: Text(
                            'Order new box',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.fSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => onTapSendBoxToWarehouse(),
                  child: Container(
                    height: 140.v,
                    margin: EdgeInsets.only(left: 10.h, right: 10.h),
                    decoration: BoxDecoration(
                      color: appTheme.deepOrange100B2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Container(
                        width: 70.h,
                        child: Center(
                          child: Text(
                            'Send order',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.fSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
              Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => onTapGetBackBox(),
                  child: Container(
                    height: 140.v,
                    margin: EdgeInsets.only(left: 10.h),
                    decoration: BoxDecoration(
                      color: appTheme.green100B2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Container(
                        width: 70.h,
                        child: Center(
                          child: Text(
                            'Get box back',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.fSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
            ],
          ),
        ],
      ),
    );
  }

  /// Navigates to the onbOderboxScreen when the action is triggered.
  onTapOrderNewBox() {
    Get.toNamed(
      AppRoutes.onbOrderboxScreen,
    );
  }

  /// Navigates to the sendBoxChooseBoxScreen when the action is triggered.
  onTapSendBoxToWarehouse() {
    Get.toNamed(
      AppRoutes.sendBoxChooseBoxScreen,
    );
  }

  /// Navigates to the getBackChooseBoxScreen when the action is triggered.
  onTapGetBackBox() {
    Get.toNamed(
      AppRoutes.getBackChooseBoxScreen,
    );
  }
}
