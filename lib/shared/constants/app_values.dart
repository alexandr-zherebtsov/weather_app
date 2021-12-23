import 'package:weather_app/domain/models/location_model.dart';

class AppValues {
  /// base url
  static const String baseUrl = 'https://api.openweathermap.org';

  /// img url
  static const String imgUrl = 'http://openweathermap.org/img/w/';

  /// png
  static const String png = '.png';

  /// GitHub url
  static const String gitHubUrl = 'https://github.com/alexandr-zherebtsov';

  /// Flutter url
  static const String flutterUrl = 'https://flutter.dev';

  /// en lang code
  static const String langCodeEn = 'en';

  /// ru lang code
  static const String langCodeRu = 'ru';

  /// basic lang code
  static const String langCodeBasic = langCodeEn;

  /// symbol Celsius '°C'
  static const String symbolCelsius = '°C';

  /// api key
  static const String apiKey = '15860d66bb940233e9dd3c943f17139f';

  /// default location Kyiv
  static final LocationModel defaultLocation = LocationModel(
    country: 'Ukraine',
    city: 'Kyiv',
    latitude: 50.450001,
    longitude: 30.523333,
  );

}
