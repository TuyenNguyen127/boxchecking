import '../../../core/app_export.dart';

/// This class is used in the [seventytwo_item_widget] screen.
class SeventytwoItemModel {
  SeventytwoItemModel({
    this.id,
    this.widget,
    this.status,
    this.xQuanJeanxAo,
    this.hangOnWashing,
    this.price,
    this.day,
    this.startat,
    this.id,
  }) {
    id = id ?? Rx("ID");
    widget = widget ?? Rx("33589549623491-001");
    status = status ?? Rx("Saving");
    xQuanJeanxAo =
        xQuanJeanxAo ?? Rx("10xQuan Jean; 10xAo so mi; 10xThat lung da");
    hangOnWashing = hangOnWashing ?? Rx("Hang On, Washing");
    price = price ?? Rx("Box | 50x50x100 | 20kg");
    day = day ?? Rx("10000đ / day ");
    startat = startat ?? Rx("Start at: 20/12/2023");
    id = id ?? Rx("");
  }

  Rx<String>? id;

  Rx<String>? widget;

  Rx<String>? status;

  Rx<String>? xQuanJeanxAo;

  Rx<String>? hangOnWashing;

  Rx<String>? price;

  Rx<String>? day;

  Rx<String>? startat;

  Rx<String>? id;
}
