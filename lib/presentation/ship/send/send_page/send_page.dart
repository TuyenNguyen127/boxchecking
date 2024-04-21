import 'models/send_item_model.dart';
import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

class SendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Send();
  }
}

class Send extends State<SendPage> {
  List<SendItemModel> listSends = <SendItemModel>[];
  List<SendItemModel> displayListSends = <SendItemModel>[];

  Map isTouch = {
    'all': true,
    'pending': false,
    'waiting': false,
    'delivering': false,
  };

  @override
  void initState() {
    add();
    for (var element in listSends) {
      displayListSends.add(element);
    }

    super.initState();
  }

  void filter(String status) {
    setState(() {
      displayListSends.clear();
      for (var element in listSends) {
        if (element.status.toLowerCase() == status.toLowerCase()) {
          displayListSends.add(element);
        }
      }
      if (status.toLowerCase() == 'all')
        for (var element in listSends) {
          displayListSends.add(element);
        }
      isTouch.updateAll((key, value) => value = false);
      isTouch.update((status), (value) => value = true);
    });
  }

  void add() {
    listSends.addAll({
      SendItemModel(
        id: 1,
        status: 'Pending',
        address: 'Cau Giay',
        dimension: '3 items: ',
        phoneNumber: '0123456789',
        note: 'Nothing',
        name: 'Long Do',
      ),
      SendItemModel(
        id: 1,
        status: 'Waiting',
        address: 'Cau Giay',
        dimension: '10xQuan Jean',
        phoneNumber: '0123456789',
        note: 'Nothing',
        name: 'Long Do',
      ),
      SendItemModel(
        id: 1,
        status: 'Delivering',
        address: 'Cau Giay',
        dimension: '10xQuan Jean',
        phoneNumber: '0123456789',
        note: 'Nothing',
        name: 'Long Do',
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
            // width: SizeUtils.width,
            // child: Column(
            //   children: [
            //     _buildStatus(),
            //     SizedBox(height: 8.v),
            //     _buildTotal(),
            //     SizedBox(height: 8.v),
            //     Expanded(
            //       child: SingleChildScrollView(
            //         child: _buildSend(),
            //       ),
            //     ),
            //   ],
            // ),
            ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStatus() {
    return Container(
      padding: EdgeInsets.only(top: 10.v, bottom: 10.v),
      decoration: BoxDecoration(color: theme.colorScheme.primary),
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
              filter('pending');
            },
            child: Container(
              width: 61.h,
              margin: EdgeInsets.only(left: 5.h),
              padding: EdgeInsets.symmetric(vertical: 8.v),
              decoration: isTouch['pending']
                  ? AppDecoration.outlineBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder15,
                    )
                  : AppDecoration.outlineBluegray50.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder15,
                    ),
              child: Center(
                child: Text(
                  "lbl_pending".tr,
                  style: isTouch['pending']
                      ? CustomTextStyles.bodySmallPrimary
                      : theme.textTheme.bodySmall,
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                filter('waiting');
              },
              child: Container(
                width: 67.h,
                margin: EdgeInsets.only(left: 5.h),
                padding: EdgeInsets.symmetric(vertical: 8.v),
                decoration: isTouch['waiting']
                    ? AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      )
                    : AppDecoration.outlineBluegray50.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                child: Center(
                  child: Text(
                    "lbl_waiting".tr,
                    style: isTouch['waiting']
                        ? CustomTextStyles.bodySmallPrimary
                        : theme.textTheme.bodySmall,
                  ),
                ),
              )),
          GestureDetector(
              onTap: () {
                filter('delivering');
              },
              child: Container(
                width: 69.h,
                margin: EdgeInsets.only(left: 5.h),
                padding: EdgeInsets.symmetric(vertical: 8.v),
                decoration: isTouch['delivering']
                    ? AppDecoration.outlineBlueGray.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      )
                    : AppDecoration.outlineBluegray50.copyWith(
                        borderRadius: BorderRadiusStyle.circleBorder15,
                      ),
                child: Center(
                  child: Text(
                    "lbl_delivering".tr,
                    style: isTouch['delivering']
                        ? CustomTextStyles.bodySmallPrimary
                        : theme.textTheme.bodySmall,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTotal() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.h,
        right: 11.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_20_orders".tr,
            style: CustomTextStyles.labelLargeGray80002,
          ),
          Text(
            "lbl_choose_order".tr,
            style: CustomTextStyles.labelLargeLightblueA700,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSend() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return SizedBox(height: 5.v);
      },
      itemCount: displayListSends.length,
      itemBuilder: (context, index) {
        return sendItemWidget(displayListSends[index]);
      },
    );
  }

  Widget sendItemWidget(sendItemModelObj) {
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
                            (sendItemModelObj.id).toString(),
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
                                sendItemModelObj.status,
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgLockBlueGray300,
                        height: 12.h,
                        width: 12.v,
                        margin:
                            EdgeInsets.only(top: 1.v, bottom: 1.v, left: 2.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 11.h),
                        child: Container(
                          width: SizeUtils.width - 30.h * 2,
                          child: Text(
                            sendItemModelObj.name,
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
                            (sendItemModelObj.phoneNumber).toString(),
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
                            sendItemModelObj.address,
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
                            child: Column(
                              children: [
                                Text(
                                  sendItemModelObj.dimension,
                                  overflow: TextOverflow.clip,
                                  style: CustomTextStyles.labelLargeGray80002,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                ),
                              ],
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
                            sendItemModelObj.note,
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
