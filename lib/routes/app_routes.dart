import 'package:get/get.dart';
import 'package:lastapp/presentation/authen_page/forgot_pass/forgot_pass.dart';
import 'package:lastapp/presentation/authen_page/login/login.dart';
import 'package:lastapp/presentation/authen_page/register/register.dart';
import 'package:lastapp/presentation/main_pages/home_page/home_page.dart';
import '../presentation/home_container/home_container_screen.dart';
import '../presentation/features/order_new_box/payment_screen/onb_checking_and_payment_screen.dart';
import '../presentation/features/order_new_box/order_box_screen/onb_orderbox_screen.dart';
import '../presentation/features/order_new_box/address_screen/onb_address_screen.dart';
import '../presentation/features/order_new_box/address_screen/binding/onb_address_binding.dart';
import '../presentation/features/send_box_to_warehouse/choose_box_screen/send_box_choose_box_screen.dart';
import '../presentation/features/send_box_to_warehouse/choose_box_screen/binding/send_box_choose_box_binding.dart';
import '../presentation/features/send_box_to_warehouse/address_screen/send_box_address_screen.dart';
import '../presentation/features/send_box_to_warehouse/address_screen/binding/send_box_address_binding.dart';
import '../presentation/features/send_box_to_warehouse/payment_screen/send_box_checking_and_payment_screen.dart';
import '../presentation/features/send_box_to_warehouse/payment_screen/binding/send_box_checking_and_payment_binding.dart';
import '../presentation/features/get_back/choose_box_screen/get_back_choose_box_screen.dart';
import '../presentation/features/get_back/choose_box_screen/binding/get_back_choose_box_binding.dart';
import '../presentation/features/get_back/address_screen/get_back_address_screen.dart';
import '../presentation/features/get_back/payment_screen/get_back_checking_and_payment_screen.dart';

class AppRoutes {
  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String loginRoute = '/loginRoute';
  static const String registerRoute = '/registerRoute';
  static const String forgotPasswordRoute = '/forgotPasswordRoute';

  static const String homeContainerScreen = '/home_container_screen';

  static const String homePage = '/home_page';

  static const String sendPage = '/send_page';

  static const String recivedPage = '/recived_page';

  static const String recivedTabContainerPage = '/recived_tab_container_page';

  static const String operatePage = '/operate_page';

  static const String settingPage = '/setting_page';

  static const String onbOrderboxScreen = '/onb_oderbox_screen';

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
      name: loginRoute,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: registerRoute,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: forgotPasswordRoute,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: initialRoute,
      page: () => HomeContainerScreen(),
      // bindings: [
      //   HomeContainerBinding(),
      // ],
    ),
    GetPage(
      name: homeContainerScreen,
      page: () => HomeContainerScreen(),
    ),
    GetPage(
      name: onbOrderboxScreen,
      page: () => OnbOrderboxScreen(),
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
    ),
    GetPage(
      name: getBackCheckingAndPaymentScreen,
      page: () => GetBackCheckingAndPaymentScreen(),
    ),
    // GetPage(
    //   name: appNavigationScreen,
    //   page: () => AppNavigationScreen(),
    //   bindings: [
    //     AppNavigationBinding(),
    //   ],
    // ),
    // GetPage(
    //   name: orderDetailsScreen,
    //   page: () => OrderDetailsScreen(),
    //   // bindings: [
    //   //   AppNavigationBinding(),
    //   // ],
    // ),
  ];
}
