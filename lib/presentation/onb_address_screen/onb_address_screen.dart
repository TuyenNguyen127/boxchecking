import 'package:lastapp/widgets/app_bar/appbar_leading_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:lastapp/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

import 'models/option_item.dart';
import '../../widgets/custom_select_drop_list.dart';

// ignore_for_file: must_be_immutable
class OnbAddressScreen extends StatefulWidget {
  OnbAddressScreen({Key? key}) : super(key: key);

  @override
  State<OnbAddressScreen> createState() => _OnbAddressScreenState();
}

class _OnbAddressScreenState extends State<OnbAddressScreen> {
  TextEditingController controller = TextEditingController();

  // OnbAddressController onbAddressController = Get.put(OnbAddressController());

  Completer<GoogleMapController> googleMapController = Completer();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late bool isPickedDate = false;

  TextEditingController phoneNumberController = TextEditingController();
  bool isErrorPhoneNumber = false;

  TextEditingController fullNameController = TextEditingController();
  bool isErrorFullname = false;

  TextEditingController wardCodeController = TextEditingController();
  bool isErrorWardCode = false;

  TextEditingController districtController = TextEditingController();
  bool isErrorDistrict = false;

  TextEditingController cityController = TextEditingController();
  bool isErrorCity = false;

  TextEditingController addressController = TextEditingController();
  bool isErrorAddress = false;

  MyDropListModel cityListModel = MyDropListModel([]);
  MyDropListModel districtListModel = MyDropListModel([]);
  MyDropListModel wardListModel = MyDropListModel([]);

  MyOptionItem cityOptionItemSelected =
      MyOptionItem(name: "Select City/Province", id: 0);
  MyOptionItem wardOptionItemSelected =
      MyOptionItem(name: "Select Ward", id: 0);
  MyOptionItem districtOptionItemSelected =
      MyOptionItem(name: "Select District", id: 0);
  List<dynamic> data = [
    // {
    //   "name": '',
    //   "id": 0,
    //   "data": [
    //     {
    //       "name": '',
    //       "id": 0,
    //       "data": [
    //         {
    //           "name": '',
    //           "id": 0,
    //         }
    //       ]
    //     }
    //   ]
    // },
    {
      "name": "Ha Noi",
      "id": 1442,
      "data": [
        // {
        //   "name": '',
        //   "id": 0,
        //   "data": [
        //     {
        //       "name": '',
        //       "id": 0,
        //     }
        //   ]
        // },
        {
          "name": "Thanh Xuan 1",
          "id": 122,
          "data": [
            {
              "name": '',
              "id": 0,
            },
            {"name": "Quan Nhan 1", "id": 1},
            {"name": "Quan Nhan 2", "id": 2},
            {"name": "Quan Nhan 3", "id": 3},
          ]
        },
        {
          "name": "Thanh Xuan 2",
          "id": 123,
          "data": [
            {
              "name": '',
              "id": 0,
            },
            {"name": "Quan Nhan 6", "id": 4},
            {"name": "Quan Nhan 4", "id": 5},
            {"name": "Quan Nhan 5", "id": 6},
          ]
        }
      ]
    },
    {
      "name": "Vinh Phuc",
      "id": 1022,
      "data": [
        {
          "name": "Thanh Xuan 3",
          "id": 1122,
          "data": [
            {"name": "Quan Nhan 5", "id": 1},
            {"name": "Quan Nhan 6", "id": 2},
            {"name": "Quan Nhan 7", "id": 3},
          ]
        },
        {
          "name": "Thanh Xuan 4",
          "id": 1133,
          "data": [
            {"name": "Quan Nhan", "id": 1},
            {"name": "Quan Nhan 1", "id": 2},
            {"name": "Quan Nhan 2", "id": 3},
          ]
        }
      ]
    },
    {
      "name": "Hai Duong",
      "id": 1033,
      "data": [
        {
          "name": "Thanh Xuan 1",
          "id": 112,
          "data": [
            {"name": "Quan Nhan", "id": 1},
            {"name": "Quan Nhan 1", "id": 2},
            {"name": "Quan Nhan 2", "id": 3},
          ]
        },
        {
          "name": "Thanh Xuan 2",
          "id": 113,
          "data": [
            {"name": "Quan Nhan", "id": 1},
            {"name": "Quan Nhan 1", "id": 2},
            {"name": "Quan Nhan 2", "id": 3},
          ]
        }
      ]
    }
  ];

