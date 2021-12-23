import 'package:weather_app/data/repositories/weather/weather_repository.dart';
import 'package:weather_app/data/sources/remote/remote_data_source.dart';
import 'package:weather_app/domain/requests/weather_request.dart';
import 'package:weather_app/domain/responses/weather_response.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final RemoteDataSource _remoteDataSource;

  WeatherRepositoryImpl(this._remoteDataSource);

  @override
  Future<WeatherResponse?> getWeather(WeatherRequest data) {
    return _remoteDataSource.getWeather(data);
  }
}