import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/model/userModel.dart';
import 'package:lastapp/presentation/authen_page/login/login.dart';
import 'package:lastapp/presentation/authen_page/register/register.dart';
import 'package:lastapp/presentation/main_pages/home_page/home_page.dart';
import 'package:lastapp/presentation/main_pages/ship/ship_page.dart';
import 'package:lastapp/presentation/main_pages/operate/operate_page.dart';
import 'package:lastapp/presentation/main_pages/setting/setting_page/setting_page.dart';
import 'package:lastapp/core/app_export.dart';

import 'package:lastapp/service/authen/auth_service.dart';

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
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              //
              if (dataController.users.isEmpty) {
                dataController.users.add(snapshot.data!);
                print("users' length ${dataController.users.length}");

                _showDelayedToast("You've successfully signed in", 'top');
              }

              return Scaffold(
                backgroundColor: theme.colorScheme.onError,
                //
                body: Stack(
                  children: [
                    //
                    _widgetOptions.elementAt(_selectedIndex),
                    //
                    _buildBottomBarHomeContainerPage(),
                    //
                  ],
                ),
              );
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }

  Widget _buildBottomBarHomeContainerPage() {
    return Positioned(
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
    );
  }

  void _showDelayedToast(String text, String position) {
    if (position.toLowerCase() == 'top') {
      Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    } else if (position.toLowerCase() == 'bottom') {
      Fluttertoast.showToast(
        msg: text,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    }
  }
}
