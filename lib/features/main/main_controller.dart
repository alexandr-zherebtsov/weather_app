import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app/data/sources/local/preference.dart';
import 'package:weather_app/domain/models/location_model.dart';
import 'package:weather_app/domain/responses/weather_response.dart';
import 'package:weather_app/shared/constants/app_values.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:weather_app/shared/design_system/widgets.dart';
import 'package:weather_app/shared/router/route_paths.dart';

class MainController extends GetxController {
  final Preferences _pref = Get.find<Preferences>();
  late List<PopUpModel> popUpItems;

  WeatherResponse? weather;
  LocationModel? location;

  bool _screenLoader = false;
  bool get screenLoader => _screenLoader;
  set screenLoader(bool isScreenLoader) {
    _screenLoader = isScreenLoader;
    update();
  }

  bool _screenError = false;
  bool get screenError => _screenError;
  set screenError(bool isScreenLoader) {
    _screenError = isScreenLoader;
    update();
  }

  int _viewIndex = 0;
  int get viewIndex => _viewIndex;
  set viewIndex(int viewIndex) {
    _viewIndex = viewIndex;
    update();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    screenLoader = true;
    widgetInitializer();
    try {
      await Future.wait([
        getLastWeather(),
        getCurrentLocation(),
      ]);
    } catch (e) {
      log(e.toString());
      screenError = true;
    }
    screenLoader = false;
  }

  void widgetInitializer() {
    popUpItems = <PopUpModel>[
      PopUpModel(title: AppStringsKeys.hourlyWeather.tr, func: () => hourlyWeather()),
      PopUpModel(title: AppStringsKeys.weatherByDay.tr, func: () => weatherByDay()),
    ];
  }

  Future<void> getCurrentLocation() async {
    String? res = await _pref.getCurrentLocation();
    if (res != null) {
      location = LocationModel.fromJson(jsonDecode(res));
    } else {
      location = AppValues.defaultLocation;
    }
  }

  Future<void> getLastWeather() async {
    String? res = await _pref.getLastWeather();
    if (res != null) {
      weather = WeatherResponse.fromJson(jsonDecode(res));
    } else {
      screenError = true;
    }
  }

  void hourlyWeather() => viewIndex = 0;
  void weatherByDay() => viewIndex = 1;

  void navToAboutAs() => Get.toNamed(RoutePaths.aboutAsScreen);

  Future<void> refreshScreen() async {
    Get.offAllNamed(RoutePaths.splashScreen);
  }

}
