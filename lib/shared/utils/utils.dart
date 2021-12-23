import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/shared/constants/app_values.dart';
import 'package:weather_app/shared/core/localization/string_keys.dart';

void errorSnackBar({
  required String code,
  required String message,
}) {
  Get.snackbar(
    'Error Code: $code',
    'Error Message: $message',
    duration: const Duration(seconds: 3),
    snackPosition: SnackPosition.TOP,
    icon: const Icon(Icons.warning_amber_sharp),
    shouldIconPulse: true,
  );
}

String getWeatherImage(String? icon) {
  String res = '';
  if (icon != null) {
    if (icon.isNotEmpty) {
      res = AppValues.imgUrl + icon + AppValues.png;
    }
  }
  return res;
}

String kelvinToCelsius(double? kelvin) {
  if (kelvin == null) {
    return AppStringsKeys.notSpecified.tr;
  } else {
    return (kelvin - 273.15).toStringAsFixed(1);
  }
}

String getClearName(String? firstName, String? lastName, {comma = false}) {
  return (firstName ?? '') +
      (firstName == null ? '' : firstName.isEmpty ? '' : comma ? lastName == null ? '' : lastName.isEmpty ? '' : ', ' : ' ')
      + (lastName ?? '');
}

double? doubleParser(dynamic data) {
  try {
    final double? doubleResult = double.tryParse(data.toString());
    if (doubleResult != null) {
      return doubleResult;
    } else {
      final int? intResult = int.tryParse(data.toString());
      if (intResult != null) {
        return intResult.toDouble();
      } else {
        return null;
      }
    }
  } catch(_) {}
}

String getDayAndMonth(int? timestamp) {
  if (timestamp != null) {
    DateTime date = getDate(timestamp);
    return date.day.toString() + ' ' + getMonth(date);
  } else {
    return '';
  }
}

String getTimeHour(int? timestamp) {
  String time = '';
  if (timestamp != null) {
    try {
      DateTime date = getDate(timestamp);
      if (timestamp != 0) {
        time = date.hour.toString() + ':' + (
          date.minute.toString().length == 1 ? '0' + date.minute.toString() : date.minute.toString()
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
  return time;
}

DateTime getDate(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}

String getMonth(DateTime date) {
  switch (date.month) {
    case 1:
      return AppStringsKeys.jan.tr;
    case 2:
      return AppStringsKeys.feb.tr;
    case 3:
      return AppStringsKeys.mar.tr;
    case 4:
      return AppStringsKeys.apr.tr;
    case 5:
      return AppStringsKeys.may.tr;
    case 6:
      return AppStringsKeys.jun.tr;
    case 7:
      return AppStringsKeys.jul.tr;
    case 8:
      return AppStringsKeys.aug.tr;
    case 9:
      return AppStringsKeys.sept.tr;
    case 10:
      return AppStringsKeys.oct.tr;
    case 11:
      return AppStringsKeys.nov.tr;
    case 12:
      return AppStringsKeys.dec.tr;
    default:
      return '';
  }
}

String getLangCode() {
  switch (Get.deviceLocale?.languageCode?? AppValues.langCodeBasic) {
    case AppValues.langCodeRu:
      return AppValues.langCodeRu;
    case AppValues.langCodeEn:
      return AppValues.langCodeEn;
    default:
      return AppValues.langCodeBasic;
  }
}

Future<void> futureDelayed({int milliseconds = 1000}) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}
