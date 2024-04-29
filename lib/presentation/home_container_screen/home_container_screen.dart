import 'package:lastapp/presentation/home_page/home_page.dart';
import 'package:lastapp/presentation/ship/received_tab_container_page.dart';
import 'package:lastapp/presentation/operate/operate_page/operate_page.dart';
import 'package:lastapp/presentation/setting/setting_page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

class HomeContainerScreen extends StatefulWidget {
  // GetWidget<HomeContainerController>
  const HomeContainerScreen({Key? key}) : super(key: key);

  @override
  State<HomeContainerScreen> createState() => _HomeContainerScreenState();
}

class _HomeContainerScreenState extends State<HomeContainerScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RecivedTabContainerPage(),
    OperatePage(),
    SettingPage(),
  ];

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
              icon: Icon(Icons.business),
              label: 'Ship',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
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
