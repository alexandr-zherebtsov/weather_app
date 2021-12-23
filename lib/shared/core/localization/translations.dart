import 'package:get/get.dart';
import 'package:weather_app/shared/constants/app_values.dart';
import 'package:weather_app/shared/core/localization/languages/en.dart';
import 'package:weather_app/shared/core/localization/languages/ru.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    AppValues.langCodeEn: en,
    AppValues.langCodeRu: ru,
  };
}
