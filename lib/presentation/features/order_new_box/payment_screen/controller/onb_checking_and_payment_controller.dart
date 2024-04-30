import '../../../../../core/app_export.dart';
import '../models/onb_checking_and_payment_model.dart';

/// A controller class for the OnbCheckingAndPaymentScreen.
///
/// This class manages the state of the OnbCheckingAndPaymentScreen, including the
/// current onbCheckingAndPaymentModelObj
class OnbCheckingAndPaymentController extends GetxController {
  Rx<OnbCheckingAndPaymentModel> onbCheckingAndPaymentModelObj =
      OnbCheckingAndPaymentModel().obs;

  Rx<bool> agreethetermsofuse = false.obs;

  // Future<bool> submitStoryItem(postId) async {
  //   try {
  //     for (StoryAddItemModel item in storyItems) {
  //         // Dio.FormData formdata = Dio.FormData.fromMap({
  //         //   "story_desc": item.textEditingController.value.text, //required
  //         //   "story_images": [await Dio.MultipartFile.fromFile(item.imagePath)],
  //         //   'remove_images': '',
  //         // });

  //         AuthBaseResponseModel response = await Provider.dio(
  //             method: 'POST',
  //             url: 'add url here',
  //             requestModel: formdata);

  //         switch (response.statusCode) {
  //           case 200:
  //           case 201:
  //             result = true;

  //             break;
  //           default:
  //             throw Exception(response.message);
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     Logger().d('[ERROR] $e');
  //     result = false;
  //   }

  //   return result;
  // }
}
