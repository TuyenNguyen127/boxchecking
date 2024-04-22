import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import '../received_page/models/received_item_model.dart';
import '../received_page/received_page.dart';
import 'controller/received_tab_container_controller.dart';
import 'models/received_tab_container_model.dart';

// ignore: must_be_immutable
class RecivedTabContainerPage extends StatelessWidget {
  RecivedTabContainerPage({Key? key})
      : super(
          key: key,
        );

  RecivedTabContainerController controller =
      Get.put(RecivedTabContainerController(RecivedTabContainerModel().obs));

  final List<String> tabs = [
    'Processing',
    'Awaiting shipping',
    'Delivered',
    'Cancelled'
  ];

  List<RecivedItemModel> displayListReciveds = <RecivedItemModel>[
    RecivedItemModel(
      id: 1,
      status: 'Pending',
      address: 'Cau Giay',
      dimension: '3 items: ',
      phoneNumber: '0123456789',
      note: 'Nothing',
      name: 'Long Do',
    ),
    RecivedItemModel(
      id: 1,
      status: 'Waiting',
      address: 'Cau Giay',
      dimension: '10xQuan Jean',
      phoneNumber: '0123456789',
      note: 'Nothing',
      name: 'Long Do',
    ),
    RecivedItemModel(
      id: 1,
      status: 'Delivering',
      address: 'Cau Giay',
      dimension: '10xQuan Jean',
      phoneNumber: '0123456789',
      note: 'Nothing',
      name: 'Long Do',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBarShipPage(),
        body: DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              titleSpacing: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  width: double.infinity, // Đặt chiều rộng tối đa cho TabBar
                  child: TabBar(
                    labelColor: appTheme.redA200,
                    labelStyle: TextStyle(
                      fontSize: 18.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelColor: appTheme.blueGray300,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 18.fSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                    indicatorColor: appTheme.redA200,
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: 10.v,
                    ),

                    isScrollable: true, // Cho phép cuộn nếu có quá nhiều tab
                    tabs: tabs.map((String tab) {
                      return Container(
                        //color: Colors.black38,
                        //width: 150, // Đặt độ rộng tối đa cho mỗi tab
                        child: Tab(
                          text: tab,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                _procressing(),
                _procressing(),
                _procressing(),
                _procressing(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // app bar
  PreferredSizeWidget _buildAppBarShipPage() {
    return AppBar(
      elevation: 0,
      backgroundColor: appTheme.redA200,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Ship',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _procressing() {
    return Column(
      children: [
        SizedBox(height: 10,),
        SizedBox(
          width: SizeUtils.width,
          height: SizeUtils.height - 200,
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(

                children: [
                  
                  _buildRecived(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecived() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(height: 5.v);
      },
      itemCount: displayListReciveds.length,
      itemBuilder: (context, index) {
        return recivedItemWidget(displayListReciveds[index]);
      },
    );
  }

  Widget recivedItemWidget(recivedItemModelObj) {
    return Container(
      width: SizeUtils.width,
      decoration: AppDecoration.fillPrimary,
      child: Container(
        width: SizeUtils.width - 15.h * 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Row(
                      children: [
                        Container(
                          width: 11.h,
                          child: Text(
                            "ID",
                            style: CustomTextStyles.labelLargeBluegray300,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                            (recivedItemModelObj.id).toString(),
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgComputer,
                          height: 13.v,
                          width: 11.h,
                          margin: EdgeInsets.only(left: 8.h),
                        ),
                        Container(
                          width: 60.h,
                          margin: EdgeInsets.only(left: 11.h),
                          padding: EdgeInsets.symmetric(vertical: 6.v),
                          decoration: AppDecoration.fillAmber1001.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Container(
                            width: SizeUtils.width - 30.h * 2,
                            child: Center(
                              child: Text(
                                recivedItemModelObj.status,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 12.v,
                                  color: appTheme.black900,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  SizedBox(height: 10.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgLinkedin,
                        height: 14.v,
                        width: 11.h,
                        margin: EdgeInsets.only(bottom: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Container(
                          width: SizeUtils.width - 30.h * 2,
                          child: Text(
                            recivedItemModelObj.address,
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeTeal900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 10.v),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgGrid,
                        height: 12.v,
                        width: 11.h,
                        margin: EdgeInsets.only(bottom: 4.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Expanded(
                          child: Container(
                            width: SizeUtils.width - 30.h * 2,
                            child: Text(
                              recivedItemModelObj.dimension,
                              overflow: TextOverflow.clip,
                              style: CustomTextStyles.labelLargeGray80002,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 10.v),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgLockBlueGray300,
                        height: 12.adaptSize,
                        width: 12.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Container(
                          width: SizeUtils.width - 30.h * 2,
                          child: Text(
                            recivedItemModelObj.name,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              color: appTheme.lightBlue800,
                              fontWeight: FontWeight.w600,
                              fontSize: 13.v,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 10.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgCall,
                        height: 12.v,
                        width: 11.h,
                        margin: EdgeInsets.symmetric(vertical: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Container(
                          width: SizeUtils.width - 30.h * 2,
                          child: Text(
                            (recivedItemModelObj.phoneNumber).toString(),
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeOrangeA700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                  SizedBox(height: 10.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgEdit,
                        height: 12.v,
                        width: 11.h,
                        margin: EdgeInsets.only(bottom: 3.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Container(
                          width: SizeUtils.width - 30.h * 2,
                          child: Text(
                            recivedItemModelObj.note,
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeBluegray400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.v),
                ],
              ),
            ),
            // SizedBox(height: 14.v),
            Row(
              children: [
                GestureDetector(
                  onTap: () => {print('da an')},
                  child: Container(
                    width: 143.h,
                    padding: EdgeInsets.symmetric(vertical: 9.v),
                    decoration: AppDecoration.outlineGray,
                    child: Center(
                      child: Text(
                        'Call shipper',
                        style: CustomTextStyles.labelLargePrimaryContainer,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 104.h,
                  padding: EdgeInsets.symmetric(vertical: 9.v),
                  decoration: AppDecoration.outlineGray,
                  child: Center(
                    child: Text(
                      'Edit order',
                      style: CustomTextStyles.labelLargePrimaryContainer,
                    ),
                  ),
                ),
                Container(
                  width: 94.h,
                  padding: EdgeInsets.symmetric(vertical: 9.v),
                  decoration: AppDecoration.outlineGray,
                  child: Center(
                    child: Text(
                      'Revoke',
                      style: CustomTextStyles.labelLargePrimaryContainer,
                    ),
                  ),
                ),
                Container(
                  width: 43.h,
                  padding: EdgeInsets.symmetric(vertical: 9.v),
                  decoration: AppDecoration.outlineGray,
                  child: Center(
                    child: Text(
                      '...',
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
