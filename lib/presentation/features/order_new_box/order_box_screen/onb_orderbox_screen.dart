import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';

import '../../../../widgets/custom_icon_button.dart';
import 'controller/onb_orderbox_controller.dart';

// ignore: must_be_immutable
class OnbOrderboxScreen extends StatefulWidget {
  OnbOrderboxScreen({Key? key}) : super(key: key);

  @override
  State<OnbOrderboxScreen> createState() => _OnbOrderboxScreenState();
}

class _OnbOrderboxScreenState extends State<OnbOrderboxScreen> {
  //==============================================================================
  // CONTROLLER
  OnbOrderboxController newOrderController = Get.put(OnbOrderboxController());

  //==============================================================================
  // DECLARE VARIABLES

  // LAYOUT VARIABLES
  final APPBAR_HEIGHT = 60.v;
  final TRACKPROGRESS_HEIGHT = 60.v + 18.v;
  final BACKGR_COMBINE_WITH_TRACKPROGRESS_HEIGHT = 20.v;
  final INFO_SECTION_HEIGHT = 350.v;

  // LOGICAL VARIABLES
  int maxAmountItemsCanHandle = 50;

  late StateSetter _listOrderBoxSetState;

  int initialAmountInput = 1;

  List<dynamic> dataTypeBox = [
    {
      "id": 1,
      "name": "Plastic",
    },
    {
      "id": 2,
      "name": "Carton",
    },
  ];
  List<dynamic> dataModelBox = [
    {
      "id": 1,
      "idTypeBox": 1,
      "name": "Large",
      "description": "height: 130 cm, width: 130 cm, length: 130 cm",
      "size": "130x130x130",
    },
    {
      "id": 2,
      "idTypeBox": 1,
      "name": "Medium",
      "description": "height: 100 cm, width: 100 cm, length: 100 cm",
      "size": "100x100x100",
    },
    {
      "id": 3,
      "idTypeBox": 1,
      "name": "Small",
      "description": "height: 50 cm, width: 50 cm, length: 50 cm",
      "size": "50x50x50",
    },
    {
      "id": 1,
      "idTypeBox": 2,
      "name": "Large",
      "description": "height: 130 cm, width: 130 cm, length: 130 cm",
      "size": "130x130x130",
    },
    {
      "id": 2,
      "idTypeBox": 2,
      "name": "Medium",
      "description": "height: 100 cm, width: 100 cm, length: 100 cm",
      "size": "100x100x100",
    },
    {
      "id": 3,
      "idTypeBox": 2,
      "name": "Small",
      "description": "height: 50 cm, width: 50 cm, length: 50 cm",
      "size": "50x50x50",
    },
  ];
  List<Map<dynamic, dynamic>> listServices = [
    {
      "name": 'Washing',
      "id": 1,
    },
    {
      "name": 'Hang On',
      "id": 2,
    },
  ];

  List<BoxOrderModel> listBoxOrder = <BoxOrderModel>[];
  BoxOrderModel boxOrder = BoxOrderModel(
    boxId: 1,
    boxTypeId: 1,
    boxModelId: 1,
    listItem: '',
    boxServices: '',
    weight: 0,
    quantity: 0,
    dimension: '',
    price: 0,
  );

  dynamic selectedTypeBoxId = null;
  dynamic selectedModelBoxId = null;
  dynamic typeBox = null;
  dynamic modelBox = null;

  final TextEditingController _chooseItemsTextToFillController =
      TextEditingController();
  List<Map<String, dynamic>> _listOrderBoxItemsInModal = [];
  List<Map<String, dynamic>> _listOrderBoxItemsInModalAfterSaving = [];
  List<Map<String, dynamic>> _listOrderBoxItems = [];

  List<String> _listSelectedServicesInModal = [];
  List<String> _listSelectedServicesInModalAfterSaving = [];

  //==============================================================================

  Future<Map<String, dynamic>> fetchData(pathJsonData) async {
    try {
      // Load JSON file
      String jsonString = await rootBundle.loadString(pathJsonData);

      // Decode JSON string
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      // Return decoded JSON jsonData
      return jsonData;
    } catch (error) {
      // Handle errors
      throw Exception('Failed to load data: $error');
    }
  }

  //==============================================================================

  @override
  void initState() {
    super.initState();

    for (var orderItem in newOrderController.listBoxes) {
      listBoxOrder.add(orderItem);
    }

    // String pathJsonData = 'assets/data/order_details_data.json';
    // fetchData(pathJsonData).then((data) {
    //   OrderModel orderData = OrderModel.fromJson(data);
    //   orderData.boxes.forEach((box) => print(box.dimension));
    // });
  }

