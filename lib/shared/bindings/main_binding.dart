import 'package:get/get.dart';
import 'package:weather_app/features/main_screen/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