  @override
  void initState() {
    List<MyOptionItem> listItems = [];
    for (var element in data) {
      listItems.add(MyOptionItem(id: element['id'], name: element['name']));
    }
    cityListModel = MyDropListModel(listItems);
    super.initState();
  }

  void selectDistrict(int id) {
    setState(() {
      List<MyOptionItem> listItems = [];
      dynamic rs = findElementById(data, id);
      dynamic result = findElementById(rs['data'], id);
      for (var element in result['data']) {
        listItems.add(MyOptionItem(id: element['id'], name: element['name']));
      }
      wardListModel = MyDropListModel(listItems);
      wardOptionItemSelected = MyOptionItem(name: "Select Ward", id: 0);
    });
  }

  void selectCity(int id) {
    setState(() {
      List<MyOptionItem> listItems = [];
      dynamic result = findElementById(data, id);
      for (var element in result['data']) {
        listItems.add(MyOptionItem(id: element['id'], name: element['name']));
      }
      districtListModel = MyDropListModel(listItems);
      districtOptionItemSelected = MyOptionItem(name: "Select District", id: 0);
      wardOptionItemSelected = MyOptionItem(name: "Select Ward", id: 0);
      wardListModel = MyDropListModel([]);
    });
  }

  dynamic findElementById(List<dynamic> data, int id) {
    for (var element in data)
      if (element['id'] == id) {
        return element;
      }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //
        appBar: _buildAppBarPageAddress(),
        //
        body: Container(
          // decoration: AppDecoration.fillGray,
          decoration: AppDecoration.fillPrimary,
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

  String selectedCity = '';
  String selectedDistrict = '';
  String selectedWard = '';

  Widget _buildAddressCode() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: DropdownButton<String>(
            
            value: selectedCity,
            onChanged: (String? newValue) {
              setState(() {
                selectedCity = newValue!;
                selectedDistrict = ''; // Reset giá trị khi thay đổi city
                selectedWard = ''; // Reset giá trị khi thay đổi city
              });
            },
            items: data.map<DropdownMenuItem<String>>((dynamic item) {
              return DropdownMenuItem<String>(
                value: item["name"],
                child: Text(item["name"]),
              );
            }).toList(),
            hint: Text('Select a city'),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: DropdownButton<String>(
            value: selectedDistrict,
            onChanged: (String? newValue) {
              setState(() {
                selectedDistrict = newValue!;
                selectedWard = ''; // Reset giá trị khi thay đổi district
              });
            },
            items: (data.firstWhere(
                        (element) => element['name'] == selectedCity)['data']
                    as List<dynamic>)
                .map<DropdownMenuItem<String>>((dynamic item) {
              return DropdownMenuItem<String>(
                value: item["name"],
                child: Text(item["name"]),
              );
            }).toList(),
            hint: Text('Select a district'),
          ),
        ),
        SizedBox(height: 20),
        Container(
          child: DropdownButton<String>(
            value: selectedWard,
            onChanged: (String? newValue) {
              setState(() {
                selectedWard = newValue!;
              });
            },
            items: ((data.firstWhere((element) =>
                                element['name'] == selectedCity)['data']
                            as List<dynamic>)
                        .firstWhere((element) =>
                            element['name'] == selectedDistrict)['data']
                    as List<dynamic>)
                .map<DropdownMenuItem<String>>((dynamic item) {
              return DropdownMenuItem<String>(
                value: item["name"],
                child: Text(item["name"]),
              );
            }).toList(),
            hint: Text('Select a ward'),
          ),
        ),
      ],
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
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: theme.colorScheme.primary,
        ),
        // height: SizeUtils.height,
        width: SizeUtils.width,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            _buildFullName(),
            SizedBox(height: 20.v),
            //
            _buildPhoneNumber(),
            //
            SizedBox(height: 9.v),
            //
            _city(),
            SizedBox(height: 2.v),
            //
            _district(),
            SizedBox(height: 2.v),
            //
            _wardCode(),
            SizedBox(height: 15.v),
            //
            _buildAddressView(),
            SizedBox(height: 10.v),
            //
            _buildAddressCode()
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumber() {
    return TextFormField(
      showCursor: true,
      cursorColor: Colors.black,
      controller: phoneNumberController,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15.h),
        hintText: 'Enter your phone number *',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }

