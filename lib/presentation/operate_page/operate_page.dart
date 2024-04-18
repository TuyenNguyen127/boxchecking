import 'package:lastapp/widgets/app_bar/custom_app_bar.dart';
import 'package:lastapp/widgets/app_bar/appbar_title.dart';
import 'package:lastapp/widgets/custom_drop_down.dart';
import 'widgets/row1_item_widget.dart';
import 'models/row1_item_model.dart';
import 'widgets/seventytwo_item_widget.dart';
import 'models/seventytwo_item_model.dart';
import 'controller/operate_controller.dart';

import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';
import 'models/operate_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OperatePage extends StatefulWidget {
  OperatePage({Key? key})
      : super(
          key: key,
        );

  @override
  State<OperatePage> createState() => _OperatePageState();
}

class _OperatePageState extends State<OperatePage> {
  List<OperateItemModel> listOperates = <OperateItemModel>[];
  List<OperateItemModel> displayListOperates = <OperateItemModel>[];

  Map isTouch = {
    'all': true,
    'saving': false,
    'received': false,
    'transporting': false,
  };

  @override
  void initState() {
    add();
    for (var element in listOperates) {
      displayListOperates.add(element);
    }

    super.initState();
  }

  void filter(String status) {
    setState(() {
      displayListOperates.clear();
      for (var element in listOperates) {
        if (element.status.toLowerCase() == status.toLowerCase()) {
          displayListOperates.add(element);
        }
      }
      if (status.toLowerCase() == 'all')
        for (var element in listOperates) {
          displayListOperates.add(element);
        }
      isTouch.updateAll((key, value) => value = false);
      isTouch.update((status), (value) => value = true);
    });
  }

