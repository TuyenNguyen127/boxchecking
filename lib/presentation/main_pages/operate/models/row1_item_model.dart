import '../../../../core/app_export.dart';

/// This class is used in the [row1_item_widget] screen.
class Row1ItemModel {
  Row1ItemModel({
    this.createRequest,
    this.id,
  }) {
    createRequest = createRequest ?? Rx("Create request");
    id = id ?? Rx("");
  }

  Rx<String>? createRequest;

  Rx<String>? id;
}
