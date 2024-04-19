import 'package:get/get.dart';
import '../presentation/home_container_screen/home_container_screen.dart';
import '../presentation/home_container_screen/binding/home_container_binding.dart';
import '../presentation/order_new_box/onb_oderbox_screen/onb_oderbox_screen.dart';
import '../presentation/order_new_box/onb_oderbox_screen/binding/onb_oderbox_binding.dart';
import '../presentation/order_new_box/onb_address_screen/onb_address_screen.dart';
import '../presentation/order_new_box/onb_address_screen/binding/onb_address_binding.dart';
import '../presentation/order_new_box/onb_checking_and_payment_screen/onb_checking_and_payment_screen.dart';
import '../presentation/order_new_box/onb_checking_and_payment_screen/binding/onb_checking_and_payment_binding.dart';
import '../presentation/order_details/order_details_page.dart';
import '../presentation/request/type_request_screen/type_request_screen.dart';
import '../presentation/request/type_request_screen/binding/type_request_binding.dart';
import '../presentation/send_box_to_warehouse/send_box_choose_box_screen/send_box_choose_box_screen.dart';
import '../presentation/send_box_to_warehouse/send_box_choose_box_screen/binding/send_box_choose_box_binding.dart';
import '../presentation/send_box_to_warehouse/send_box_address_screen/send_box_address_screen.dart';
import '../presentation/send_box_to_warehouse/send_box_address_screen/binding/send_box_address_binding.dart';
import '../presentation/send_box_to_warehouse/send_box_checking_and_payment_screen/send_box_checking_and_payment_screen.dart';
import '../presentation/send_box_to_warehouse/send_box_checking_and_payment_screen/binding/send_box_checking_and_payment_binding.dart';
import '../presentation/get_back/get_back_choose_box_screen/get_back_choose_box_screen.dart';
import '../presentation/get_back/get_back_choose_box_screen/binding/get_back_choose_box_binding.dart';
import '../presentation/get_back/get_back_address_screen/get_back_address_screen.dart';
import '../presentation/get_back/get_back_checking_and_payment_screen/get_back_checking_and_payment_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homePage = '/home_page';

  static const String sendPage = '/send_page';

  static const String recivedPage = '/recived_page';

  static const String recivedTabContainerPage = '/recived_tab_container_page';

  static const String operatePage = '/operate_page';

  static const String settingPage = '/setting_page';

  static const String onbOderboxScreen = '/onb_oderbox_screen';

  static const String onbAddressScreen = '/onb_address_screen';

  static const String onbCheckingAndPaymentScreen =
      '/onb_checking_and_payment_screen';

  static const String typeRequestScreen = '/type_request_screen';

  static const String sendBoxChooseBoxScreen = '/send_box_choose_box_screen';

  static const String sendBoxAddressScreen = '/send_box_address_screen';

  static const String sendBoxCheckingAndPaymentScreen =
      '/send_box_checking_and_payment_screen';

  static const String getBackChooseBoxScreen = '/get_back_choose_box_screen';

  static const String getBackAddressScreen = '/get_back_address_screen';

  static const String getBackCheckingAndPaymentScreen =
      '/get_back_checking_and_payment_screen';

  static const String orderDetailsScreen = '/order_details_screen';

  static List<GetPage> pages = [
    GetPage(
      name: initialRoute,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
      bindings: [
        HomeContainerBinding(),
      ],
    ),
    GetPage(
      name: onbOderboxScreen,
      page: () => OnbOderboxScreen(),
      bindings: [
        OnbOderboxBinding(),
      ],
    ),
    GetPage(
      name: onbAddressScreen,
      page: () => OnbAddressScreen(),
      bindings: [
        OnbAddressBinding(),
      ],
    ),
    GetPage(
      name: onbCheckingAndPaymentScreen,
      page: () => OnbCheckingAndPaymentScreen(),
      bindings: [
        OnbCheckingAndPaymentBinding(),
      ],
    ),
    GetPage(
      name: typeRequestScreen,
      page: () => TypeRequestScreen(),
      bindings: [
        TypeRequestBinding(),
      ],
    ),
    GetPage(
      name: sendBoxChooseBoxScreen,
      page: () => SendBoxChooseBoxScreen(),
      bindings: [
        SendBoxChooseBoxBinding(),
      ],
    ),
    GetPage(
      name: sendBoxAddressScreen,
      page: () => SendBoxAddressScreen(),
      bindings: [
        SendBoxAddressBinding(),
      ],
    ),
    GetPage(
      name: sendBoxCheckingAndPaymentScreen,
      page: () => SendBoxCheckingAndPaymentScreen(),
      bindings: [
        SendBoxCheckingAndPaymentBinding(),
      ],
    ),
    GetPage(
      name: getBackChooseBoxScreen,
      page: () => GetBackChooseBoxScreen(),
      bindings: [
        GetBackChooseBoxBinding(),
      ],
    ),
    GetPage(
      name: getBackAddressScreen,
      page: () => GetBackAddressScreen(),
      // bindings: [
      //   GetBackAddressBinding(),
      // ],
    ),
    GetPage(
      name: getBackCheckingAndPaymentScreen,
      page: () => GetBackCheckingAndPaymentScreen(),
      // bindings: [
      //   GetBackCheckingAndPaymentBinding(),
      // ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    // GetPage(
    //   name: orderDetailsScreen,
    //   page: () => OrderDetailsScreen(),
    //   // bindings: [
    //   //   AppNavigationBinding(),
    //   // ],
    // ),
  ];
}
