import 'package:flutter/material.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'package:lastapp/widgets/custom_elevated_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'models/new_box.dart';
import 'controller/onb_orderbox_controller.dart';
import 'models/subject_model.dart';

import 'dart:convert'; // for JSON decoding
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';

// ignore: must_be_immutable
class OnbOrderboxScreen extends StatefulWidget {
  OnbOrderboxScreen({Key? key}) : super(key: key);

  @override
  State<OnbOrderboxScreen> createState() => _OnbOrderboxScreenState();
}

class _OnbOrderboxScreenState extends State<OnbOrderboxScreen> {
  late StateSetter _listOrderBoxSetState;

  int intialAmountInput = 1;

  int? selectedTypeBoxId;
  int? selectedModelBoxId;

  String service = "";
  dynamic typeBox = null;
  dynamic modelBox = null;
  int maxItemsCanHandle = 0;

  // BoxOrderModel orderBox = BoxOrderModel();

  final TextEditingController _itemDialogTextController =
      TextEditingController();
  List<Map<String, dynamic>> _listOrderBoxItems = [];

  final List<Map<String, dynamic>> data = [];
  Map<String, dynamic> boxOrder_jsonData = {};

  List<dynamic> dataTypeBox = [
    {
      "id": 1,
      "name": "Plastic box",
    },
    {
      "id": 2,
      "name": "Carton box",
    },
  ];

  List<dynamic> dataModelBox = [
    {
      "id": 1,
      "idTypeBox": 1,
      "name": "Large",
      "description": "height: 50, width: 50, length: 100",
      "maxItems": 2,
    },
    {
      "id": 2,
      "idTypeBox": 1,
      "name": "Medium",
      "description": "height: 50, width: 50, length: 50",
      "maxItems": 2,
    },
    {
      "id": 3,
      "idTypeBox": 1,
      "name": "Small",
      "description": "height: 30, width: 30, length: 50",
      "maxItems": 2,
    },
    {
      "id": 4,
      "idTypeBox": 2,
      "name": "Large",
      "description": "height: 50, width: 50, length: 100",
      "maxItems": 2,
    },
    {
      "id": 5,
      "idTypeBox": 2,
      "name": "Medium",
      "description": "height: 50, width: 50, length: 50",
      "maxItems": 2,
    },
    {
      "id": 6,
      "idTypeBox": 2,
      "name": "Small",
      "description": "height: 30, width: 30, length: 50",
      "maxItems": 2,
    },
  ];

  List<SubjectModel> subjectData = [];
  List<SubjectModel> tempSubjectData = [];
  List<MultiSelectItem> dropDownData = [];
  List<dynamic> dropDownService = [
    {
      "subject_id": "1",
      "service_name": "Hang On",
    },
    {
      "subject_id": "2",
      "service_name": "Washing",
    },
    {
      "subject_id": "3",
      "service_name": "Chemistry",
    },
  ];

  void getSubjectData() {
    subjectData.clear();
    dropDownData.clear();

    Map<String, dynamic> apiResponse = {
      "code": 200,
      "message": "Course subject lists.",
      "data": [
        {"subject_id": "1", "service_name": "Hang On"},
        {"subject_id": "2", "service_name": "Washing"},
        {"subject_id": "3", "service_name": "Chemistry"},
      ]
    };

    if (apiResponse['code'] == 200) {
      List<SubjectModel> tempSubjectData = [];
      apiResponse['data'].forEach(
        (data) => {
          tempSubjectData.add(
            SubjectModel(
              subjectId: data['subject_id'],
              subjectName: data['service_name'],
            ),
          )
        },
      );
      subjectData.addAll(tempSubjectData);

      dropDownData = subjectData.map((subjectdata) {
        return MultiSelectItem(subjectdata, subjectdata.subjectName);
      }).toList();
    } else if (apiResponse['code'] == 400) {
      print("Show error model why error occurred");
    } else {
      print("Show some error model like something went wrong");
    }
  }

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

