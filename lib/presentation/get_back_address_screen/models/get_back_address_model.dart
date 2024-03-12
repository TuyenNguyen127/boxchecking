import '../../../core/app_export.dart';

/// This class defines the variables used in the [get_back_address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class GetBackAddressModel {
  Rx<DateTime>? selectedDate = Rx(DateTime.now());

  Rx<String> date = Rx("Date ");
}
