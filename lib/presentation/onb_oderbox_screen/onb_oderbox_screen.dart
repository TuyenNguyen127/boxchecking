import 'dart:convert';
import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:lastapp/main.dart';
import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'package:lastapp/widgets/custom_elevated_button.dart';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'controller/onb_oderbox_controller.dart';
import 'models/subject_model.dart';
import 'widgets/custom_stepper_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' as flutter;
import './models/new_box.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

class OnbOderboxScreen extends StatelessWidget {
  OnbOderboxScreen({Key? key}) : super(key: key);

  OnbOderboxController controller = Get.put(OnbOderboxController());

  late List<NewOrderBox> _currentList = [];
  final List<Map<String, dynamic>> data = [];
  late int typeBox = 1;
  late int modelBox = 1;
  late String service = ""; 
  
   
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return flutter.SafeArea(
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
                      Positioned(
                        top: 100.v,
                        child: Container(
                          // decoration: AppDecoration.fillGray,
                          height: SizeUtils.height - 160.v,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                _buildFormSection(context),

                                SizedBox(height: 10.v),
                                // _buildListOder(),
                                _buildListOrderBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 35.h, right: 35.h, bottom: 25.v),
                        child: CustomIconButton(
                          height: 60.adaptSize,
                          width: 60.adaptSize,
                          padding: EdgeInsets.all(15.h),
                          alignment: Alignment.bottomRight,
                          onTap: () { 
                            if (ModalRoute.of(context)!.settings.arguments != null) {
                              final arguments = ModalRoute.of(context)!.settings.arguments as Map;
                              final name = arguments['name'] ?? '';
                              final phoneNumber = arguments['phoneNumber'] ?? '';
                              final address = arguments['address'] ?? '';
                              final date = arguments['date'] ?? '';
                              final toWardCode = arguments['toWardCode'] ?? '';
                              final toDistrictId = arguments['toDistrictId'] ?? 1;
                              
                              Navigator.pushNamed(
                                context,
                                AppRoutes.onbAddressScreen,
                                arguments: {
                                  'name': name,
                                  'phoneNumber': phoneNumber,
                                  'address': address,
                                  'date': date,
                                  'toWardCode': toWardCode,
                                  'toDistrictId': toDistrictId,
                                  'boxs': data,
                                },
                              );
                            }
                            
                            Navigator.pushNamed(
                              context,
                              AppRoutes.onbAddressScreen,
                              arguments: {
                                'boxs': data,
                              },
                            );
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

          SizedBox(height: 10),

          //
          Center(
            child: Text(
              'Order box',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
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
            offset: const Offset(
              0.5,
              0.5,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
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
      padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          SizedBox(height: 20.v),
          //
          Container(
            // height: 10.v,
            width: SizeUtils.width,
            child: Center(
              child: Text(
                'Information about box',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          //
          SizedBox(height: 20.v),
          //
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: CustomDropDown(
              hintText: "lbl_type_box".tr,
              hintStyle: CustomTextStyles.bodyLargeBlack900,
              items:
                  controller.onbOderboxModelObj.value.dropdownItemList!.value,
              onChanged: (value) {
                controller.onSelected(value);
                typeBox = value.id!;
              },
            ),
          ),

          //
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: CustomDropDown(
              hintText: "lbl_model_box".tr,
              hintStyle: CustomTextStyles.bodyLargeBlack900,
              items:
                  controller.onbOderboxModelObj.value.dropdownItemList1!.value,
              onChanged: (value) {
                controller.onSelected1(value);
                modelBox = value.id!;
              },
            ),
          ),

          //
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: _buildMultiService(),
          ),
          SizedBox(height: 10.v),

          CustomElevatedButton(
            width: 90.h,
            text: "lbl_add".tr,
            buttonStyle: CustomButtonStyles.fillRedA,
            onPressed: () async {
              final _new = NewOrderBox(typeBox: typeBox, modelBox: modelBox, services: service.length > 0 ? service : "Nothing", amount: 1);
              
              data.add(_new.toJson());
              print(data);
              //_currentList.add(_new);
              controller.addNewOrderBox(typeBox, modelBox, service);
            }
          ),
        ],
      ),
    );
  }

  Widget _buildMultiService() {
    late bool isPicked = false;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSubjectData();
    });

    return Container(
      height: isPicked ? 80.h : null,
      child: Column(
        children: [
          GetBuilder<OnbOderboxController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: MultiSelectDialogField(
                dialogHeight: 150,
                items: controller.dropDownData,
                title: const Text(
                  "Select Subject",
                  style: TextStyle(color: Colors.black),
                ),
                selectedColor: appTheme.blue500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    color: appTheme.gray500,
                    width: 1,
                  ),
                ),
                buttonIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
                buttonText: const Text(
                  "Select Service",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                onConfirm: (results) {
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
                },
                chipDisplay: MultiSelectChipDisplay(
                  chipColor: Color.fromARGB(14, 227, 227, 227),
                  textStyle: TextStyle(
                    color: appTheme.blue500,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildListOrderBox() {
    return Container(
      color: theme.colorScheme.primary,
      width: SizeUtils.width,
      padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 10.h),
      child: Column(
        children: [
          //
          Container(
            width: SizeUtils.width,
            padding: EdgeInsets.only(top: 10.v),
            child: Center(
              child: Text(
                'List order box',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          //
          SizedBox(height: 10.v),
          //
          Obx(
            () => Container(
              height: SizeUtils.height -
                  160.v -
                  360.v +
                  (controller.khueListOrders.length < 2
                      ? 0
                      : (controller.khueListOrders.length - 2) * 140.v),
              child: Column(
                children: [
                  //
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.khueListOrders.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _itemsOder(
                            controller.khueListOrders[index], index);
                      },
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemsOder(NewOrderBox _new, index) {
    String? type_box = controller.onbOderboxModelObj.value.dropdownItemList.value.firstWhere((item) => 
    item.id == _new.typeBox, orElse: () => SelectionPopupModel(id: _new.typeBox, title: "None")).title;
    String? model_box= controller.onbOderboxModelObj.value.dropdownItemList1.value.firstWhere((item) => 
    item.id == _new.modelBox, orElse: () => SelectionPopupModel(id: _new.modelBox, title: "None")).title;

    return Container(
      height: 140.v,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //
          Container(
            height: 40.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpBlueGray300,
                    height: 12.v,
                    width: 11.h,
                    margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
                SizedBox(width: 10.v),
                // Spacer(),
                Text(type_box,
                    style: CustomTextStyles.titleMediumGreen80002),
                SizedBox(width: 10.v),
                // Spacer(),
                //
                IconButton(
                  onPressed: () {
                    controller.removeOrderBox(index);
                  },
                  icon: Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
          //
          Container(
            height: 40.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpBlueGray300,
                    height: 12.v,
                    width: 11.h,
                    margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
                SizedBox(width: 10.v),
                Text(model_box,
                    style: CustomTextStyles.titleMediumGreen80002),
                SizedBox(width: 10.v),
                Text('Carton Box',
                    style: CustomTextStyles.titleMediumGreen80002),
              ],
            ),
          ),
          //
          Container(
            height: 40.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpBlueGray300,
                    height: 12.v,
                    width: 11.h,
                    margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
                SizedBox(width: 10.v),
                Text(_new.services,
                    style: CustomTextStyles.titleMediumGreen80002),
                SizedBox(width: 10.v),
                Text('Carton Box',
                    style: CustomTextStyles.titleMediumGreen80002),
              ],
            ),
          ),
          //
          SizedBox(height: 20.v),
                        
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
  onTapBtnArrowRight() {
    // Get.toNamed(
    //   AppRoutes.onbAddressScreen,
    // );
    //Navigator.pushNamed(context, '/newScreen', _currentList);
  }
}
