import '../../../core/app_export.dart';

/// This class is used in the [requesttype_item_widget] screen.
class RequesttypeItemModel {
  RequesttypeItemModel({
    this.newrequest,
    this.newrequest1,
    this.newRequest2,
    this.id,
  }) {
    newrequest = newrequest ?? Rx(ImageConstant.imgTelevision);
    newrequest1 = newrequest1 ?? Rx(ImageConstant.imgClose);
    newRequest2 = newRequest2 ?? Rx("New \nrequest");
    id = id ?? Rx("");
  }

  Rx<String>? newrequest;

  Rx<String>? newrequest1;

  Rx<String>? newRequest2;

  Rx<String>? id;
}
