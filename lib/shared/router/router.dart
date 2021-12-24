import 'package:get/get.dart';
import 'package:weather_app/features/about_app/about_app_screen.dart';
import 'package:weather_app/features/main/main_screen.dart';
import 'package:weather_app/features/splash/splash_screen.dart';
import 'package:weather_app/shared/bindings/about_app_binding.dart';
import 'package:weather_app/shared/bindings/main_binding.dart';
import 'package:weather_app/shared/bindings/splash_binding.dart';
import 'package:weather_app/shared/router/route_paths.dart';

class AppRouter {
  static const String init = RoutePaths.splashScreen;

  static final routes = <GetPage>[
    GetPage(
      name: RoutePaths.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutePaths.mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RoutePaths.aboutAsScreen,
      page: () => const AboutAppScreen(),
      binding: AboutAppBinding(),
    ),
  ];
}
