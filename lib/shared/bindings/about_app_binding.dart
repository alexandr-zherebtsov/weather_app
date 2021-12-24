import 'package:get/get.dart';
import 'package:weather_app/features/about_app/about_app_controller.dart';

class AboutAppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutAppController>(() => AboutAppController());
  }
}
