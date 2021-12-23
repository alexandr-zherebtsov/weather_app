import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/domain/responses/weather_response.dart';
import 'package:weather_app/features/main_screen/widgets/main_widgets.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';
import 'package:weather_app/shared/design_system/colors.dart';
import 'package:weather_app/shared/utils/utils.dart';

Widget buildDayHourlyWeatherView({
  required int viewIndex,
  required List<Hourly> weatherHourly,
  required List<Daily> weatherByDay,
}) {
  switch (viewIndex) {
    case 0:
      return weatherHourly.isEmpty ? const Offstage() : _buildWeatherView(
        header: AppStringsKeys.hourlyWeather.tr,
        children: weatherHourly.map((e) => _buildWeatherItem(
          head: getTimeHour(e.dt),
          temp: e.temp,
          icon: e.weather?[0].icon,
          weather: e.weather?[0].main?? '',
        )).toList(),
      );
    case 1:
      return weatherByDay.isEmpty ? const Offstage() : _buildWeatherView(
        header: AppStringsKeys.weatherByDay.tr,
        children: weatherByDay.map((e) => _buildWeatherItem(
          head: getDayAndMonth(e.dt),
          temp: e.temp?.day,
          icon: e.weather?[0].icon,
          weather: e.weather?[0].main?? '',
        )).toList(),
      );
    default:
      return const Offstage();
  }
}

Widget _buildWeatherView({
  required String header,
  required List<Widget> children,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 42.0, left: 16.0, bottom: 12.0),
        child: Text(
          header,
          style: Get.theme.textTheme.headline3,
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: children,
          ),
        ),
      ),
    ],
  );
}

Widget _buildWeatherItem({
  required String head,
  required double? temp,
  required String? icon,
  required String weather,
}) {
  return Container(
    clipBehavior: Clip.hardEdge,
    margin: const EdgeInsets.all(6.0),
    padding: const EdgeInsets.all(4.0),
    decoration: const BoxDecoration(
      color: AppColors.lightGray_1,
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    constraints: const BoxConstraints(
      minWidth: 110,
      minHeight: 150,
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            head,
            style: Get.theme.textTheme.bodyText1,
          ),
        ),
        buildTempText(temp),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: buildWeatherIcon(icon),
        ),
        Text(
          weather.toLowerCase(),
          style: Get.theme.textTheme.bodyText1,
        ),
      ],
    ),
  );
}
