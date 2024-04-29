import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/presentation/main_pages/home_page/home_page.dart';
import 'package:lastapp/presentation/main_pages/ship/ship_page.dart';
import 'package:lastapp/presentation/main_pages/operate/operate_page.dart';
import 'package:lastapp/presentation/main_pages/setting/setting_page/setting_page.dart';
import 'package:lastapp/core/app_export.dart';

import 'controller/home_container_controller.dart';

class HomeContainerScreen extends StatefulWidget {
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  HomeContainerController dataController = Get.put(HomeContainerController());
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RecivedTabContainerPage(),
    OperatePage(),
    SettingPage(),
  ];

  List<OrderModel> listOrders = [];

  Future<void> requestOrder() async {
    try {
      var uri = Uri.https(
          dotenv.get('HOST'), '/api/Order/AllOrders', {'userId': '3'});
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

          dataController.listOrderByUser.add(element);
        }
        // print(dataController.listOrderByUser.length);
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
    if (listOrders.isEmpty || dataController.listOrderByUser.isEmpty) {
      // requestOrder();
      // print(listOrders.length);
    } else {
      // for (var element in dataController.listOrderByUser) {
      //   listOrders.add(element);
      // }
    }

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onError,
        //
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_shipping),
              label: 'Ship',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.breakfast_dining_outlined),
              label: 'Operate',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