  @override
  Widget build(BuildContext context) {
    // return Consumer(
    //   builder: (context, ref, _) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: _buildAppBarPageOrderbox(),

        // upgrade from prototype
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: AppDecoration.fillGray,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildSectionTrackProgress(),
                ),
              ),
              //
              Positioned(
                top: 60.v,
                child: Column(
                  children: [
                    //
                    Container(
                      height: BACKGR_COMBINE_WITH_TRACKPROGRESS_HEIGHT,
                      width: SizeUtils.width,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    //
                    Container(
                      height: SizeUtils.height - APPBAR_HEIGHT * 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //
                            _buildFormInfoSection(),
                            SizedBox(height: 10.v),
                            //
                            _buildListOrderBox(),
                            SizedBox(height: 10.v),
                          ],
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
              //
              Container(
                padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 25.v),
                child: CustomIconButton(
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  padding: EdgeInsets.all(15.h),
                  alignment: Alignment.bottomRight,
                  onTap: () {
                    onTapBtnArrowRight(context);
                  },
                  child: CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                  ),
                ),
              ),
            ],
          ),
        ),

        //
        //     );
        //   },
        // ),
      ),
    );
    //   },
    // );
  }

  //==============================================================================
  // WIDGETS

  // app bar
  PreferredSizeWidget _buildAppBarPageOrderbox() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: appTheme.redA200,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 22.h, top: 0.v, right: 22.h),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Warning',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                content: Text(
                  'Are you want to quit ?',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
                actions: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Đóng dialog khi nhấn "No"
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onClickBackToHomepageBtn();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Yes',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
      title: Text(
        'Order new box',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// track progress
  Widget _buildSectionTrackProgress() {
    return Container(
      height: TRACKPROGRESS_HEIGHT,
      padding:
          EdgeInsets.only(left: 60.v, right: 60.v, top: 10.v, bottom: 10.v),
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
                      fontSize: 18,
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
                      fontSize: 18,
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
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// first section
  Widget _buildFormInfoSection() {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        // borderRadius: BorderRadius.only(
        //   topRight: Radius.circular(30),
        //   topLeft: Radius.circular(30),
        // ),
      ),
      width: SizeUtils.width,
      padding:
          // EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.v, top: 20.v),
          EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.v, top: 0.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          Container(
            width: SizeUtils.width,
            child: Center(
              child: Text(
                'Information about box',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.fSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          //
          SizedBox(height: 20.v),
          //
          formInfo(),
          //
        ],
      ),
    );
  }

  /// form info
  Widget formInfo() {
    return Container(
      height: INFO_SECTION_HEIGHT,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        color: theme.colorScheme.primary,
      ),
      width: SizeUtils.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          formInfoInputTypeBox(),
          SizedBox(height: 20.v),
          //
          formInfoInputModelBox(),
          SizedBox(height: 20.v),
          //
          formInfoInputService(),
          SizedBox(height: 20.v),
          //
          formInfoInputOpenChooseItems(),
          SizedBox(height: 20.v),
          //
          formInfoAddBtn(),
          //
        ],
      ),
    );
  }

  /// select services
  Widget formInfoAddBtn() {
    return GestureDetector(
      onTap: () {
        onClickFormInfoCreateBtn();
      },
      child: Container(
        width: 80.h,
        height: 40.v,
        decoration: BoxDecoration(
          color: appTheme.redA200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            'Create',
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 18.fSize,
            ),
          ),
        ),
      ),
    );
  }

  /// select type box
  Widget formInfoInputTypeBox() {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: 'Select type of box *',
          contentPadding:
              EdgeInsets.only(left: 10.h, right: 10.h, bottom: 15.v, top: 15.v),
          hintStyle: TextStyle(
            fontSize: 17.fSize,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: TextStyle(
            fontSize: 17.fSize,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          hintText: 'Type of box',
        ),
        focusColor: Colors.amberAccent,
        value: selectedTypeBoxId,
        items: dataTypeBox.map((typeBoxItem) {
          return DropdownMenuItem(
            value: typeBoxItem['id'] as int,
            child: Text(
              typeBoxItem['name'] as String,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.fSize,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1, // Limit the number of lines to 1
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedTypeBoxId = value;
            selectedModelBoxId = null;
          });
        },
      ),
    );
  }

  /// select model box
  Widget formInfoInputModelBox() {
    return GestureDetector(
      onTap: () {
        if (typeBox == null) {
          _showDelayedToast(
            'Sorry. You should select type of box before select model of box.',
            'top',
          );
        }
      },
      child: Container(
        child: DropdownButtonFormField<int>(
          decoration: InputDecoration(
            labelText: 'Select model of box *',
            contentPadding: EdgeInsets.only(
                left: 10.h, right: 10.h, bottom: 15.v, top: 15.v),
            hintStyle: TextStyle(
              fontSize: 17.fSize,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // floatingLabelBehavior: FloatingLabelBehavior.never,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(
              fontSize: 17.fSize,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            hintText: 'Model of box',
          ),
          focusColor: Colors.amberAccent,
          value: selectedModelBoxId,
          items: dataModelBox
              .where((modelBoxItem) =>
                  modelBoxItem['idTypeBox'] == selectedTypeBoxId)
              .map((modelBoxItem) {
            return DropdownMenuItem(
                value: modelBoxItem['id'] as int,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      modelBoxItem['name'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.fSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' (' + modelBoxItem['description'] + ')',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.fSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ));
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedModelBoxId = value;
            });
          },
        ),
      ),
    );
  }

  /// dialog - select services
  Widget selectionServiceDialog() {
    return StatefulBuilder(
        builder: (BuildContext dialogContext, StateSetter _setState) {
      _listOrderBoxSetState = setState;

      return AlertDialog(
        title: Center(
          child: Text(
            'Select Items',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.fSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              for (var item in listServices)
                ListTile(
                  title: Text(
                    item['name'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.fSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    _listSelectedServicesInModal.contains(item['name'])
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: _listSelectedServicesInModal.contains(item['name'])
                        ? Colors.green
                        : null,
                  ),
                  onTap: () {
                    _setState(() {
                      if (_listSelectedServicesInModal.contains(item['name'])) {
                        _listSelectedServicesInModal.remove(item['name']);
                      } else {
                        _listSelectedServicesInModal.add(item['name']);
                      }
                    });
                  },
                ),
            ],
          ),
        ),
        actions: <Widget>[
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //
              GestureDetector(
                onTap: () {
                  onClickSelectServiceBtnCancel(dialogContext);
                },
                child: Container(
                  width: 100.v,
                  padding: EdgeInsets.fromLTRB(0.h, 10.v, 0.h, 10.v),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              //
              GestureDetector(
                child: Container(
                  width: 100.v,
                  padding: EdgeInsets.fromLTRB(0.h, 10.v, 0.h, 10.v),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  onClickSelectServiceBtnSave(dialogContext);
                },
              ),
              //
            ],
          ),
          //
          SizedBox(height: 10.v),
        ],
      );
    });
  }

  /// select services
  Widget formInfoInputService() {
    return Column(
      children: [
        //
        GestureDetector(
          onTap: _showSelectionDialog,
          child: Container(
              width: SizeUtils.width,
              height: 55.v,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(left: 10.h),
              child: Row(
                children: [
                  _listSelectedServicesInModalAfterSaving.length == 0
                      ? Text(
                          'Select services',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 17.fSize,
                          ),
                        )
                      : Container(
                          child: Wrap(
                            spacing: 8,
                            children: _listSelectedServicesInModalAfterSaving
                                .map((item) => Chip(
                                      labelPadding: EdgeInsets.only(
                                          left: 5.h, right: 5.h),
                                      backgroundColor: Colors.grey[200],
                                      label: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onDeleted: () {
                                        setState(() {
                                          _listSelectedServicesInModalAfterSaving
                                              .remove(item);
                                        });
                                      },
                                    ))
                                .toList(),
                          ),
                        ),
                ],
              )),
        ),
        //
        // if (_listSelectedServicesInModalAfterSaving.length != 0)
        //   Container(
        //     margin: EdgeInsets.only(top: 5.v),
        //     child: Wrap(
        //       spacing: 8,
        //       children: _listSelectedServicesInModalAfterSaving
        //           .map((item) => Chip(
        //                 labelPadding: EdgeInsets.only(left: 5.h, right: 5.h),
        //                 backgroundColor: Colors.grey[200],
        //                 label: Text(
        //                   item,
        //                   style: TextStyle(
        //                     color: Colors.black,
        //                     fontWeight: FontWeight.w500,
        //                   ),
        //                 ),
        //                 onDeleted: () {
        //                   setState(() {
        //                     _listSelectedServicesInModalAfterSaving
        //                         .remove(item);
        //                   });
        //                 },
        //               ))
        //           .toList(),
        //     ),
        //   ),
        //
      ],
    );
  }

  /// select choose items
  Widget formInfoInputOpenChooseItems() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return chooseItemsOpenDialog();
          },
        );
      },
      child: Container(
        width: SizeUtils.width,
        height: 55.v,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(left: 10.h),
        child: Stack(
          children: [
            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _listOrderBoxItemsInModalAfterSaving.length != 0
                    ? Text(
                        "Items: " +
                            _listOrderBoxItemsInModalAfterSaving
                                .map((orderBoxItem) {
                              String name = orderBoxItem['item'];
                              String amount = orderBoxItem['amount'].toString();
                              return '${amount}x${name[0].toUpperCase()}${name.substring(1)}';
                            }).join('; '),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.fSize,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        'Select items',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17.fSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
              ],
            ),
            //
            // Positioned(
            //   top: -10,
            //   left: 0,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(color: Colors.black38),
            //     ),
            //     child: Text(
            //       "Select items",
            //       style: TextStyle(
            //         color: Colors.black54,
            //         fontSize: 14.fSize,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //   ),
            // ),
            //
          ],
        ),
      ),
      //
    );
  }

  /// dialog - select items
  Widget chooseItemsOpenDialog() {
    return AlertDialog(
      title: Center(
        child: Text(
          'Select items',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.fSize,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext dialogContext, StateSetter setState) {
          _listOrderBoxSetState = setState;

          return Container(
            width: SizeUtils.width * 2 / 3,
            height: SizeUtils.height * 5 / 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //
                      Text(
                        'Information of item',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.fSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.v),
                      //
                      chooseItemsInfoView(_listOrderBoxSetState, dialogContext),
                      //
                      SizedBox(height: 15.v),
                      //
                      Text(
                        'Your items',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.fSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15.v),
                      //
                      chooseItemsListItemsView(_listOrderBoxSetState),
                      //
                    ],
                  ),
                ),
                //
                chooseItemsCloseSaveBtns(),
              ],
            ),
          );
        },
      ),
      //
    );
  }

  Widget chooseItemsCloseSaveBtns() {
    return Row(
      children: [
        //
        Expanded(
          child: GestureDetector(
            onTap: () {
              onClickChooseItemsBtnCancel();
            },
            child: Container(
              height: 50.v,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        //
        SizedBox(width: 10.h),
        //
        Expanded(
          child: GestureDetector(
            onTap: () {
              onClickChooseItemsBtnSave();
            },
            child: Container(
              height: 50.v,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black26,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget chooseItemsInfoView(
      StateSetter _setState, BuildContext dialogContext) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Flexible(
                  flex: 3,
                  child: chooseItemsInfoInput(_setState, dialogContext)),
              //
              SizedBox(width: 15.h),
              //
              Flexible(
                flex: 1,
                child: Container(
                  height: 50.v,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //
                      GestureDetector(
                        onTap: () {
                          // print('giảm');
                          _setState(() {
                            if (initialAmountInput > 1) {
                              initialAmountInput = initialAmountInput - 1;
                            }
                          });
                        },
                        child: Text(
                          '-',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.fSize,
                          ),
                        ),
                      ),
                      //
                      Text(
                        initialAmountInput.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.fSize,
                        ),
                      ),
                      //
                      GestureDetector(
                        onTap: () {
                          // print('tăng');
                          _setState(() {
                            // check the amount of other items to calculate the total and compare with maxAmountItemsCanHandle
                            int countAmount = 0;
                            _listOrderBoxItemsInModal.forEach((item) {
                              int amountOfCurrentItem = item['amount'];
                              countAmount += amountOfCurrentItem;
                            });

                            // không thể chứa thêm được
                            // p/s: countAmount >= maxAmountItemsCanHandle <=> maxAmountItemsCanHandle - countAmount <= 0
                            if (countAmount >= maxAmountItemsCanHandle) {
                              // diasble textfield

                              // show toast
                              _showDelayedToast(
                                'Sorry, total of all items is over the limit quantity of $maxAmountItemsCanHandle',
                                'top',
                              );
                            } else {
                              // số lượng có thể chứa thêm 1
                              if (maxAmountItemsCanHandle - countAmount == 1) {
                                // initialAmountInput = 1;
                                _showDelayedToast(
                                  'Okay fen, this box can handle more this item with quantity of only 1',
                                  'bottom',
                                );
                              }
                              // số lượng có thể chứa hơn 1
                              if (maxAmountItemsCanHandle - countAmount > 1) {
                                if (initialAmountInput <
                                    maxAmountItemsCanHandle - countAmount) {
                                  initialAmountInput = initialAmountInput + 1;
                                } else {
                                  _showDelayedToast(
                                    'Sorry, total of all items is over the limit quantity of $maxAmountItemsCanHandle',
                                    'top',
                                  );
                                }
                              }
                            }
                            //
                          });
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.fSize,
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
          //
          SizedBox(height: 10.v),
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //
              GestureDetector(
                onTap: () {
                  _setState(() {
                    _chooseItemsTextToFillController.clear();
                    initialAmountInput = 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.fSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              GestureDetector(
                onTap: () {
                  onClickChooseItemsAddBtn(_setState, dialogContext);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.h, vertical: 10.v),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Add',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.fSize,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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

  Widget chooseItemsInfoInput(
      StateSetter _setState, BuildContext dialogContext) {
    return Container(
      height: 50.v,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextField(
              controller: _chooseItemsTextToFillController,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.fSize,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    top: 15.v, bottom: 15.v, left: 10.h, right: 15.h),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: 'Enter your text',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26, width: 1.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusColor: Colors.black,
              ),
              cursorColor: Colors.black,
              //
              onSubmitted: (value) {
                onClickChooseItemsAddBtn(_setState, dialogContext);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget chooseItemsListItemsView(StateSetter _setState) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: 300.v,
      child: _listOrderBoxItemsInModal.length == 0
          ? Container(
              margin: EdgeInsets.only(bottom: 10.v),
              child: Center(
                child: Text(
                  'Cart is empty',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          : Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _listOrderBoxItemsInModal.length,
                  itemBuilder: (chooseItemsContext, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10.v),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //
                          Flexible(
                            flex: 3,
                            child: chooseItemsDisplayCurrentItem(
                                _listOrderBoxItemsInModal[index]['item']
                                    .toString()),
                          ),
                          //
                          SizedBox(width: 10.h),
                          //
                          Flexible(
                            flex: 1,
                            // child: incDecButtons(_listOrderBoxItemsInModal[index]['amount']),
                            child: Container(
                              height: 50.v,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.black26,
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //
                                  GestureDetector(
                                    onTap: () {
                                      // print('giảm');
                                      _setState(() {
                                        if (_listOrderBoxItemsInModal[index]
                                                ['amount'] >
                                            0) {
                                          _listOrderBoxItemsInModal[index]
                                                  ['amount'] =
                                              _listOrderBoxItemsInModal[index]
                                                      ['amount'] -
                                                  1;

                                          if (_listOrderBoxItemsInModal[index]
                                                  ['amount'] ==
                                              0) {
                                            _listOrderBoxItemsInModal
                                                .removeAt(index);
                                          }
                                        }
                                      });
                                    },
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.fSize,
                                      ),
                                    ),
                                  ),
                                  //
                                  Text(
                                    _listOrderBoxItemsInModal[index]['amount']
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.fSize,
                                    ),
                                  ),
                                  //
                                  GestureDetector(
                                    onTap: () {
                                      // print('tăng');
                                      _setState(() {
                                        // check the amount of other items to calculate the total and compare with maxAmountItemsCanHandle
                                        int countAmount = 0;
                                        _listOrderBoxItemsInModal
                                            .forEach((item) {
                                          int amountOfCurrentItem =
                                              item['amount'];
                                          countAmount += amountOfCurrentItem;
                                        });

                                        // không thể chứa thêm được
                                        // p/s: countAmount >= maxAmountItemsCanHandle <=> maxAmountItemsCanHandle - countAmount <= 0
                                        if (countAmount >=
                                            maxAmountItemsCanHandle) {
                                          // diasble textfield

                                          // show toast
                                          _showDelayedToast(
                                            'Sorry, total of all items is over the limit quantity of $maxAmountItemsCanHandle',
                                            'top',
                                          );
                                        } else {
                                          // số lượng có thể chứa hơn 1
                                          if (maxAmountItemsCanHandle -
                                                  countAmount >=
                                              1) {
                                            _listOrderBoxItemsInModal[index]
                                                    ['amount'] =
                                                _listOrderBoxItemsInModal[index]
                                                        ['amount'] +
                                                    1;
                                            initialAmountInput = 1;
                                          } else {
                                            _showDelayedToast(
                                              'Sorry, total of all items is over the limit quantity of $maxAmountItemsCanHandle',
                                              'top',
                                            );
                                          }
                                        }
                                      });
                                    },
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.fSize,
                                      ),
                                    ),
                                  ),
                                  //
                                ],
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
      //
    );
  }

  Widget chooseItemsDisplayCurrentItem(String item) {
    return Container(
      height: 50.v,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.black26,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 10.h),
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.fSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// second section
  Widget _buildListOrderBox() {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      width: SizeUtils.width,
      padding:
          EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.v, top: 20.v),
      child: Column(
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //
              Text(
                'List order box',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.fSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
              //
              GestureDetector(
                onTap: () {
                  if (listBoxOrder.length != 0) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return showModalDeleteAll();
                      },
                    );
                  } else {
                    _showDelayedToast(
                      "There's no any items here.",
                      'top',
                    );
                  }
                },
                child: Text(
                  'Delete all',
                  style: TextStyle(
                    color: appTheme.blue500,
                    fontSize: 16.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.v),
          //
          listBoxOrder.length != 0
              ? SingleChildScrollView(
                  child: Container(
                    // height: 250.v,
                    child: Column(
                      children: [
                        StatefulBuilder(
                          builder: (BuildContext dialogContext,
                              StateSetter setState) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: listBoxOrder.length,
                              itemBuilder: (context, index) {
                                return _orderBoxItem(
                                    index, listBoxOrder[index]);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  height: 200.v,
                  //
                  child: Center(
                    child: Text(
                      'Cart is empty',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.fSize,
                      ),
                    ),
                  ),
                ),
          //
        ],
      ),
    );
  }

  Widget showModalDeleteAll() {
    return AlertDialog(
      title: Center(
        child: Text(
          'Are you sure about that?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Row(
          children: [
            //
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 80.h,
                  height: 50.v,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.fSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //
            SizedBox(width: 10.h),
            //
            Expanded(
              child: GestureDetector(
                onTap: () {
                  deleteListBoxOrder();
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 80.h,
                  height: 50.v,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.fSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _orderBoxItem(int index, BoxOrderModel boxOrderItem) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      padding:
          EdgeInsets.only(left: 10.v, right: 10.v, top: 10.v, bottom: 10.v),
      margin: EdgeInsets.only(bottom: 10.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 9,
            child: Row(
              children: [
                //
                Flexible(flex: 1, child: verticalDecIncBtn(boxOrderItem)),
                //
                Flexible(flex: 10, child: orderBoxContentItem(boxOrderItem)),
              ],
            ),
          ),
          //
          VerticalDivider(),
          //
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  listBoxOrder.removeAt(index);
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 5.h),
                child: Icon(
                  Icons.delete,
                  color: appTheme.redA200,
                  size: 30.fSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderBoxContentItem(BoxOrderModel boxOrderItem) {
    return Container(
      margin: EdgeInsets.only(left: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Text(
            '${getStringValueById(boxOrderItem.boxTypeId, 'type')} | ${getStringValueById(boxOrderItem.boxModelId, 'model')} | ${boxOrderItem.boxServices}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.fSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          //
          SizedBox(height: 5.v),
          //
          Text(
            '${boxOrderItem.listItem}',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.fSize,
              fontWeight: FontWeight.normal,
            ),
          ),
          //
        ],
      ),
    );
  }

  Widget verticalDecIncBtn(BoxOrderModel boxOrderItem) {
    return Container(
      width: SizeUtils.width * 1 / 20,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(left: 5.h),
      child: Column(
        children: [
          // plus
          GestureDetector(
            onTap: () {
              setState(() {
                boxOrderItem.quantity = boxOrderItem.quantity + 1;
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 5.v, bottom: 5.v),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 20.fSize,
              ),
            ),
          ),
          // number of amount
          Text(
            '${boxOrderItem.quantity}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.fSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          // minus
          GestureDetector(
            onTap: () {
              setState(() {
                if (boxOrderItem.quantity > 1) {
                  boxOrderItem.quantity = boxOrderItem.quantity - 1;
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5.v),
              child: Icon(
                Icons.remove,
                color: Colors.black,
                size: 20.fSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //==============================================================================
  // FUNCTIONS

  // dialog appears in a few seconds
  void _showDelayedToast(String text, String position) {
    if (position.toLowerCase() == 'top') {
      Fluttertoast.showToast(
        msg: text,
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    } else if (position.toLowerCase() == 'bottom') {
      Fluttertoast.showToast(
        msg: text,
        // toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black26,
        textColor: Colors.white,
        fontSize: 14.fSize,
      );
    }
  }

  // select services
  void _showSelectionDialog() {
    // _listSelectedServicesInModal =
    //     List.from(_listSelectedServicesInModalAfterSaving);

    customDeepCloneBetweenTwoStringLists(
        _listSelectedServicesInModal, _listSelectedServicesInModalAfterSaving);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return selectionServiceDialog();
      },
    );
  }

  bool isAcceptPassingNextPage() {
    bool acceptForCreatingNewOrder = true;

    // setState(() {
    if (selectedTypeBoxId == null) {
      acceptForCreatingNewOrder = false;
      _showDelayedToast(
        'You missed the type of box',
        'top',
      );
    }

    if (selectedModelBoxId == null) {
      acceptForCreatingNewOrder = false;
      _showDelayedToast(
        'You missed the model of box',
        'top',
      );
    }

    if (_listSelectedServicesInModalAfterSaving.length == 0) {
      acceptForCreatingNewOrder = false;
      _showDelayedToast(
        'You missed the services',
        'top',
      );
    }

    if (_listOrderBoxItemsInModal.length == 0) {
      acceptForCreatingNewOrder = false;
      _showDelayedToast(
        'You missed the items',
        'top',
      );
    }
    // });

    return acceptForCreatingNewOrder;
  }

  // Form Info Create Btn
  void onClickFormInfoCreateBtn() {
    setState(() {
      if (isAcceptPassingNextPage()) {
        int boxId = Random().nextInt(100000000);

        customDeepCloneBetweenTwoMapLists(
            _listOrderBoxItems, _listOrderBoxItemsInModalAfterSaving);

        String listItems = _listOrderBoxItems.map((orderBoxItem) {
          String name = orderBoxItem['item'];
          String amount = orderBoxItem['amount'].toString();
          return '${amount}x${name[0].toUpperCase()}${name.substring(1)}';
        }).join(' | ');

        String services = _listSelectedServicesInModalAfterSaving
            .map((serviceItem) => serviceItem)
            .join(', ');

        // typeBox
        for (var type in dataTypeBox) {
          if (type['id'] == selectedTypeBoxId) {
            typeBox = type['name'];
          }
        }

        // modelBox
        for (var model in dataModelBox) {
          if (model['id'] == selectedModelBoxId) {
            modelBox = model['name'];
          }
        }

        boxOrder = BoxOrderModel(
          boxId: boxId,
          boxTypeId: selectedTypeBoxId,
          boxModelId: selectedModelBoxId,
          listItem: listItems,
          boxServices: services,
          weight: 0,
          quantity: 1,
          dimension: '${typeBox} | ${modelBox}',
          price: 0,
        );
        listBoxOrder.add(boxOrder);

        // empty data from form info
        _listSelectedServicesInModalAfterSaving.clear();

        typeBox = null;
        selectedTypeBoxId = null;
        modelBox = null;
        selectedModelBoxId = null;

        _listOrderBoxItems.clear();
        _listOrderBoxItemsInModalAfterSaving.clear();
        _listOrderBoxItemsInModal.clear();

        _showDelayedToast(
          'Successfully created!',
          'top',
        );
      }
    });
  }

  // select services
  void onClickSelectServiceBtnCancel(BuildContext dialogContext) {
    if (onChangedListString(_listSelectedServicesInModalAfterSaving,
        _listSelectedServicesInModal)) {
      customDeepCloneBetweenTwoStringLists(_listSelectedServicesInModal,
          _listSelectedServicesInModalAfterSaving);
    }

    Navigator.of(dialogContext).pop();
  }

  void onClickSelectServiceBtnSave(BuildContext dialogContext) {
    if (_listSelectedServicesInModalAfterSaving.length == 0) {
      if (_listSelectedServicesInModal.length != 0) {
        setState(() {
          customDeepCloneBetweenTwoStringLists(
              _listSelectedServicesInModalAfterSaving,
              _listSelectedServicesInModal);
        });

        // _showDelayedToast(
        //   'Successfully selected services',
        //   'bottom',
        // );
      } else {
        _showDelayedToast(
          "Are you sure? You haven't chose any services yet",
          'top',
        );
      }
    } else if (onChangedListString(_listSelectedServicesInModalAfterSaving,
        _listSelectedServicesInModal)) {
      setState(() {
        customDeepCloneBetweenTwoStringLists(
            _listSelectedServicesInModalAfterSaving,
            _listSelectedServicesInModal);
      });

      // _showDelayedToast(
      //   "Successfully modified services!",
      //   'bottom',
      // );

      if (_listSelectedServicesInModalAfterSaving.length == 0) {
        _showDelayedToast(
          "Are you sure? You haven't chose any services yet",
          'top',
        );
      }
    } else if (!onChangedListString(_listSelectedServicesInModalAfterSaving,
        _listSelectedServicesInModal)) {
      _showDelayedToast(
        "There's no changes!",
        'bottom',
      );
    }

    Navigator.of(dialogContext).pop();
  }

  void customDeepCloneBetweenTwoStringLists(
      List<String> listNeedToClone, List<String> listPrototype) {
    setState(() {
      listNeedToClone.clear();

      for (int index = 0; index < listPrototype.length; index++) {
        String string = listPrototype[index];
        listNeedToClone.add(string);
      }
    });
  }

  bool onChangedListString(
      List<String> _listAfterSaving, List<String> _listCanBeModified) {
    if (_listAfterSaving.length != _listCanBeModified.length) {
      return true;
    } else {
      int len = _listAfterSaving.length;
      for (int index = 0; index < len; index++) {
        String amountBeforeModifying = _listAfterSaving[index];
        String amountCurrent = _listCanBeModified[index];

        if (amountBeforeModifying != amountCurrent) {
          return true;
        }
      }
    }
    return false;
  }

  // choose items
  void onClickChooseItemsAddBtn(
      StateSetter _setState, BuildContext dialogContext) {
    String inputText = _chooseItemsTextToFillController.text;

    if (inputText != '') {
      // check the amount of other items to calculate the total and compare with maxAmountItemsCanHandle
      int countAmount = 0;
      _listOrderBoxItemsInModal.forEach((item) {
        int amountOfCurrentItem = item['amount'];
        countAmount += amountOfCurrentItem;
      });

      if (_listOrderBoxItemsInModal.length < 5 &&
          countAmount < maxAmountItemsCanHandle) {
        _setState(() {
          _listOrderBoxItemsInModal
              .add({"item": inputText, "amount": initialAmountInput});
          initialAmountInput = 1;
        });
      } else {
        if (_listOrderBoxItemsInModal.length >= 5) {
          _showDelayedToast(
            "Sorry, you've just added enough 5 items",
            'top',
          );
        } else if (!(countAmount < maxAmountItemsCanHandle)) {
          _showDelayedToast(
            "Sorry, total of all items is over the limit quantity of $maxAmountItemsCanHandle",
            'top',
          );
        }
      }
    } else {
      _showDelayedToast(
        "You should type the name of item before adding any items",
        'top',
      );
    }

    _chooseItemsTextToFillController.clear();
  }

  void onClickChooseItemsBtnCancel() {
    if (_listOrderBoxItemsInModal.length != 0 &&
        _listOrderBoxItemsInModalAfterSaving.length == 0) {
      _listOrderBoxItemsInModal.clear();
    }

    if (onChangedListMap(
        _listOrderBoxItemsInModalAfterSaving, _listOrderBoxItemsInModal)) {
      customDeepCloneBetweenTwoMapLists(
          _listOrderBoxItemsInModal, _listOrderBoxItemsInModalAfterSaving);
    }

    initialAmountInput = 1;
    _chooseItemsTextToFillController.clear();
    Navigator.of(context).pop();
  }

  void onClickChooseItemsBtnSave() {
    if (_listOrderBoxItemsInModalAfterSaving.length == 0) {
      if (_listOrderBoxItemsInModal.length != 0) {
        setState(() {
          customDeepCloneBetweenTwoMapLists(
              _listOrderBoxItemsInModalAfterSaving, _listOrderBoxItemsInModal);
        });

        _showDelayedToast(
          "Successfully saved!",
          'top',
        );
      } else {
        _showDelayedToast(
          "Are you sure? You haven't chose any items yet",
          'top',
        );
      }
    } else if (onChangedListMap(
        _listOrderBoxItemsInModalAfterSaving, _listOrderBoxItemsInModal)) {
      setState(() {
        customDeepCloneBetweenTwoMapLists(
            _listOrderBoxItemsInModalAfterSaving, _listOrderBoxItemsInModal);
      });

      _showDelayedToast(
        "Successfully modified!",
        'top',
      );
      if (_listOrderBoxItemsInModalAfterSaving.length == 0) {
        _showDelayedToast(
          "Are you sure? You haven't chose any items yet",
          'top',
        );
      }
    } else if (!onChangedListMap(
        _listOrderBoxItemsInModalAfterSaving, _listOrderBoxItemsInModal)) {
      _showDelayedToast(
        "There's no changes!",
        'top',
      );
    }

    initialAmountInput = 1;
    _chooseItemsTextToFillController.clear();
    Navigator.of(context).pop();
  }

  void customDeepCloneBetweenTwoMapLists(
      List<Map<String, dynamic>> listNeedToClone,
      List<Map<String, dynamic>> listPrototype) {
    setState(() {
      listNeedToClone.clear();

      for (int index = 0; index < listPrototype.length; index++) {
        listNeedToClone.add({
          'item': listPrototype[index]['item'],
          'amount': listPrototype[index]['amount'],
        });
      }
    });
  }

  bool onChangedListMap(List<Map<String, dynamic>> _listAfterSaving,
      List<Map<String, dynamic>> _listCanBeModified) {
    if (_listAfterSaving.length != _listCanBeModified.length) {
      return true;
    } else {
      int len = _listAfterSaving.length;
      for (int index = 0; index < len; index++) {
        int amountBeforeModifying = _listAfterSaving[index]['amount'];
        int amountCurrent = _listCanBeModified[index]['amount'];

        if (amountBeforeModifying != amountCurrent) {
          return true;
        }
      }
    }
    return false;
  }

  // list order box
  String getStringValueById(int id, String typeOrModel) {
    String valueResult = '';
    if (typeOrModel.toLowerCase() == 'type') {
      for (int index = 0; index < dataTypeBox.length; index++) {
        int idTypeBox = dataTypeBox[index]['id'];
        if (idTypeBox == id) {
          valueResult = dataTypeBox[index]['name'];
        }
      }
    } else if (typeOrModel.toLowerCase() == 'model') {
      for (int index = 0; index < dataModelBox.length; index++) {
        int idModelBox = dataModelBox[index]['id'];
        if (idModelBox == id) {
          valueResult = dataModelBox[index]['size'];
        }
      }
    }
    return valueResult;
  }

  void deleteListBoxOrder() {
    setState(() {
      listBoxOrder.clear();
    });

    // notify success
    _showDelayedToast(
      'Successfully deleted all items!',
      'bottom',
    );

    // notify can undo
    // need a trashListBoxOrder to save old data before deleting
  }

  // navigators
  /// Navigates to the typeRequestScreen when the action is triggered.
  onClickBackToHomepageBtn() {
    Get.toNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  /// Navigates to the onbAddressScreen when the action is triggered.
  onTapBtnArrowRight(context) {
    if (listBoxOrder.length != 0) {
      newOrderController.addBoxesToOrder(listBoxOrder);
      newOrderController.boxServices.clear();

      for (var box in listBoxOrder) {
        List<String> serviceInBox = box.boxServices.split(', ');
        List<int> listIdService = [];

        for (var serviceInBoxItem in serviceInBox) {
          for (var sv in listServices) {
            if (sv['name'] == serviceInBoxItem) {
              listIdService.add(sv['id']);
            }
          }
        }

        newOrderController.boxServices.add(listIdService);
      }

      print(newOrderController.boxServices);
      Get.toNamed(
        AppRoutes.onbAddressScreen,
      );
    } else {
      _showDelayedToast(
        'Please you should create a new order.',
        'bottom',
      );
    }
  }
}