  /// Section Widget
  Widget _buildFullName() {
    return TextFormField(
      showCursor: true,
      cursorColor: Colors.black,
      controller: fullNameController,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15.h),
        hintText: 'Enter your full name *',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }

  /// Section Widget
  Widget _buildAddressView() {
    return TextFormField(
      showCursor: true,
      cursorColor: Colors.black,
      controller: addressController,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15.h),
        hintText: 'Enter your address *',
        hintStyle: TextStyle(
          fontSize: 14,
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }

  // link tut call api async
  // https://www.youtube.com/watch?v=PO24ydfdBv0

  /// Section Widget
  Widget _city() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          ///Simple DropDown
          MySelectDropList(
            paddingLeft: 0,
            paddingRight: 0,
            paddingTop: 0,
            paddingBottom: 0,
            containerPadding: EdgeInsets.only(left: 5.h),
            borderColor: Colors.grey,
            textSizeTitle: 14,
            itemSelected: cityOptionItemSelected,
            dropListModel: cityListModel,
            showIcon: false,
            showArrowIcon: true,
            showBorder: true,
            paddingDropItem:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            suffixIcon: Icons.arrow_drop_down,
            icon: const Icon(Icons.person, color: Colors.black),
            onOptionSelected: (optionItem) {
              cityOptionItemSelected = optionItem;
              selectCity(cityOptionItemSelected.id);
              setState(() {
                cityController.text = cityOptionItemSelected.name;
              });
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _wardCode() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          ///Simple DropDown
          MySelectDropList(
            paddingLeft: 0,
            paddingRight: 0,
            paddingTop: 0,
            paddingBottom: 0,
            containerPadding: EdgeInsets.only(left: 5.h),
            borderColor: Colors.grey,
            textSizeTitle: 14,
            itemSelected: wardOptionItemSelected,
            dropListModel: wardListModel,
            showIcon: false,
            showArrowIcon: true,
            showBorder: true,
            paddingDropItem:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            suffixIcon: Icons.arrow_drop_down,
            icon: const Icon(Icons.person, color: Colors.black),
            onOptionSelected: (optionItem) {
              wardOptionItemSelected = optionItem;
              setState(() {
                wardCodeController.text = wardOptionItemSelected.name;
              });
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _district() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: <Widget>[
          ///Simple DropDown
          MySelectDropList(
            paddingLeft: 0,
            paddingRight: 0,
            paddingTop: 0,
            paddingBottom: 0,
            containerPadding: EdgeInsets.only(left: 5.h),
            borderColor: Colors.grey,
            textSizeTitle: 14,
            itemSelected: districtOptionItemSelected,
            dropListModel: districtListModel,
            showIcon: false,
            showArrowIcon: true,
            showBorder: true,
            paddingDropItem:
                const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            suffixIcon: Icons.arrow_drop_down,
            icon: const Icon(Icons.person, color: Colors.black),
            onOptionSelected: (optionItem) {
              districtOptionItemSelected = optionItem;
              selectDistrict(districtOptionItemSelected.id);
              setState(() {
                districtController.text = districtOptionItemSelected.name;
              });
            },
          ),
        ],
      ),
    );
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

  /// Navigates to the typeRequestScreen when the action is triggered.
  onTapVector() {
    Get.toNamed(
      AppRoutes.typeRequestScreen,
    );
    // Navigator.pop(context);
  }

  onTapBtnArrowLeft(context) {
    //NavigationBar.pop();

    // saveDataForAddressPage();
    //
    // Navigator.pop(context);

    // Get.toNamed(
    //   AppRoutes.onbOderboxScreen,
    // );

    checkValidationData();
  }

  bool validateData() {
    final phoneNumber = phoneNumberController.text;
    final fullName = fullNameController.text;
    final wardCode = wardCodeController.text;
    final district = districtController.text;
    final city = cityController.text;
    final address = addressController.text;

    if (fullName.isEmpty) {
      print('loi fullName');
      print(fullName);

      setState(() {
        isErrorFullname = true;
      });
    }

    if (!(10 <= phoneNumber.toString().length &&
            phoneNumber.toString().length <= 11) ||
        phoneNumber.isEmpty) {
      print('loi phoneNumber');
      print(phoneNumber);

      setState(() {
        isErrorPhoneNumber = true;
      });
    }

    if (wardCode.isEmpty || wardCode == null) {
      print('trong ward');
      print(wardCode);

      setState(() {
        isErrorWardCode = true;
      });
    }

    if (district.isEmpty || district == null) {
      print('trong district');
      print(district);

      setState(() {
        isErrorDistrict = true;
      });
    }

    if (city.isEmpty || city == null) {
      print('trong city');
      print(city);

      setState(() {
        isErrorCity = true;
      });
    }

    if (address.isEmpty || address == null) {
      print('trong address');
      print(address);

      setState(() {
        isErrorAddress = true;
      });
    }

    if (isErrorFullname ||
        isErrorPhoneNumber ||
        isErrorWardCode ||
        isErrorDistrict ||
        isErrorCity ||
        isErrorAddress) {
      return false;
    } else {
      print(fullName);
      print(phoneNumber);
      print(city);
      print(district);
      print(wardCode);
      print(address);
    }

    return true;
  }

  void checkValidationData() {
    if (validateData()) {
      // cho sang trang tiep theo
      print('qua duoc trang moi dooii dit con di cha may');
    }
  }

  /// Navigates to the onbCheckingAndPaymentScreen when the action is triggered.
  onTapBtnArrowRight(context) {
    // Get.toNamed(
    //   AppRoutes.onbCheckingAndPaymentScreen,
    // );

    //
    // saveDataForAddressPage();
    //
    // Navigator.pop(context);
    //
    // Get.toNamed(
    //   AppRoutes.onbCheckingAndPaymentScreen,
    // );

    //
    Navigator.pushNamed(
      context,
      AppRoutes.onbCheckingAndPaymentScreen,
    );
  }

  // saveDataForAddressPage() {
  //   if (onbAddressController.fullNameStringList.length > 0 &&
  //       onbAddressController.phoneNumberStringList.length > 0 &&
  //       onbAddressController.addressStringList.length > 0 &&
  //       onbAddressController.dateTimeList.length > 0 &&
  //       onbAddressController.districtIdStringList.length > 0 &&
  //       onbAddressController.towardCodeStringList.length > 0) {
  //     Address newAddress = Address(
  //       name: onbAddressController.fullNameStringList.last,
  //       phoneNumber: onbAddressController.phoneNumberStringList.last,
  //       date: onbAddressController.dateTimeList.last.toString(),
  //       address: onbAddressController.addressStringList.last,
  //       towardCode: onbAddressController.towardCodeStringList.toString(),
  //       districtId: onbAddressController.districtIdStringList.last,
  //     );

  //     onbAddressController.addNewAddress(newAddress);
  //   }
  // }
}