  void add() {
    listOperates.addAll({
      OperateItemModel(
        id: 33589549623491,
        status: 'Saving',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      OperateItemModel(
        id: 33589549623492,
        status: 'received',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      OperateItemModel(
        id: 33589549623493,
        status: 'transporting',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      OperateItemModel(
        id: 33589549623491,
        status: 'Saving',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      OperateItemModel(
        id: 33589549623492,
        status: 'received',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      OperateItemModel(
        id: 33589549623493,
        status: 'transporting',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    // done (old version - not fixed, not sticky)
    // return SafeArea(
    //   child: Scaffold(
    //     // backgroundColor: theme.colorScheme.primary,
    //     backgroundColor: Colors.transparent,
    //     appBar: _buildAppBarOperatePage(),
    //     body: SizedBox(
    //       width: SizeUtils.width,
    //       //
    //       child: Column(
    //         children: [
    //           //
    //           _orderTitleView(),
    //           //
    //           // Expanded(
    //           //   child: SingleChildScrollView(
    //           //     child:
    //           // _buildTop(),
    //           _buildSectionInfoAboutOrders(),
    //           SizedBox(height: 5.v),
    //           //   ),
    //           // ),
    //           //
    //           _buildStatusTab(),
    //           //
    //           Expanded(
    //             child: SingleChildScrollView(
    //               child: _buildListInfo(),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    // new version with sticky tabs and hiding orders' info section
    return Scaffold(
      appBar: _buildAppBarOperatePage(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //
                  _orderTitleView(),
                  //
                  _buildSectionInfoAboutOrders(),
                ],
              ),
            ),
          ];
        },
        body: SizedBox(
          width: SizeUtils.width,
          //
          child: Column(
            children: [
              //
              _buildStatusTab(),
              //
              Expanded(
                child: SingleChildScrollView(
                  child: _buildListInfo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// appbar
  PreferredSizeWidget _buildAppBarOperatePage() {
    return AppBar(
      elevation: 0,
      backgroundColor: appTheme.redA200,
      automaticallyImplyLeading: false,
      title: Center(
        child: Text(
          'Operate',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _orderTitleView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50.v,
          color: theme.colorScheme.primary,
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 10.v,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.v),
                child: Text(
                  "lbl_orders".tr,
                  style: CustomTextStyles.titleLargeBlack900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget iconInsideFrame({
    required String colorBackgr,
    required String icon,
    required double sizeBackgr,
    required double sizeIconBackgr,
  }) {
    return SizedBox(
      height: 50.v,
      width: 50.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: colorBackgr,
            height: sizeBackgr,
            width: sizeBackgr,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: icon,
            height: sizeIconBackgr,
            width: sizeIconBackgr,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget gridItem(
    crossAxisCellCount,
    mainAxisCellCount,
    colorBackgr,
    colorIconBackgr,
    sizeBackgr,
    icon,
    sizeIconBackgr,
    text,
    textColor,
    data,
    dataColor,
  ) {
    return StaggeredGridTile.count(
      crossAxisCellCount: crossAxisCellCount,
      mainAxisCellCount: mainAxisCellCount,
      child: Container(
        padding: EdgeInsets.only(left: 10.h, right: 10.h),
        decoration: BoxDecoration(
          color: colorBackgr,
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //
            Container(
              child: iconInsideFrame(
                colorBackgr: colorIconBackgr,
                icon: icon,
                sizeBackgr: sizeBackgr,
                sizeIconBackgr: sizeIconBackgr,
              ),
            ),
            //
            SizedBox(width: 5.h),
            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                Text(
                  text.toString()[0].toUpperCase() +
                      text.toString().substring(1) +
                      ":",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                //
                SizedBox(height: 5.h),
                //
                Text(
                  data.toString(),
                  style: TextStyle(
                    color: dataColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionInfoAboutOrders() {
    return Container(
      color: theme.colorScheme.primary,
      padding: EdgeInsets.only(left: 20.v, right: 20.v, bottom: 20.v),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 20.v,
        crossAxisSpacing: 20.v,
        children: [
          gridItem(
            2,
            1.5,
            appTheme.lavender,
            ImageConstant.imgPlay,
            50.h,
            ImageConstant.imgTelevision,
            20.h,
            'Total orders',
            appTheme.gray80001,
            100,
            appTheme.black900,
          ),
          gridItem(
            2,
            0.75,
            appTheme.blue10002,
            ImageConstant.imgCloseLightBlueA70001,
            50.h,
            ImageConstant.imgReply,
            16.h,
            'Saving',
            appTheme.gray80001,
            60,
            appTheme.black900,
          ),
          gridItem(
            2,
            0.75,
            appTheme.green100B2,
            ImageConstant.imgPlayGreenA700,
            50.h,
            ImageConstant.imgCheckmark,
            20.h,
            'Received',
            appTheme.gray80001,
            30,
            appTheme.black900,
          ),
          gridItem(
            2,
            0.75,
            appTheme.deepOrange50,
            ImageConstant.imgPlayOrangeA70001,
            50.h,
            ImageConstant.imgAirplane,
            18.h,
            'Transporting',
            appTheme.gray80001,
            3,
            appTheme.black900,
          ),
          gridItem(
            2,
            0.75,
            appTheme.deepOrange100B2,
            ImageConstant.imgEllipse15,
            50.h,
            ImageConstant.imgThumbsUpPrimary,
            20.h,
            'Rejected',
            appTheme.gray80001,
            7,
            appTheme.black900,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStatusTab() {
    return Container(
      padding: EdgeInsets.only(top: 10.v, bottom: 10.v),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border(
          top: BorderSide(
            color: const Color.fromARGB(19, 0, 0, 0),
            width: 1.5,
          ),
          bottom: BorderSide(
            color: Colors.black12,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                filter('all');
              },
              child: Container(
                width: 57.h,
                margin: EdgeInsets.only(left: 5.h),
                padding: EdgeInsets.symmetric(vertical: 8.v),
                decoration: isTouch['all']
                    ? AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      )
                    : AppDecoration.outlineBluegray50.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                child: Center(
                  child: Text(
                    "lbl_all".tr,
                    style: isTouch['all']
                        ? CustomTextStyles.bodySmallPrimary
                        : theme.textTheme.bodySmall,
                  ),
                ),
              )),
          GestureDetector(
            onTap: () {
              filter('saving');
            },
            child: Container(
              width: 61.h,
              margin: EdgeInsets.only(left: 5.h),
              padding: EdgeInsets.symmetric(vertical: 8.v),
              decoration: isTouch['saving']
                  ? AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder15,
                    )
                  : AppDecoration.outlineBluegray50.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder15,
                    ),
              child: Center(
                child: Text(
                  "Saving",
                  style: isTouch['saving']
                      ? CustomTextStyles.bodySmallPrimary
                      : theme.textTheme.bodySmall,
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                filter('received');
              },
              child: Container(
                width: 67.h,
                margin: EdgeInsets.only(left: 5.h),
                padding: EdgeInsets.symmetric(vertical: 8.v),
                decoration: isTouch['received']
                    ? AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      )
                    : AppDecoration.outlineBluegray50.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                child: Center(
                  child: Text(
                    "Received",
                    style: isTouch['received']
                        ? CustomTextStyles.bodySmallPrimary
                        : theme.textTheme.bodySmall,
                  ),
                ),
              )),
          GestureDetector(
              onTap: () {
                filter('transporting');
              },
              child: Container(
                width: 69.h,
                margin: EdgeInsets.only(left: 5.h),
                padding: EdgeInsets.symmetric(vertical: 8.v),
                decoration: isTouch['transporting']
                    ? AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      )
                    : AppDecoration.outlineBluegray50.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                child: Center(
                  child: Text(
                    "Transporting",
                    style: isTouch['transporting']
                        ? CustomTextStyles.bodySmallPrimary
                        : theme.textTheme.bodySmall,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildListInfo() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(height: 0.v);
      },
      itemCount: displayListOperates.length,
      itemBuilder: (context, index) {
        return operateItemWidget(displayListOperates[index]);
      },
    );
  }

  Widget buttonOperateItem(
    int numberFlex,
    String titleBtn,
    Function? callback,
  ) {
    return Flexible(
      flex: numberFlex,
      child: GestureDetector(
        onTap: () => callback,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.v),
          decoration: AppDecoration.outlineGray,
          child: Center(
            child: Text(
              titleBtn[0].toUpperCase() + titleBtn.substring(1),
              style: CustomTextStyles.labelLargePrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }

  Widget operateItemWidget(OperateItemModel operateItemModelObj) {
    return Column(
      children: [
        //
        Container(
          decoration: AppDecoration.fillPrimary,
          child: Column(
            children: [
              //
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 15.h,
                              child: Center(
                                child: Text(
                                  "ID",
                                  style: CustomTextStyles.labelLargeBluegray300,
                                ),
                              ),
                            ),
                            //
                            Text(
                              operateItemModelObj.id.toString(),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            //
                            CustomImageView(
                              imagePath: ImageConstant.imgComputer,
                              height: 12.v,
                              width: 12.h,
                              margin: EdgeInsets.only(left: 8.h),
                            ),
                            //
                            Container(
                              width: 60.h,
                              height: 20.h,
                              margin: EdgeInsets.only(left: 10.h),
                              padding: EdgeInsets.symmetric(vertical: 5.v),
                              decoration: AppDecoration.fillBlue100.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10,
                              ),
                              child: Center(
                                child: Text(
                                  operateItemModelObj.status[0].toUpperCase() +
                                      operateItemModelObj.status.substring(1),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: appTheme.black900,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            //
                          ],
                        ),
                        //
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.h, vertical: 5.v),
                            decoration:
                                AppDecoration.outlineBluegray50WithBorderRadius,
                            child: Text(
                              "GET",
                              style: TextStyle(
                                color: appTheme.lightBlueA700,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Container(
                          width: 15.h,
                          child: Center(
                            child: CustomImageView(
                              imagePath: ImageConstant.imgGrid,
                              height: 12.h,
                              width: 12.v,
                            ),
                          ),
                        ),
                        //
                        Container(
                          width: SizeUtils.width * 9 / 10,
                          child: Text(
                            operateItemModelObj.dimension,
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeGray80002,
                          ),
                        ),
                        //
                      ],
                    ),
                    //
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Container(
                          width: 15.h,
                          child: Center(
                            child: CustomImageView(
                              imagePath: ImageConstant.imgThumbsUp,
                              height: 12.h,
                              width: 12.v,
                            ),
                          ),
                        ),
                        //
                        Container(
                          width: SizeUtils.width * 9 / 10,
                          child: Text(
                            operateItemModelObj.service,
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeLightblue800,
                          ),
                        ),
                        //
                      ],
                    ),
                    //
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Container(
                          width: 15.h,
                          child: Center(
                            child: CustomImageView(
                              imagePath: ImageConstant.imgThumbsUpBlueGray300,
                              height: 12.h,
                              width: 12.v,
                            ),
                          ),
                        ),
                        //
                        Container(
                          width: SizeUtils.width * 9 / 10,
                          child: Text(
                            operateItemModelObj.model,
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeOrangeA700,
                          ),
                        ),
                        //
                      ],
                    ),
                    //
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        Container(
                          width: 15.h,
                          child: Center(
                            child: CustomImageView(
                              imagePath: ImageConstant.imgTelevisionBlueGray300,
                              height: 12.h,
                              width: 12.v,
                            ),
                          ),
                        ),
                        //
                        Container(
                          width: SizeUtils.width * 9 / 10,
                          child: Text(
                            operateItemModelObj.pricePerDay + "đ / day",
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeTeal900,
                          ),
                        ),
                        //
                      ],
                    ),
                    //
                    SizedBox(height: 10.v),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        Container(
                          padding: EdgeInsets.only(left: 5.h),
                          width: SizeUtils.width / 2,
                          child: Text(
                            operateItemModelObj.startAt,
                            overflow: TextOverflow.clip,
                            style: CustomTextStyles.labelLargeGray0xFFA2AEBC,
                          ),
                        ),
                        //
                        Text(
                          'total: '.toUpperCase() + 200000.toString() + " đ",
                          style: CustomTextStyles.titleSmallGreen800_1,
                        ),
                      ],
                    ),
                    //
                    SizedBox(height: 10.v),
                  ],
                ),
              ),
              //
              Container(
                width: SizeUtils.width,
                child: Row(children: [
                  //
                  buttonOperateItem(
                    3,
                    'call shipper',
                    () => print('call shipper'),
                  ),
                  //
                  buttonOperateItem(
                    3,
                    'Edit order',
                    () {
                      print('Edit order');
                    },
                  ),
                  //
                  buttonOperateItem(
                    3,
                    'Revoke',
                    () {
                      print('Revoke');
                    },
                  ),
                  //
                  buttonOperateItem(
                    1,
                    '...',
                    () {
                      print('other');
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
        //
        Divider(),
      ],
    );
  }
}
