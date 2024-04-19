import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:lastapp/widgets/custom_text_form_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'controller/send_box_address_controller.dart';

// ignore_for_file: must_be_immutable
class SendBoxAddressScreen extends StatelessWidget {
  SendBoxAddressScreen({Key? key}) : super(key: key);

  SendBoxAddressController onbAddressController =
      Get.put(SendBoxAddressController());

  Completer<GoogleMapController> googleMapController = Completer();

  late bool isPickedDate = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //
        appBar: _buildAppBarPageAddress(),
        //
        body: Container(
          decoration: AppDecoration.fillGray,
          width: SizeUtils.width,
          height: SizeUtils.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _buildSectionTrackProgress(),
                ),
              ),
              //
              Positioned(
                top: 100.v,
                child: _buildFormPageAddress(context),
              ),
              //
              _buildArrowRightLeft(context),
            ],
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarPageAddress() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: appTheme.redA200,
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 22.h, top: 0.v, right: 22.h),
        onTap: () => onTapVector(),
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
              GestureDetector(
                onTap: () {
                  // onTapBtnArrowLeft();
                },
                child: Container(
                  width: 40.v,
                  height: 40.v,
                  decoration: BoxDecoration(
                    color: appTheme.redA200,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
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
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.black54),
                ),
                child: Center(
                  child: Text(
                    '2',
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
              'Address',
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

  Widget _buildFormPageAddress(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: theme.colorScheme.primary,
        ),
        height: SizeUtils.height,
        width: SizeUtils.width,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            _buildFullName(),
            SizedBox(height: 18.v),
            //
            _buildPhoneNumber(),
            SizedBox(height: 18.v),
            //
            _buildTime(),
            SizedBox(height: 18.v),
            //
            _buildAddress(),
            SizedBox(height: 21.v),
            //
            _buildCity1(),
            SizedBox(height: 18.v),
            //
            _wrapBuildDistrictView(),
            SizedBox(height: 20.v),
            //
            //_buildMaps(),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return CustomTextFormField(
      controller: onbAddressController.phoneNumberController,
      hintText: "lbl_phone_number".tr,
      textInputType: TextInputType.phone,
      // validator: (value) {
      //   if (!isValidPhone(value)) {
      //     return "err_msg_please_enter_valid_phone_number".tr;
      //   }
      //   return null;
      // },
      onChanged: (value) => setPhoneNumberToTempData(value),
    );
  }

  setPhoneNumberToTempData(value) {
    value = value.toString();

    if (value != '' || value != null) {
      onbAddressController.addPhoneNumber(value);
    }
  }

  /// Section Widget
  Widget _buildFullName() {
    return CustomTextFormField(
      controller: onbAddressController.fullNameController,
      hintText: "lbl_full_name".tr,
      // validator: (value) {
      //   if (!isText(value)) {
      //     return "err_msg_please_enter_valid_text".tr;
      //   }
      //   return null;
      // },
      onChanged: (value) => setFullnameToTempData(value),
    );
  }

  setFullnameToTempData(value) {
    value = value.toString();

    if (value != '' || value != null) {
      onbAddressController.addFullname(value);
    }
  }

  /// Section Widget
  Widget _buildAddress() {
    return CustomTextFormField(
      controller: onbAddressController.addressController,
      hintText: "lbl_address2".tr,
      suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 15.v, 24.h, 15.v),
          child: CustomImageView(
              imagePath: ImageConstant.imgLinkedinBlack900,
              height: 20.v,
              width: 14.h)),
      suffixConstraints: BoxConstraints(maxHeight: 50.v),
      contentPadding: EdgeInsets.only(left: 18.h, top: 15.v, bottom: 15.v),
      onChanged: (value) => setAddressToTempData(value),
    );
  }

  setAddressToTempData(value) {
    value = value.toString();

    if (value != '' || value != null) {
      onbAddressController.addAddress(value);
    }
  }

  /// Section Widget
  Widget _buildTowardCodeView() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 5.h, bottom: 1.v),
        child: CustomTextFormField(
          controller: onbAddressController.towardCodeController,
          hintText: 'Ward Code',
          onChanged: (value) => setTowardCodeToTempData(value),
        ),
      ),
    );
  }

  setTowardCodeToTempData(value) {
    value = value.toString();

    if (value != '' || value != null) {
      onbAddressController.addTowardCode(value);
    }
  }

  /// Section Widget
  Widget _buildCity1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTowardCodeView(),
      ],
    );
  }

  /// Section Widget
  Widget _buildDistrictView() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 5.h, bottom: 1.v),
        child: CustomTextFormField(
          controller: onbAddressController.districtIdController,
          hintText: 'District Id',
          onChanged: (value) => setDistrictIdToTempData(value),
        ),
      ),
    );
  }

  setDistrictIdToTempData(value) {
    value = value.toString();

    if (value != '' || value != null) {
      onbAddressController.addDistrictId(value);
    }
  }

  /// Section Widget
  Widget _wrapBuildDistrictView() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildDistrictView()]);
  }

  /// Section Widget
  Widget _buildMaps() {
    return SizedBox(
      height: 219.v,
      width: 350.h,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.43296265331129, -122.08832357078792),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowRightLeft(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.h, right: 35.h, bottom: 45.v),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowLeft(context);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgArrowRightOnerrorcontainer,
            ),
          ),
          CustomIconButton(
            height: 60.adaptSize,
            width: 60.adaptSize,
            padding: EdgeInsets.all(15.h),
            onTap: () {
              onTapBtnArrowRight(context);
            },
            child: CustomImageView(imagePath: ImageConstant.imgArrowRight),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTime() {
    return GestureDetector(
      onTap: () {
        onTapTime();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 15.v),
        decoration: AppDecoration.outlineGray500
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                // onbAddressController.onbAddressModelObj.value.date.value,
                onbAddressController.dateController.value.toString(),
                style: TextStyle(
                  color: isPickedDate ? Colors.black : appTheme.black900,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgCalendarBlack900,
              height: 15.v,
              width: 13.h,
              margin: EdgeInsets.only(top: 3.v, right: 6.h, bottom: 2.v),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onTapTime() async {
    DateTime? dateTime = await showDatePicker(
      context: Get.context!,
      initialDate:
          // onbAddressController.onbAddressModelObj.value.selectedDate!.value,
          onbAddressController.dateController.value,
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(
        DateTime.now().year + 1,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );

    if (dateTime != null) {
      isPickedDate = true;

      onbAddressController.dateController.value = dateTime;

      setDateToTempData(dateTime);
    }
  }

  setDateToTempData(value) {
    value = value.toString();

    if (value != '' || value != null) {
      onbAddressController.addDate(DateTime.parse(value));
    }
  }

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
  }

  /// Navigates to the sendBoxChooseBoxScreen when the action is triggered.
  onTapBtnArrowLeft(context) {
    Get.toNamed(
      AppRoutes.sendBoxChooseBoxScreen,
    );
  }

  /// Navigates to the sendBoxCheckingAndPaymentScreen when the action is triggered.
  onTapBtnArrowRight(context) {
    saveDataForAddressPage();
    Get.toNamed(
      AppRoutes.sendBoxCheckingAndPaymentScreen,
    );
  }

  saveDataForAddressPage() {
    // if (onbAddressController.fullNameStringList.length > 0 &&
    //     onbAddressController.phoneNumberStringList.length > 0 &&
    //     onbAddressController.addressStringList.length > 0 &&
    //     onbAddressController.dateTimeList.length > 0 &&
    //     onbAddressController.districtIdStringList.length > 0 &&
    //     onbAddressController.towardCodeStringList.length > 0) {
    //   Address newAddress = Address(
    //     name: onbAddressController.fullNameStringList.last,
    //     phoneNumber: onbAddressController.phoneNumberStringList.last,
    //     date: onbAddressController.dateTimeList.last.toString(),
    //     address: onbAddressController.addressStringList.last,
    //     towardCode: onbAddressController.towardCodeStringList.toString(),
    //     districtId: onbAddressController.districtIdStringList.last,
    //   );

    //   onbAddressController.addNewAddress(newAddress);
    // }
  }
}
