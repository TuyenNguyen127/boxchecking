import '../../../../core/app_export.dart';

/// This class is used in the [view_item_widget] screen.
class ViewItemModel {
  ViewItemModel({
    this.createRequest,
    this.id,
  }) {
    createRequest = createRequest ?? Rx("Create request");
    id = id ?? Rx("");
  }

  Rx<String>? createRequest;

  Rx<String>? id;
}
