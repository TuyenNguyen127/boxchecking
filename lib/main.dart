import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:lastapp/service/authen/auth_service.dart';
import 'package:lastapp/helpers/hive_helper.dart';
import 'core/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase section
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDhkkj9d6tZqvhBLFjLVuWv2XAYGSLv14E",
      appId: "1:887685913398:web:a608f0b24b6b41c04a7197",
      messagingSenderId: "887685913398",
      projectId: "delivery-flutter-85e79",
      authDomain: "delivery-flutter-85e79.firebaseapp.com",
      storageBucket: "delivery-flutter-85e79.appspot.com",
    ),
  );

  // // hive section
  // await Hive.initFlutter();
  // HiveHelper.registerAdapters();

  // // open box
  // // box user accounts
  // await HiveHelper.openUserAccounts();

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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //
  Future getUserInfo() async {
    await getUser();

    setState(() {});

    print("uid ${uid}");
  }

  @override
  void initState() {
    getUserInfo();

    // TODO: implement initState
    super.initState();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        translations: AppLocalization(),
        locale: Get.deviceLocale, //for setting localization strings
        fallbackLocale: const Locale('en', 'US'),
        title: 'lastapp',
        initialBinding: InitialBindings(),
        // initialRoute: AppRoutes.loginRoute,
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages,
      );
    });
  }
}
