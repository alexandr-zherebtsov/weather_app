import 'package:weather_app/domain/requests/weather_request.dart';
import 'package:weather_app/domain/responses/weather_response.dart';
import 'package:weather_app/shared/core/base/base_repository.dart';

abstract class WeatherRepository extends BaseRepository {
  Future<WeatherResponse?> getWeather(WeatherRequest data);
}
