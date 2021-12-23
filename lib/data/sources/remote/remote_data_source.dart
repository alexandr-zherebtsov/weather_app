import 'package:weather_app/domain/requests/weather_request.dart';
import 'package:weather_app/domain/responses/weather_response.dart';

abstract class RemoteDataSource {
  Future<WeatherResponse?> getWeather(WeatherRequest data);
}
