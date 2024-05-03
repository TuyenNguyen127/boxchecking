import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:lastapp/helpers/hive_helper.dart';
import 'core/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // hive section
  await Hive.initFlutter();
  HiveHelper.registerAdapters();

  // open box
  // box user accounts
  await HiveHelper.openUserAccounts();

  await dotenv.load(fileName: ".env", mergeWith: {
    'TEST_VAR': '5',
  });

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: Locale('en', 'US'),
        title: 'lastapp',
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.loginRoute,
        // initialRoute: AppRoutes.registerRoute,
        getPages: AppRoutes.pages,
      );
    });
  }
}
