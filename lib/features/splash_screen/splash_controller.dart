import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/data/sources/local/preference.dart';
import 'package:weather_app/domain/models/location_model.dart';
import 'package:weather_app/domain/requests/weather_request.dart';
import 'package:weather_app/domain/responses/weather_response.dart';
import 'package:weather_app/shared/constants/app_values.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:weather_app/shared/router/route_paths.dart';
import 'package:weather_app/shared/utils/utils.dart';

class SplashController extends GetxController {
  final Preferences _pref = Get.find<Preferences>();
  final WeatherRepository _weatherRepository = Get.find<WeatherRepository>();

  @override
  void onInit() async {
    super.onInit();
    await _pref.openBox();
    final ConnectivityResult conRes = await (Connectivity().checkConnectivity());
    if (conRes == ConnectivityResult.mobile || conRes == ConnectivityResult.wifi) {
      await getCurrentLocation();
      await getWeather();
    }
    await futureDelayed(milliseconds: 2200);
    navToMain();
  }

  Future<void> getCurrentLocation() async {
    try {
      // get location permission
      await Permission.location.request();
      if (await Permission.location.isGranted) {
        // get current position
        final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        // get first place
        final List<Placemark> placeMarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
          localeIdentifier: getLangCode(),
        );
        if (placeMarks.isNotEmpty) {
          final LocationModel location = LocationModel(
            country: placeMarks[0].country ?? AppStringsKeys.notSpecified.tr,
            city: placeMarks[0].locality ?? AppStringsKeys.notSpecified.tr,
            latitude: position.latitude,
            longitude: position.longitude,
          );
          await _pref.setCurrentLocation(location.toJson());
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getWeather() async {
    try {
      // get current location from pref
      final Map<String, dynamic>? locationJson = await _pref.getCurrentLocation();
      if (locationJson != null) {
        final LocationModel location = LocationModel.fromJson(locationJson);

        // get weather
        final WeatherRequest data = WeatherRequest(
          lat: location.latitude,
          lon: location.longitude,
          lang: getLangCode(),
          appid: AppValues.apiKey,
        );

        final WeatherResponse? weather = await _weatherRepository.getWeather(data);
        if (weather != null) {
          // set last weather
          await _pref.setLastWeather(weather.toJson());
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void navToMain() => Get.offAllNamed(RoutePaths.mainScreen);
}
