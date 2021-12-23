import 'package:get/get.dart';
import 'package:weather_app/data/sources/local/preference.dart';
import 'package:weather_app/shared/core/network/dio_manager.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Preferences>(() => Preferences(), fenix: true);
    Get.lazyPut<DioManager>(() => DioManager(), fenix: true);
  }
}
