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
    ShipScreen(),
    OperatePage(),
    SettingPage(),
  ];

  List<OrderModel> listOrders = [];

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
        body: Stack(
          children: [
            //
            _widgetOptions.elementAt(_selectedIndex),
            //
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomNavigationBar(
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
            //
          ],
        ),
        //
        // bottomNavigationBar: BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.local_shipping),
        //       label: 'Ship',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.breakfast_dining_outlined),
        //       label: 'Operate',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings),
        //       label: 'Settings',
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.red,
        //   showUnselectedLabels: true,
        //   unselectedItemColor: Colors.grey,
        //   onTap: _onItemTapped,
        // ),
        //
      ),
    );
  }
}