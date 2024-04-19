// import 'package:lastapp/core/app_export.dart';
// import '../../../core/app_export.dart';
// import 'row1_item_model.dart';
// import 'seventytwo_item_model.dart';

// /// This class defines the variables used in the [operate_page],
// /// and is typically used to hold data that is passed between different parts of the application.
// class OperateModel {
//   Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
//     SelectionPopupModel(
//       id: 1,
//       title: "14 days ago",
//       isSelected: true,
//     ),
//     SelectionPopupModel(
//       id: 2,
//       title: "1 month ago",
//     ),
//     SelectionPopupModel(
//       id: 3,
//       title: "3 months ago",
//     )
//   ]);

//   Rx<List<Row1ItemModel>> row1ItemList = Rx([
//     Row1ItemModel(createRequest: "Create request".obs),
//     Row1ItemModel(createRequest: "Create request".obs),
//     Row1ItemModel(createRequest: "Create request".obs),
//     Row1ItemModel(createRequest: "Create request".obs)
//   ]);

//   Rx<List<SeventytwoItemModel>> seventytwoItemList = Rx([
//     SeventytwoItemModel(
//         id: "ID".obs,
//         widget: "33589549623491-001".obs,
//         status: "Saving".obs,
//         commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
//         service: "Hang On, Washing".obs,
//         model: "Box | 50x50x100 | 20kg".obs,
//         price: "10000đ / day ".obs,
//         startat: "Start at: 20/12/2023".obs),
//     SeventytwoItemModel(
//         id: "ID".obs,
//         widget: "33589549623491-002".obs,
//         status: "Saving".obs,
//         commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
//         service: "Hang On, Washing".obs,
//         model: "Box | 50x50x100 | 20kg".obs,
//         price: "10000đ / day ".obs,
//         startat: "Start at: 20/12/2023".obs),
//     SeventytwoItemModel(
//         id: "ID".obs,
//         widget: "33589549623491-003".obs,
//         status: "Saving".obs,
//         commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
//         service: "Hang On, Washing".obs,
//         model: "Bag | 50x150 | 20kg".obs,
//         price: "10000đ / day ".obs,
//         startat: "Start at: 20/12/2023".obs),
//     SeventytwoItemModel(
//         id: "ID".obs,
//         widget: "33589549623491-004".obs,
//         status: "Saving".obs,
//         commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
//         service: "Hang On, Washing".obs,
//         model: "Box | 50x50x100 | 20kg".obs,
//         price: "10000đ / day ".obs,
//         startat: "Start at: 20/12/2023".obs),
//     SeventytwoItemModel(
//         id: "ID".obs,
//         widget: "33589549623491-005".obs,
//         status: "Saving".obs,
//         commodity: "10xQuan Jean; 10xAo so mi; 10xThat lung da".obs,
//         service: "Hang On, Washing".obs,
//         model: "Box | 50x50x100 | 20kg".obs,
//         price: "10000đ / day ".obs,
//         startat: "Start at: 20/12/2023".obs),
//   ]);
// }

class OperateItemModel {
  int id;
  String status;
  String dimension;
  String service;
  String model;
  String pricePerDay;
  String startAt;

  OperateItemModel({
    required this.id,
    required this.status,
    required this.dimension,
    required this.service,
    required this.model,
    required this.pricePerDay,
    required this.startAt,
  });
}
