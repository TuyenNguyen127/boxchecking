import '../../../../../core/app_export.dart';

/// This class defines the variables used in the [onb_address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnbAddressModel {
  Rx<DateTime>? selectedDate = Rx(DateTime.now());

  Rx<String> date = Rx("Date ");
}
