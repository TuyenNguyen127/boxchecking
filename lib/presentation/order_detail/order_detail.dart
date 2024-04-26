import 'package:flutter/material.dart';
import 'package:lastapp/core/utils/image_constant.dart';
import 'package:lastapp/core/utils/size_utils.dart';
import 'package:lastapp/model/orderModel.dart';
import 'package:lastapp/widgets/custom_image_view.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderModel order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    int priceTotal = 0;
    for (var box in order.boxes) {
      priceTotal += box.price;
    }
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Order ID: ${order.orderId}',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.green.shade100),
              width: SizeUtils.width,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${order.status}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' | Date: ${order.date}',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Date: ${order.date}',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              //decoration: BoxDecoration(color: Colors.green.shade100),
              width: SizeUtils.width,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Informations',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: SizeUtils.width - 50,
                        //decoration: BoxDecoration(color: Colors.green.shade100),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  Text(
                                    '${order.name}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Phone number',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  Text(
                                    '${order.phoneNumber}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  Text(
                                    '${order.address}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Items:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Column(
                    children: order.boxes.map((box) {
                      return Column(children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          width: SizeUtils.width,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10)),
                            border: Border.all(
                                width: 1, color: Colors.grey), // Đường viền
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ID',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('  ${box.boxId}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgBookmark,
                                    color: Colors.black54,
                                    height: 12.v,
                                    width: 11.h,
                                  ),
                                  Text('  ${box.listItem}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGrid,
                                    color: Colors.black54,
                                    height: 12.v,
                                    width: 11.h,
                                  ),
                                  Text(
                                      '  ${box.dimension} | ${box.weight} | ${box.boxServices}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money_outlined,
                                    size: 16.fSize,
                                  ),
                                  Text('  ${box.price} VND'),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                      ]);
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Container(
              width: SizeUtils.width,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price:',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text('${priceTotal} VND',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
