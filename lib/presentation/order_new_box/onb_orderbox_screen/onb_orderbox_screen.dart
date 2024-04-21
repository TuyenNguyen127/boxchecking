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

import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';

// ignore: must_be_immutable
class OnbOrderboxScreen extends flutter.StatefulWidget {
  OnbOrderboxScreen({Key? key}) : super(key: key);

  @override
  flutter.State<OnbOrderboxScreen> createState() => _OnbOrderboxScreenState();
}

class _OnbOrderboxScreenState extends flutter.State<OnbOrderboxScreen> {
  int? selectedTypeBoxId;
  int? selectedModelBoxId;

  String service = "";
  dynamic typeBox = null;
  dynamic modelBox = null;

  final TextEditingController _itemDialogTextController =
      TextEditingController();
  List<Map<String, dynamic>> _addingListItems = [];

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
    },
    {
      "id": 2,
      "idTypeBox": 1,
      "name": "Medium",
      "description": "height: 50, width: 50, length: 50",
    },
    {
      "id": 3,
      "idTypeBox": 1,
      "name": "Small",
      "description": "height: 30, width: 30, length: 50",
    },
    {
      "id": 4,
      "idTypeBox": 2,
      "name": "Large",
      "description": "height: 50, width: 50, length: 100",
    },
    {
      "id": 5,
      "idTypeBox": 2,
      "name": "Medium",
      "description": "height: 50, width: 50, length: 50",
    },
    {
      "id": 6,
      "idTypeBox": 2,
      "name": "Small",
      "description": "height: 30, width: 30, length: 50",
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

  getSubjectData() {
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
      print("Show Error model why error occurred..");
    } else {
      print("show some error model like something went worng..");
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

  void _addItemToList(String inputText) {
    setState(() {
      _addingListItems.add({"item": inputText, "amount": 1});
    });
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
    return Consumer(
      builder: (context, ref, _) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBarPageOrderbox(),
            body: Consumer(
              builder: (context, newBoxOrder, _) {
                return Container(
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
                              _buildFormSection(context),
                              SizedBox(height: 10.v),
                            ],
                          ),
                        ),
                      ),
                      //
                      Container(
                        padding: EdgeInsets.only(
                            left: 35.h, right: 35.h, bottom: 25.v),
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
                );
              },
            ),
          ),
        );
      },
    );
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

  /// Section Widget
  Widget _buildFormSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(
              0.5,
              0.5,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
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
                  fontSize: 18.fSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          //
          SizedBox(height: 20.v),
          //
          _buildForm(context),
          //
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
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
        items: dataTypeBox.map((typeBox) {
          return DropdownMenuItem(
            value: typeBox['id'] as int,
            child: Text(
              typeBox['name'] as String,
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
            .where((modelBox) => modelBox['idTypeBox'] == selectedTypeBoxId)
            .map((modelBox) {
          return DropdownMenuItem(
              value: modelBox['id'] as int,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    modelBox['name'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.fSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' (' + modelBox['description'] + ')',
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
              style: TextStyle(color: Colors.grey),
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
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Container(
        width: SizeUtils.width * 2 / 3,
        height: SizeUtils.height * 4 / 7,
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
                    ),
                  ),
                  SizedBox(height: 15.v),
                  //
                  _buildInfoView(),
                  //
                  SizedBox(height: 15.v),
                  // Divider(),
                  // SizedBox(height: 15.v),
                  //
                  Text(
                    'Your items',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  //
                  _buildListItemsView(),
                  //
                ],
              ),
            ),
            //
            _buildCloseSaveBtns(),
          ],
        ),
      ),
      // actions: [],
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoView() {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          Flexible(flex: 3, child: _buildInfoInput()),
          //
          SizedBox(width: 15.h),
          //
          Flexible(flex: 1, child: incDecButtons("1")),
          //
        ],
      ),
    );
  }

  Widget _buildInfoInput() {
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
                _addItemToList(_itemDialogTextController.text);

                _itemDialogTextController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItemsView() {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: 250.v,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _addingListItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10.v),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //
                      Flexible(
                        flex: 3,
                        child: displayCurrentItem(
                            _addingListItems[index]['item'].toString()),
                      ),
                      //
                      SizedBox(width: 10.h),
                      //
                      Flexible(
                        flex: 1,
                        child: incDecButtons(
                            _addingListItems[index]['amount'].toString()),
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
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget incDecButtons(String amount) {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //
          GestureDetector(
            onTap: () {
              print('giảm');
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
            amount,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.fSize,
            ),
          ),
          //
          GestureDetector(
            onTap: () {
              print('tăng');
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