  void _showDelayedDialog(BuildContext context) {
    Fluttertoast.showToast(
      msg: "You should type the name of item before press 'Add' button",
      // toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_LEFT,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.black26,
      textColor: Colors.black87,
      fontSize: 14.fSize,
    );
  }

  void _addItemToList(
      StateSetter _setState, BuildContext dialogContext, String inputText) {
    if (inputText != '') {
      _setState(() {
        _listOrderBoxItems
            .add({"item": inputText, "amount": intialAmountInput});
        intialAmountInput = 1;
      });
    } else {
      // show a small dialog to notify that u should type the item that user wants to add
      // dialog appears in a few seconds
      _setState(() {
        _showDelayedDialog(dialogContext);
      });
    }
  }

  void saveItemsData() {
    print('save');
  }

  void onClickAddBtn() {
    print('add');
  }

  @override
  void initState() {
    super.initState();

    getSubjectData();

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
        appBar: _buildAppBarPageOrderbox(),
        body:
            // Consumer(
            //   builder: (context, newBoxOrder, _) {
            //     return
            Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: AppDecoration.fillGray,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildSectionTrackProgress(),
                ),
              ),
              //
              Positioned(
                top: 70.v,
                child: Container(
                  child: Column(
                    children: [
                      //
                      _buildFormSection(),
                      SizedBox(height: 10.v),
                      //
                      _buildListOrderBox(),
                      SizedBox(height: 10.v),
                    ],
                  ),
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
        //     );
        //   },
        // ),
      ),
    );
    //   },
    // );
  }

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
          onTapVector();
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
      height: 160.v,
      padding: EdgeInsets.only(left: 60.v, right: 60.v, top: 10.v),
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

          // SizedBox(height: 10),

          // //
          // Center(
          //   child: Text(
          //     'Order box',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //       color: theme.colorScheme.primary,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  /// first section
  Widget _buildFormSection() {
    return Container(
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black26,
        //     offset: Offset(
        //       0.5,
        //       0.5,
        //     ),
        //     blurRadius: 1.0,
        //     spreadRadius: 0.5,
        //   ), //BoxShadow
        //   BoxShadow(
        //     color: Colors.white,
        //     offset: Offset(0.0, 0.0),
        //     blurRadius: 0.0,
        //     spreadRadius: 0.0,
        //   ), //BoxShadow
        // ],
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      width: SizeUtils.width,
      padding:
          EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.v, top: 20.v),
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
          _buildForm(),
          //
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
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
          _buildTypeBoxInput(),
          SizedBox(height: 20.v),
          //
          _buildModelBoxInput(),
          SizedBox(height: 20.v),
          //
          _buildServiceInput(),
          SizedBox(height: 20.v),
          //
          _buildChooseItemsInput(),
          SizedBox(height: 20.v),
          //
          _buildAddBtn(),
          //
        ],
      ),
    );
  }

  Widget _buildAddBtn() {
    return GestureDetector(
      onTap: () {
        onClickAddBtn();
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
            'Add',
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

  Widget _buildTypeBoxInput() {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: 'Choose type of box *',
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
            typeBox = value;

            print(typeBox);
            print(typeBox['name']);
            print(typeBox.runtimeType);
          });
        },
      ),
    );
  }

  Widget _buildModelBoxInput() {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: 'Choose model of box *',
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
            modelBox = value;
            // maxItemsCanHandle = ;

            print(modelBox);
            print(modelBox['maxItems']);
            print(modelBox.runtimeType);
          });
        },
      ),
    );
  }

  Widget _buildServiceInput() {
    late bool isPicked = false;

    return Container(
      height: isPicked ? 80.h : null,
      child: Column(
        children: [
          MultiSelectDialogField(
            dialogHeight: 150.v,
            dialogWidth: 90.h,
            items: dropDownData,
            title: Text(
              "Select service",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.fSize,
              ),
            ),
            selectedColor: appTheme.blue500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: appTheme.gray500,
                width: 1,
              ),
            ),
            buttonIcon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
            buttonText: Text(
              "Select service",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            onConfirm: (results) {
              setState(() {
                if (results.length > 0) {
                  isPicked = true;
                }
                for (var i = 0; i < results.length; i++) {
                  SubjectModel data = results[i] as SubjectModel;
                  service += data.subjectName;
                  if (i < results.length - 1) {
                    service += ", ";
                  }
                }
              });
            },
            chipDisplay: MultiSelectChipDisplay(
              chipColor: Color.fromARGB(14, 227, 227, 227),
              textStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 14.fSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChooseItemsInput() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _buildDialog();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Choose items',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17.fSize,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialog() {
    return AlertDialog(
      title: Center(
        child: Text(
          'Choose items',
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
                        ),
                      ),
                      SizedBox(height: 15.v),
                      //
                      _buildInfoView(_listOrderBoxSetState, dialogContext),
                      //
                      SizedBox(height: 15.v),
                      //
                      Text(
                        'Your items',
                        style: TextStyle(
                          color: flutter.Color.fromARGB(255, 139, 137, 137),
                          fontSize: 18.fSize,
                        ),
                      ),
                      SizedBox(height: 15.v),
                      //
                      _buildListItemsView(_listOrderBoxSetState),
                      //
                    ],
                  ),
                ),
                //
                _buildCloseSaveBtns(),
              ],
            ),
          );
        },
      ),
      //
    );
  }

  Widget _buildCloseSaveBtns() {
    return Row(
      children: [
        //
        Expanded(
          child: GestureDetector(
            onTap: () {
              _itemDialogTextController.clear();

              setState(() {
                intialAmountInput = 1;
                _listOrderBoxItems = [];
              });

              Navigator.of(context).pop();
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
                  'Close',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.fSize,
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
              saveItemsData();
              _itemDialogTextController.clear();
              Navigator.of(context).pop();
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoView(StateSetter _setState, BuildContext dialogContext) {
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
                  flex: 3, child: _buildInfoInput(_setState, dialogContext)),
              //
              SizedBox(width: 15.h),
              //
              Flexible(
                flex: 1,
                // child: incDecButtons("1"),
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
                            if (intialAmountInput > 1) {
                              intialAmountInput = intialAmountInput - 1;
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
                        intialAmountInput.toString(),
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
                            intialAmountInput = intialAmountInput + 1;
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
                    _itemDialogTextController.clear();
                    intialAmountInput = 1;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.v),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.fSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              GestureDetector(
                onTap: () {
                  _addItemToList(
                      _setState, dialogContext, _itemDialogTextController.text);
                  _setState(() {
                    _itemDialogTextController.clear();
                  });
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.h, vertical: 10.v),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
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

  Widget _buildInfoInput(StateSetter _setState, BuildContext dialogContext) {
    return Container(
      height: 50.v,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextField(
              controller: _itemDialogTextController,
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
                _addItemToList(
                    _setState, dialogContext, _itemDialogTextController.text);
                _itemDialogTextController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItemsView(StateSetter _setState) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: 250.v,
      child: _listOrderBoxItems.length == 0
          ? Container(
              margin: EdgeInsets.only(bottom: 10.v),
              child: Center(
                child: Text(
                  'Cart is empty',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.fSize,
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listOrderBoxItems.length,
                    itemBuilder: (chooseItemsContext, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.v),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //
                            Flexible(
                              flex: 3,
                              child: displayCurrentItem(
                                  _listOrderBoxItems[index]['item'].toString()),
                            ),
                            //
                            SizedBox(width: 10.h),
                            //
                            Flexible(
                              flex: 1,
                              // child: incDecButtons(_listOrderBoxItems[index]['amount']),
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
                                          if (_listOrderBoxItems[index]
                                                  ['amount'] >
                                              0) {
                                            _listOrderBoxItems[index]
                                                    ['amount'] =
                                                _listOrderBoxItems[index]
                                                        ['amount'] -
                                                    1;

                                            if (_listOrderBoxItems[index]
                                                    ['amount'] ==
                                                0) {
                                              _listOrderBoxItems
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
                                      _listOrderBoxItems[index]['amount']
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
                                          _listOrderBoxItems[index]['amount'] =
                                              _listOrderBoxItems[index]
                                                      ['amount'] +
                                                  1;
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
            ),
      //
    );
  }

  Widget displayCurrentItem(String item) {
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

  // Widget incDecButtons(BuildContext chooseItemsContext, int amount) {
  //   return Container(
  //     height: 50.v,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(6),
  //       border: Border.all(
  //         color: Colors.black26,
  //         width: 1.5,
  //       ),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         //
  //         GestureDetector(
  //           onTap: () {
  //             print('giảm');
  //             setState(() {});
  //           },
  //           child: Text(
  //             '-',
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 20.fSize,
  //             ),
  //           ),
  //         ),
  //         //
  //         Text(
  //           amount.toString(),
  //           style: TextStyle(
  //             color: Colors.black,
  //             fontSize: 18.fSize,
  //           ),
  //         ),
  //         //
  //         GestureDetector(
  //           onTap: () {
  //             print('tăng');
  //           },
  //           child: Text(
  //             '+',
  //             style: TextStyle(
  //               color: Colors.black,
  //               fontSize: 20.fSize,
  //             ),
  //           ),
  //         ),
  //         //
  //       ],
  //     ),
  //   );
  // }

  /// first section
  Widget _buildListOrderBox() {
    // StateSetter _setState;

    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black38),
        color: theme.colorScheme.primary,
        // borderRadius: BorderRadius.only(
        //   topRight: Radius.circular(30),
        //   topLeft: Radius.circular(30),
        // ),
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
                  //
                  _listOrderBoxItems.clear();
                  //
                  // snackbar appears
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
          //
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  StatefulBuilder(
                    builder:
                        (BuildContext dialogContext, StateSetter setState) {
                      _listOrderBoxSetState = setState;

                      return ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: _listOrderBoxItems.length,
                        itemBuilder: (context, index) {
                          return _buildOrderBoxItem(_listOrderBoxItems[index]);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          //
        ],
      ),
    );
  }

  Widget _buildOrderBoxItem(item) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(6)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          Flexible(flex: 1, child: verticalDecIncBtn()),
          //
          Flexible(flex: 4, child: orderBoxContentItem()),
          //
          VerticalDivider(),
          //
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                print('delete');
              },
              child: Icon(
                Icons.delete,
                color: appTheme.redA200,
                size: 30.fSize,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderBoxContentItem() {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }

  Widget verticalDecIncBtn() {
    return Column(
      children: [],
    );
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Navigates to the onbAddressScreen when the action is triggered.
  onTapBtnArrowRight(context) {
    // Get.toNamed(
    // AppRoutes.onbAddressScreen,
    // );

    Navigator.pushNamed(context, AppRoutes.onbAddressScreen);

    // if (ModalRoute.of(context)!.settings.arguments != null) {
    //   final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    //   final name = arguments['name'] ?? '';
    //   final phoneNumber = arguments['phoneNumber'] ?? '';
    //   final address = arguments['address'] ?? '';
    //   final date = arguments['date'] ?? '';
    //   final toWardCode = arguments['toWardCode'] ?? '';
    //   final toDistrictId = arguments['toDistrictId'] ?? 1;

    //   // print(ModalRoute.of(context)!.settings.arguments as Map);

    //   Navigator.pushNamed(
    //     context,
    //     AppRoutes.onbAddressScreen,
    //     arguments: {
    //       'name': name,
    //       'phoneNumber': phoneNumber,
    //       'address': address,
    //       'date': date,
    //       'toWardCode': toWardCode,
    //       'toDistrictId': toDistrictId,
    //       'boxs': data,
    //     },
    //   );
    // } else {
    //   Navigator.pushNamed(
    //     context,
    //     AppRoutes.onbAddressScreen,
    //     arguments: {
    //       'boxs': data,
    //     },
    //   );
    // }
  }
}
