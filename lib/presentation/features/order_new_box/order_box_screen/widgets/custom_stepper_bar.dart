import 'package:flutter/material.dart';

import 'package:lastapp/core/app_export.dart';
import 'stepper_component.dart';

class CustomStepperBar extends StatefulWidget {
  const CustomStepperBar({Key? key}) : super(key: key);

  // late int _currentIndex;
  // CustomStepperBar(this._currentIndex);

  @override
  State<CustomStepperBar> createState() => _CustomStepperBarState();
}

class _CustomStepperBarState extends State<CustomStepperBar> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  List<String> nameOfStages = ["Order box", "Address", "Checking and Payment"];

  List<String> boxTypes = <String>['One', 'Two', 'Three', 'Four'];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> boxTypes = [
      DropdownMenuItem(child: Text("One"), value: "One"),
      DropdownMenuItem(child: Text("Two"), value: "Two"),
      DropdownMenuItem(child: Text("Three"), value: "Three"),
      DropdownMenuItem(child: Text("four"), value: "four"),
    ];
    return boxTypes;
  }

  String valueBoxType = "One";
  String? dropdownValue = "One";

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //
        _buildStepperProgessBar(),

        //
        _buildMainContent(),
      ],
    );
  }

  Widget _buildContentOrderBox() {
    return Container(
      width: 240,
      height: 500,
      decoration: BoxDecoration(color: Colors.black45),
      child: DropdownButton<String>(
        value: dropdownValue,
        // initialSelection: boxTypes.first,
        onChanged: (item) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = item;
          });
        },
        items: boxTypes
            .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: Colors.black),
                )))
            .toList(),
      ),
    );

    // return DropdownButtonFormField(
    //   decoration: InputDecoration(
    //     enabledBorder: OutlineInputBorder(
    //       borderSide: BorderSide(color: Colors.blue, width: 2),
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     border: OutlineInputBorder(
    //       borderSide: BorderSide(color: Colors.blue, width: 2),
    //       borderRadius: BorderRadius.circular(20),
    //     ),
    //     filled: true,
    //     fillColor: Colors.blueAccent,
    //   ),
    //   validator: (value) => value == null ? "Select a country" : null,
    //   dropdownColor: Colors.blueAccent,
    //   value: valueBoxType,
    //   onChanged: (String? newValue) {
    //     setState(() {
    //       valueBoxType = newValue!;
    //     });
    //   },
    //   items: dropdownItems,
    // );
  }

  Widget _buildContentAddress() {
    return Text("data");
  }

  Widget _buildContentCheckingAndPayment() {
    return Text("data");
  }

  Widget _buildMainContent() {
    return Expanded(
      child: PageView.builder(
        //only scroll with bubbles
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          //
          switch (index) {
            case 0:
              return _buildContentOrderBox();

            case 1:
              return _buildContentAddress();

            case 2:
              return _buildContentCheckingAndPayment();

            default:
              return null;
          }
        },
      ),
    );
  }

  Widget _buildStepperProgessBar() {
    return Container(
      decoration: BoxDecoration(color: appTheme.redA200),
      height: 100.v,
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //
          Row(
            children: [
              StepperComponent(
                currentIndex: _currentIndex,
                index: 0,
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                  _pageController.jumpToPage(_currentIndex);
                },
              ),
              StepperComponent(
                currentIndex: _currentIndex,
                index: 1,
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                  _pageController.jumpToPage(_currentIndex);
                },
              ),
              StepperComponent(
                currentIndex: _currentIndex,
                index: 2,
                isLast: true,
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                  });
                  _pageController.jumpToPage(_currentIndex);
                },
              ),
            ],
          ),

          SizedBox(height: 10),

          //
          Text(
            nameOfStages[_currentIndex],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
