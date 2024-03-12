import 'package:lastapp/core/app_export.dart';
import '../../../core/app_export.dart';
import 'row1_item_model.dart';
import 'seventytwo_item_model.dart';

/// This class defines the variables used in the [operate_page],
/// and is typically used to hold data that is passed between different parts of the application.
class OperateModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<Row1ItemModel>> row1ItemList = Rx([
    Row1ItemModel(createRequest: "Create request".obs),
    Row1ItemModel(createRequest: "Create request".obs),
    Row1ItemModel(createRequest: "Create request".obs),
    Row1ItemModel(createRequest: "Create request".obs)
  ]);

  Rx<List<SeventytwoItemModel>> seventytwoItemList = Rx([
    SeventytwoItemModel(
        id: "ID".obs,
        widget: "33589549623491-001".obs,
        status: "Saving".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        hangOnWashing: "Hang On, Washing".obs,
        price: "Box | 50x50x100 | 20kg".obs,
        day: "10000đ / day ".obs,
        startat: "Start at: 20/12/2023".obs),
    SeventytwoItemModel(
        id: "ID".obs,
        widget: "33589549623491-002".obs,
        status: "Saving".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        hangOnWashing: "Hang On, Washing".obs,
        price: "Box | 50x50x100 | 20kg".obs,
        day: "10000đ / day ".obs,
        startat: "Start at: 20/12/2023".obs),
    SeventytwoItemModel(
        id: "ID".obs,
        widget: "33589549623491-003".obs,
        status: "Saving".obs,
        xQuanJeanxAo: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
        hangOnWashing: "Hang On, Washing".obs,
        price: "Bag | 50x150 | 20kg".obs,
        day: "10000đ / day ".obs,
        startat: "Start at: 20/12/2023".obs)
  ]);
}
