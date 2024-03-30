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
import 'controller/onb_oderbox_controller.dart';
import 'widgets/custom_stepper_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' as flutter;
import './models/new_box.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';

class OnbOderboxScreen extends GetWidget<OnbOderboxController> {
  OnbOderboxScreen({Key? key}) : super(key: key);

  late List<NewOrderBox> _currentList = [];
  late String typeBox = "";
  late String modelBox = "";
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
                          height: SizeUtils.height - 160.v,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  _buildFormSection(context),

                                  SizedBox(height: 10.v),
                                  // _buildListOder(),
                                  _orderBoxItem(),
                                ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 35.h, right: 35.h, bottom: 45.v),
                        child: CustomIconButton(
                          height: 60.adaptSize,
                          width: 60.adaptSize,
                          padding: EdgeInsets.all(15.h),
                          alignment: Alignment.bottomRight,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.onbAddressScreen,
                              arguments: {
                                'boxs': _currentList,
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
      // height: 360.v,
      width: SizeUtils.width,
      // margin: EdgeInsets.only(top: 90.h),
      padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //
          SizedBox(height: 30.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: CustomDropDown(
              // icon: Container(
              //   margin: EdgeInsets.fromLTRB(30.h, 19.v, 21.h, 19.v),
              //   child: CustomImageView(
              //     imagePath: ImageConstant.imgSave,
              //     height: 12.v,
              //     width: 19.h,
              //   ),
              // ),
              hintText: "lbl_type_box".tr,
              hintStyle: CustomTextStyles.bodyLargeBlack900,
              items:
                  controller.onbOderboxModelObj.value.dropdownItemList!.value,
              // contentPadding:
              //     EdgeInsets.only(left: 18.h, top: 15.v, bottom: 15.v),
              onChanged: (value) {
                controller.onSelected(value);
                typeBox = value.title;
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
              // contentPadding:
              //     EdgeInsets.only(left: 19.h, top: 15.v, bottom: 15.v),
              onChanged: (value) {
                controller.onSelected1(value);
                modelBox = value.title;
              },
            ),
          ),

          //
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            // child: MultiSelectDropDownScreen(service: service,),
            child: tempMulti(),
          ),
          SizedBox(height: 10.v),

          CustomElevatedButton(
            width: 90.h,
            text: "lbl_add".tr,
            buttonStyle: CustomButtonStyles.fillRedA,
            onPressed: () async {
              final _new = NewOrderBox(typeBox: typeBox, modelBox: modelBox, services: service.length > 0 ? service : "Nothing");
              print(_new.modelBox + " " + _new.typeBox + " " + _new.services );
              _currentList.add(_new);
            },
          ),
        ],
      ),
    );
  }

  Widget tempMulti () {
    final AppDataController controller = Get.put(AppDataController());
    late bool isPicked = false;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.getSubjectData();
    });

    return Container(
      height: isPicked ? 100.h : null,
      // height: 70.h,
      child: Column(
        children: [
          GetBuilder<AppDataController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: MultiSelectDialogField(
                dialogHeight: 200,
                items: controller.dropDownData,
                title: const Text(
                  "Select Subject",
                  style: TextStyle(color: Colors.black),
                ),
                selectedColor: Colors.black,
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
              ),
            );
          }),
        ],
      ),
    );

  }

  /// Section Widget
  Widget _buildListOder() {
    return Container(
      height: 350.v,
      // margin: EdgeInsets.only(top: 380.h),
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.v),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("lbl_list_order_box".tr,
                  style: CustomTextStyles.titleMediumBlack900)),
          SizedBox(height: 22.v),
          Padding(
              padding: EdgeInsets.only(right: 2.h),
              child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                CustomImageView(
                    imagePath: ImageConstant.imgThumbsUpBlueGray300,
                    height: 12.v,
                    width: 11.h,
                    margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
                Padding(
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text("lbl_carton_box".tr,
                        style: CustomTextStyles.titleMediumGreen80002)),
                Spacer(),
                CustomImageView(
                    imagePath: ImageConstant.imgEditBlack90015x15,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 2.v))
              ])),
          SizedBox(height: 9.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgContrast,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 1.v)),
                Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Text("lbl_50_x_50_x_50".tr,
                        style: CustomTextStyles.labelLargeOnPrimary))
              ])),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgThumbsUp,
                    height: 9.v,
                    width: 11.h,
                    margin: EdgeInsets.only(top: 4.v, bottom: 6.v)),
                Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Text("msg_hang_on_washing".tr,
                        style: theme.textTheme.bodyMedium)),
                Spacer(),

                //
                Container(
                  decoration: BoxDecoration(
                    color: appTheme.redA200,
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 38.h,
                    margin: EdgeInsets.only(left: 5.h, bottom: 2.v),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 1.v),
                    decoration: AppDecoration.outlineBluegray3002.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_1".tr, style: theme.textTheme.labelLarge)),

                //
                Container(
                  decoration: BoxDecoration(
                    color: appTheme.teal900,
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  margin: EdgeInsets.only(left: 5.v),
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),

                //
                // Padding(
                //   padding: EdgeInsets.only(left: 5.h, bottom: 3.v),
                //   child: CustomIconButton(
                //     height: 15.adaptSize,
                //     width: 15.adaptSize,
                //     child: CustomImageView(),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 20.v),
          Padding(
              padding: EdgeInsets.only(right: 2.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgThumbsUpBlueGray300,
                          height: 12.v,
                          width: 11.h,
                          margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text("lbl_carton_box2".tr,
                              style: CustomTextStyles.titleMediumGreen80002))
                    ]),
                    CustomImageView(
                        imagePath: ImageConstant.imgEditBlack90015x15,
                        height: 20.adaptSize,
                        width: 20.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 2.v))
                  ])),
          SizedBox(height: 9.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgContrast,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 1.v)),
                Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Text("lbl_50_x_100_x_50".tr,
                        style: CustomTextStyles.labelLargeOnPrimary))
              ])),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.imgThumbsUp,
                    height: 9.v,
                    width: 11.h,
                    margin: EdgeInsets.only(top: 4.v, bottom: 6.v)),
                Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Text("lbl_nothing".tr,
                        style: theme.textTheme.bodyMedium)),
                Spacer(),

                //
                Container(
                  decoration: BoxDecoration(
                    color: appTheme.redA200,
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  child: Center(
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: 38.h,
                    margin: EdgeInsets.only(left: 5.h, bottom: 2.v),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 1.v),
                    decoration: AppDecoration.outlineBluegray3002.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder5),
                    child: Text("lbl_1".tr, style: theme.textTheme.labelLarge)),

                Container(
                  decoration: BoxDecoration(
                    color: appTheme.teal900,
                    borderRadius: BorderRadius.circular(30.h),
                  ),
                  margin: EdgeInsets.only(left: 5.v),
                  height: 15.adaptSize,
                  width: 15.adaptSize,
                  child: Center(
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 20.v),
          // Padding(
          //   padding: EdgeInsets.only(right: 12.h),
          //   child: CustomIconButton(
          //     height: 60.adaptSize,
          //     width: 60.adaptSize,
          //     padding: EdgeInsets.all(15.h),
          //     alignment: Alignment.centerRight,
          //     onTap: () {
          //       onTapBtnArrowRight();
          //     },
          //     child: CustomImageView(imagePath: ImageConstant.imgArrowRight),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _orderBoxItem() {
    return Container(
      // height: SizeUtils.height - 360.v - 160.v - 25.v,
      //height: 460.v,
      width: SizeUtils.width,
      // margin: EdgeInsets.only(top: 380.h),
      padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 20.v),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      child: Padding(
        padding: EdgeInsets.zero,
        // child: SingleChildScrollView(
        child: Column(
          children: [
            Text('dfasdf'),
            
            _itemsOder(NewOrderBox( typeBox: 'SD', modelBox: '1', services: '1')),
            _itemsOder(NewOrderBox( typeBox: 'SD', modelBox: '1', services: '1')),
            _itemsOder(NewOrderBox( typeBox: 'SD', modelBox: '1', services: '1')),
            _itemsOder(NewOrderBox( typeBox: 'SD', modelBox: '1', services: '1')),
          ],
        ),
      ),
    );
  }

  Widget _itemsOder(NewOrderBox _new) {
    return Container(
      height: 130.v,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgThumbsUpBlueGray300,
                height: 12.v,
                width: 11.h,
                margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
              Spacer(),
              Text(_new.typeBox,
                style: CustomTextStyles.titleMediumGreen80002),
              Spacer(),
              Text('Carton Box',
                style: CustomTextStyles.titleMediumGreen80002),
            ],
          ),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgThumbsUpBlueGray300,
                height: 12.v,
                width: 11.h,
                margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
              Spacer(),
              Text(_new.modelBox,
                style: CustomTextStyles.titleMediumGreen80002),
              Spacer(),
              Text('Carton Box',
                style: CustomTextStyles.titleMediumGreen80002),
            ],
          ),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgThumbsUpBlueGray300,
                height: 12.v,
                width: 11.h,
                margin: EdgeInsets.only(top: 5.v, bottom: 2.v)),
              Spacer(),
              Text(_new.services,
                style: CustomTextStyles.titleMediumGreen80002),
              Spacer(),
              Text('Carton Box',
                style: CustomTextStyles.titleMediumGreen80002),
            ],
          ),              
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
