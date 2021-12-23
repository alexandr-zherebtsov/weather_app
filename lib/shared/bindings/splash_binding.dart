import 'package:get/get.dart';
import 'package:weather_app/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/data/repositories/weather/weather_repository_impl.dart';
import 'package:weather_app/data/sources/remote/remote_data_source.dart';
import 'package:weather_app/data/sources/remote/remote_data_source_impl.dart';
import 'package:weather_app/features/splash_screen/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(), fenix: true);
    Get.lazyPut<WeatherRepository>(() => WeatherRepositoryImpl(Get.find<RemoteDataSource>()), fenix: true);
  }
}
