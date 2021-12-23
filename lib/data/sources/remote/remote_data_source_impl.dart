import 'dart:developer';

import 'package:get/get.dart';
import 'package:weather_app/data/sources/remote/remote_data_source.dart';
import 'package:weather_app/domain/requests/weather_request.dart';
import 'package:weather_app/domain/responses/weather_response.dart';
import 'package:weather_app/shared/core/network/dio_manager.dart';

class RemoteDataSourceImpl extends RemoteDataSource {
  final DioManager dio = Get.find<DioManager>();

  @override
  Future<WeatherResponse?> getWeather(WeatherRequest data) async {
    WeatherResponse? res;
    try {
      await dio.get(
        '/data/2.5/onecall',
        json: data.toJson(),
      ).then((response) {
        if (response.data != null) {
          res = WeatherResponse.fromJson(response.data);
        } else {
          log('response.data == null');
        }
      });
    } catch (e) {
      log(e.toString());
    }
    return res;
  }
}
