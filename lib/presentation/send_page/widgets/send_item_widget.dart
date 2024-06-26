// import '../models/send_item_model.dart';
// import '../controller/send_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:lastapp/core/app_export.dart';

// // ignore: must_be_immutable
// class SendItemWidget extends StatelessWidget {
//   SendItemWidget(
//     this.sendItemModelObj, {
//     Key? key,
//   }) : super(
//           key: key,
//         );

//   SendItemModel sendItemModelObj;

//   //var controller = Get.find<SendController>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: 300.adaptSize,
//       width: SizeUtils.width,
//       decoration: AppDecoration.fillPrimary,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 11.v),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(top: 6.v),
//                   child: Obx(
//                     () => Text(
//                       sendItemModelObj.id!.value,
//                       style: CustomTextStyles.labelLargeBluegray300,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                     left: 8.h,
//                     top: 3.v,
//                   ),
//                   child: Obx(
//                     () => Text(
//                       sendItemModelObj.widget!.value,
//                       style: theme.textTheme.labelLarge,
//                     ),
//                   ),
//                 ),
//                 CustomImageView(
//                   imagePath: ImageConstant.imgComputer,
//                   height: 13.v,
//                   width: 11.h,
//                   margin: EdgeInsets.only(
//                     left: 8.h,
//                     top: 3.v,
//                   ),
//                 ),
//                 Container(
//                   width: 60.h,
//                   margin: EdgeInsets.only(left: 11.h),
//                   decoration: AppDecoration.fillAmber1001.copyWith(
//                     borderRadius: BorderRadiusStyle.roundedBorder10,
//                   ),
//                   child: Obx(
//                     () => Center(
//                       child: Text(
//                         sendItemModelObj.status!.value,
//                         style: CustomTextStyles.labelMediumBlack900,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 15.v),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Row(
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgLinkedin,
//                   height: 14.v,
//                   width: 9.h,
//                   margin: EdgeInsets.only(bottom: 1.v),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 11.h),
//                   child: Obx(
//                     () => Text(
//                       sendItemModelObj.address!.value,
//                       style: CustomTextStyles.labelLargeTeal900,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 6.v),
//           Padding(
//             padding: EdgeInsets.only(
//               left: 14.h,
//               // right: 100.h,
//             ),
//             child: Row(
//         mainAxisSize: MainAxisSize.min,
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgGrid,
//                   height: 12.v,
//                   width: 11.h,
//                   margin: EdgeInsets.only(bottom: 4.v),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 9.h),
//                   child: Obx(
//                     () => Expanded(
//                       child: Container(
//                         width: SizeUtils.width - 100.v,
//                         child: Text(
//                           sendItemModelObj.commodity!.value + "dfgddfgddfgddfgddfgd",
//                           overflow: TextOverflow.clip,
//                           style: CustomTextStyles.labelLargeGray80002,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 6.v),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgThumbsUp,
//                   height: 9.v,
//                   width: 11.h,
//                   margin: EdgeInsets.only(
//                     top: 1.v,
//                     bottom: 4.v,
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 9.h),
//                   child: Obx(
//                     () => Text(
//                       sendItemModelObj.service!.value,
//                       style: CustomTextStyles.labelLargeLightblue800,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 6.v),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Row(
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgThumbsUpBlueGray300,
//                   height: 12.v,
//                   width: 11.h,
//                   margin: EdgeInsets.symmetric(vertical: 1.v),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 9.h),
//                   child: Obx(
//                     () => Text(
//                       sendItemModelObj.type!.value,
//                       style: CustomTextStyles.labelLargeOrangeA700,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 6.v),
//           Padding(
//             padding: EdgeInsets.only(left: 14.h),
//             child: Row(
//               children: [
//                 CustomImageView(
//                   imagePath: ImageConstant.imgEdit,
//                   height: 12.v,
//                   width: 11.h,
//                   margin: EdgeInsets.only(bottom: 3.v),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 8.h),
//                   child: Obx(
//                     () => Text(
//                       sendItemModelObj.note!.value,
//                       style: CustomTextStyles.labelLargeBluegray400,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 6.v),
//           Row(
//             children: [
//               Container(
//                 width: 143.h,
//                 padding: EdgeInsets.symmetric(vertical: 8.v),
//                 decoration: AppDecoration.outlineGray,
//                 child: Obx(
//                   () => Center(
//                     child: Text(
//                       sendItemModelObj.callshipper!.value,
//                       style: CustomTextStyles.labelLargePrimaryContainer,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 104.h,
//                 padding: EdgeInsets.symmetric(vertical: 9.v),
//                 decoration: AppDecoration.outlineGray,
//                 child: Obx(
//                   () => Center(
//                     child: Text(
//                       sendItemModelObj.editorder!.value,
//                       style: CustomTextStyles.labelLargePrimaryContainer,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 94.h,
//                 padding: EdgeInsets.symmetric(vertical: 9.v),
//                 decoration: AppDecoration.outlineGray,
//                 child: Obx(
//                   () => Center(
//                     child: Text(
//                       sendItemModelObj.revoke!.value,
//                       style: CustomTextStyles.labelLargePrimaryContainer,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 44.h,
//                 padding: EdgeInsets.symmetric(vertical: 9.v),
//                 decoration: AppDecoration.outlineGray,
//                 child: Obx(
//                   () => Center(
//                     child: Text(
//                       sendItemModelObj.fiftySeven!.value,
//                       style: theme.textTheme.labelLarge,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
