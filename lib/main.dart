import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:weather_app/shared/core/localization/translations.dart';
import 'package:weather_app/shared/design_system/themes.dart';
import 'package:weather_app/shared/bindings/global_binding.dart';
import 'package:weather_app/shared/router/router.dart';
import 'package:weather_app/shared/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      initialRoute: AppRouter.init,
      getPages: AppRouter.routes,
      initialBinding: GlobalBinding(),
      translations: Translation(),
      locale: Locale(getLangCode()),
      debugShowCheckedModeBanner: false,
      title: AppStringsKeys.appName.tr,
      theme: AppThemes.light,
    );
  }
}

