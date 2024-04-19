import 'package:flutter/material.dart';
import 'package:lastapp/core/app_export.dart';

import 'package:lastapp/model/boxOrderModel.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<BoxOrderItem> listOperates = <BoxOrderItem>[];
  List<BoxOrderItem> displayListOperates = <BoxOrderItem>[];

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
      BoxOrderItem(
        id: 33589549623491,
        status: 'Saving',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
        
        typeBox: 1,
        modelBox: 2,
        services: "Hang On, Washing",
        items: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        dimension: ,
        selected: ,
        price: ,
        weight: ,
      ),
      BoxOrderItem(
        id: 33589549623492,
        status: 'received',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      BoxOrderItem(
        id: 33589549623493,
        status: 'transporting',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      BoxOrderItem(
        id: 33589549623491,
        status: 'Saving',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      BoxOrderItem(
        id: 33589549623492,
        status: 'received',
        dimension: '10xQuan Jean; 10xAo so mi; 10xThat lung da',
        service: "Hang On, Washing",
        model: "Box | 50x50x100 | 20kg",
        pricePerDay: "10000",
        startAt: "Start at: 20/12/2023",
      ),
      BoxOrderItem(
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
}
