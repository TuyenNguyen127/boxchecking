import '../../../core/app_export.dart';
import 'requesttype_item_model.dart';
import 'view_item_model.dart';

/// This class defines the variables used in the [home_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<RequesttypeItemModel>> requesttypeItemList = Rx([
    RequesttypeItemModel(
        newrequest: ImageConstant.imgTelevision.obs,
        newrequest1: ImageConstant.imgClose.obs,
        newRequest2: "New \nrequest".obs),
    RequesttypeItemModel(newRequest2: "Checking order".obs)
  ]);

  Rx<List<ViewItemModel>> viewItemList = Rx([
    ViewItemModel(createRequest: "Create request".obs),
    ViewItemModel(createRequest: "Create request".obs),
    ViewItemModel(createRequest: "Create request".obs),
    ViewItemModel(createRequest: "Create request".obs),
    ViewItemModel(createRequest: "Create request".obs),
    ViewItemModel(createRequest: "Create request".obs),
    ViewItemModel(createRequest: "Create request".obs),
    ViewItemModel(createRequest: "More services".obs)
  ]);
}
