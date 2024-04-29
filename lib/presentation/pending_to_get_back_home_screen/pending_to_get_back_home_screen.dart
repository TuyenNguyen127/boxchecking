import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/presentation/home_container_screen/home_container_screen.dart';

class PendingToGetBackHomeScreen extends StatefulWidget {
  @override
  _PendingToGetBackHomeScreenState createState() =>
      _PendingToGetBackHomeScreenState();
}

class _PendingToGetBackHomeScreenState
    extends State<PendingToGetBackHomeScreen> {
  int _counter = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_counter == 0) {
        timer.cancel();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeContainerScreen()),
        );
      } else {
        setState(() {
          _counter--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: SizeUtils.width,
        // height: SizeUtils.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Get back home page in',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  '${_counter}',
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
