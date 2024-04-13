import '../../../core/app_export.dart';

/// This class is used in the [seventytwo_item_widget] screen.
class SeventytwoItemModel {
  SeventytwoItemModel({
    this.id,
    this.widget,
    this.status,
    this.commodity,
    this.service,
    this.model,
    this.price,
    this.startat
  }) {
    id = id ?? Rx("ID");
    widget = widget ?? Rx("33589549623491-001");
    status = status ?? Rx("Saving");
    commodity =
        commodity ?? Rx("10xQuan Jean; 10xAo so mi; 10xThat lung da");
    service = service ?? Rx("Hang On, Washing");
    model = model ?? Rx("Box | 50x50x100 | 20kg");
    price = price ?? Rx("10000đ / day ");
    startat = startat ?? Rx("Start at: 20/12/2023");
    id = id ?? Rx("");
  }

  Rx<String>? id;

  Rx<String>? widget;

  Rx<String>? status;

  Rx<String>? commodity;

  Rx<String>? service;

  Rx<String>? model;

  Rx<String>? price;

  Rx<String>? startat;
}
