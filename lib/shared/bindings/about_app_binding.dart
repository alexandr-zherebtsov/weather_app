import 'package:get/get.dart';
import 'package:weather_app/features/about_app_screen/about_app_controller.dart';

class AboutAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutAppController>(() => AboutAppController());
  }
}
