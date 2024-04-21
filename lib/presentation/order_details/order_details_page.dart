import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'package:lastapp/model/addressModel.dart';
import 'package:lastapp/model/boxOrderModel.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/presentation/operate/operate_page/models/operate_model.dart';

import '../../widgets/app_bar/appbar_leading_image.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen(OrderModel orderDetails, {Key? key})
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Map<String, String> transport = {
    "shipping_company": "GiaoHangNhanh",
    "bill_no": "GHNVN30100913585",
  };
  List<OrderModel> listOrders = <OrderModel>[];

  void add() {
    // listOrders.addAll({
    //   OrderModel(
    //     id: 33589549623491,
    //     status: 'Saving',
    //     boxes: <BoxOrderModel>[
    //       BoxOrderModel(
    //         id: 33589549623491,
    //         typeBox: 1,
    //         modelBox: 1,
    //         services: 'Washing, Hang On',
    //         items: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
    //         selected: false,
    //         price: 30000,
    //         weight: 3.0,
    //       ),
    //     ],
    //     createdAt: "20/12/2023",
    //     finishedAt: "20/12/2023",
    //     checked: false,
    //     addressModel: AddressModel(
    //       name: "long do",
    //       phoneNumber: "0123456789",
    //       wardCodeId: 2,
    //       districtId: 2,
    //       cityId: 1,
    //       addressNumber: "345",
    //     ),
    //     description: "",
    //   ),
    //   OrderModel(
    //     id: 33589549623491,
    //     status: 'Saving',
    //     boxes: <BoxOrderModel>[
    //       BoxOrderModel(
    //         id: 33589549623491,
    //         typeBox: 1,
    //         modelBox: 1,
    //         services: 'Washing, Hang On',
    //         items: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
    //         selected: false,
    //         price: 30000,
    //         weight: 3.0,
    //       ),
    //     ],
    //     createdAt: "20/12/2023",
    //     finishedAt: "20/12/2023",
    //     checked: false,
    //     addressModel: AddressModel(
    //       name: "long do",
    //       phoneNumber: "0123456789",
    //       wardCodeId: 2,
    //       districtId: 2,
    //       cityId: 1,
    //       addressNumber: "345",
    //     ),
    //     description: "",
    //   ),
    // });
  }

  @override
  void initState() {
    add();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarOrderDetailsPage(),
      body: SizedBox(
        width: SizeUtils.width,
      ),
    );
  }

  /// appbar
  PreferredSizeWidget _buildAppBarOrderDetailsPage() {
    return AppBar(
      backgroundColor: appTheme.redA200,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leadingWidth: 40.h,
      // leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //   child: Container(
      //     margin: EdgeInsets.only(left: 26.h, top: 24.v, bottom: 21.v),
      //     child: ,
      //   ),
      // ),
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVectorPrimary,
        margin: EdgeInsets.only(left: 16.h, right: 16.v, bottom: 5.v, top: 5.v),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Request ID:' + '710043',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
